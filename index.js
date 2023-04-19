//Import Modules
const express = require("express");
var bodyParser = require("body-parser");
const mysql = require("mysql");
const session = require("express-session");
const jsonParser = bodyParser.json();
const bcrypt = require("bcrypt");
require("dotenv").config();

const app = express();
app.use(express.static(__dirname + "/frontend"));
app.use(bodyParser.urlencoded({ extended: false }));
app.use(
  session({
    secret: process.env.SESSION_SECRET_KEY,
    saveUninitialized: false,
    resave: false,
  })
);
app.set("view engine", "hbs");
let con; //for MySQL
async function connect() {
  con = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  });

  con.connect(function (err) {
    if (err) throw err;
    console.log("Connected to mySQL!");
  });
}
connect()
  .then(() => {
    app.listen(process.env.PORT || 5000);
    console.log("DB connected and server is running.");
  })
  .catch((err) => {
    console.log(err);
  });
function isLoggedOut(req, res, next) {
  if (req.session.user) {
    return res.redirect("/");
  }
  return next();
}
function isLoggedIn(req, res, next) {
  if (!req.session.user) {
    return res.redirect("/login");
  }
  return next();
}
app.get("/login", isLoggedOut, (req, res) => {
  return res.render("login");
});
app.post("/login", isLoggedOut, async (req, res) => {
  const email = req.body.email;
  const pass = req.body.password;

  con.query(
    `SELECT * FROM users WHERE email='${email}'`,
    function (err, result, fields) {
      if (err) throw err;
      if (result.length == 0) {
        return res.render("login", { msg: "Incorrect Email" });
      }
      bcrypt.compare(pass, result[0].password, async function (err, result) {
        if (result) {
          var session = req.session;
          session.user = email;
          session.name = result[0].name;
          return res.redirect("/");
        } else {
          return res.render("login", { msg: "Incorrect Password" });
        }
      });
    }
  );
});

app.get("/register", isLoggedOut, (req, res) => {
  return res.render("register");
});
app.post("/register", isLoggedOut, async (req, res) => {
  const email = req.body.email;
  const pass = req.body.password;
  const name = req.body.name;
  bcrypt.hash(pass, 10, async (err, result) => {
    if (err) throw err;
    await con.query(
      `SELECT * FROM users WHERE email='${email}'`,
      (err1, result1, fields) => {
        if (result1.length == 1) {
          return res.render("register", {
            msg: "User already exists from this email try loggin in",
          });
        }
      }
    );
    console.log("app");
    await con.query(
      `INSERT INTO users VALUES ('${email}','${result}', '${name}')`,
      (err, result, fields) => {
        if (!err) {
          var session = req.session;
          session.user = email;
          session.name = name;
          return res.redirect("/");
        }
      }
    );
  });
});
app.use(isLoggedIn);

app.get("/", (req, res) => {
  res.send("app");
});
