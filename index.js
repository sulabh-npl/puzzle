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
    if (err) {
      console.log(err);
      connect();
      return;
    } else {
      console.log("Connected to mySQL!");
    }
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
      if (err) {
        console.log(err);
        connect();
        return;
      }
      if (result.length == 0) {
        return res.render("login", { msg: "Incorrect Email" });
      }
      bcrypt.compare(pass, result[0].password, async function (err, result1) {
        if (result1) {
          var session = req.session;
          session.user = email;
          session.name = result[0].name;
          session.isAdmin = result[0].isAdmin;
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
    if (err) {
      console.log(err);
      connect();
      return;
    }
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
  var name = req.session.name;
  res.render("index", { name: name });
});
app.get("/new", async (req, res) => {
  req.session.valid = 1;
  req.session.time = 0;
  req.session.lvl = -1;
  req.session.wrong = 0;
  req.session.game_id = 0;
  await con.query(
    `INSERT INTO game_stat (player_id) VALUES ('${req.session.user}')`
  );
  await con.query(
    `SELECT id FROM game_stat WHERE player_id='${req.session.user}' ORDER BY id DESC LIMIT 1`,
    function (err, result, fields) {
      if (err) {
        console.log(err);
        connect();
        return;
      }
      var id = result[0]["id"];
      req.session.game_id = id;
      console.log(req.session.game_id);
      console.log(req.session);
      res.redirect("/play");
    }
  );
});
app.get("/resume", async (req, res) => {
  req.session.valid = 1;
  await con.query(
    `SELECT * FROM game_stat WHERE player_id='${req.session.user}' AND stat <= 8 AND stat != -1 ORDER BY id DESC limit 1`,
    function (err, result, fields) {
      if (!result) {
        res.send("You have no pending record");
      }
      console.log(result);
      console.log(JSON.stringify(result));
      if (err) {
        console.log(err);
        connect();
        return;
      }
      console.log(fields);
      req.session.game_id = result[0]["id"];
      req.session.time = result[0]["total_time"];
      req.session.lvl = result[0]["stat"];
      req.session.wrong =
        result[0]["wrong1"] +
        result[0]["wrong2"] +
        result[0]["wrong3"] +
        result[0]["wrong5"] +
        result[0]["wrong7"] +
        0;

      res.redirect("/play");
    }
  );
});
app.get("/play", (req, res) => {
  if (req.session.valid == null) {
    res.redirect("/");
  }
  req.session.valid = null;
  console.log(req.session);
  res.render("game", {
    lvl: req.session.lvl,
    time: req.session.time,
    wrong: req.session.wrong,
  });
});
app.get("/maze", (req, res) => {
  res.render("maze", { time: req.session.time });
});

//puzzle
app.post("/question1", (req, res) => {
  if (req.body.answer.toLowerCase() == "lets go to school") {
    req.session.time = req.body.time;
    req.session.wrong = req.body.wrong;
    con.query(
      `UPDATE game_stat SET question1='${req.session.time}', wrong1= '${req.session.wrong}',total_time='${req.body.time}', stat= '1' WHERE id=${req.session.game_id}`
    );
    res.send({ result: true });
  } else {
    res.send({ result: false });
  }
});
app.post("/question2", (req, res) => {
  if (req.body.answer.toLowerCase() == "closet") {
    req.session.time = req.body.time - req.session.time;
    req.session.wrong = req.body.wrong - req.session.wrong;
    con.query(
      `UPDATE game_stat SET question2='${req.session.time}', wrong2= '${req.session.wrong}',total_time='${req.body.time}', stat= '2' WHERE id='${req.session.game_id}'`
    );
    res.send({ result: true });
  } else {
    res.send({ result: false });
  }
});
app.post("/question3", (req, res) => {
  if (req.body.answer.toLowerCase() == "welcome mat") {
    req.session.time = req.body.time - req.session.time;
    req.session.wrong = req.body.wrong - req.session.wrong;
    con.query(
      `UPDATE game_stat SET question3='${req.session.time}', wrong3= '${req.session.wrong}',total_time='${req.body.time}', stat= '3' WHERE id='${req.session.game_id}'`
    );
    res.send({ result: true });
  } else {
    res.send({ result: false });
  }
});
app.post("/question4", (req, res) => {
  req.session.time = req.body.time - req.session.time;
  con.query(
    `UPDATE game_stat SET question4=${req.session.time},total_time='${req.body.time}', stat= '4' WHERE id='${req.session.game_id}'`
  );
  req.session.valid = 1;
  res.send({ result: true });
});
app.post("/question5", async (req, res) => {
  var ans = ["1", "6", "7", "2", "3", "8", "4"];
  var ans_from = JSON.parse(req.body.answer);
  console.log(req.body.answer);
  for (i = 0; i < 7; i++) {
    if (ans_from[i] != ans[i]) {
      console.log(req.body.answer[i]);
      console.log(ans[i]);
      return res.send({ result: false });
    }
  }
  req.session.time = req.body.time - req.session.time;
  req.session.wrong = req.body.wrong - req.session.wrong;
  await con.query(
    `UPDATE game_stat SET question5='${req.session.time}', wrong5= '${req.session.wrong}',total_time='${req.body.time}', stat= '5' WHERE id='${req.session.game_id}'`
  );
  res.send({ result: true });
});
app.post("/question7", (req, res) => {
  if (
    req.body.answer.toLowerCase() ==
    "some are born great some achieve greatness and some have greatness thrust upon them"
  ) {
    req.session.time = req.body.time - req.session.time;
    req.session.wrong = req.body.wrong - req.session.wrong;
    con.query(
      `UPDATE game_stat SET question7='${req.session.time}', wrong7= '${req.session.wrong}',total_time='${req.body.time}', stat= '7' WHERE id='${req.session.game_id}'`
    );
    res.send({ result: true });
  } else {
    res.send({ result: false });
  }
});

app.post("/question8", (req, res) => {
  if (req.body.answer == "false") {
    console.log(req.body.answer + "app");
    req.session.time = req.body.time - req.session.time;
    con.query(
      `UPDATE game_stat SET total_time='${req.body.time}', stat= '8' WHERE id='${req.session.game_id}'`
    );
    res.send({ result: true });
  } else {
    con.query(
      `UPDATE game_stat SET total_time='${req.body.time}', stat= '-1' WHERE id='${req.session.game_id}' `
    );
    console.log(req.body.answer);
    res.send({ result: false });
  }
});
app.post("/out", (req, res) => {
  con.query(
    `UPDATE game_stat SET total_time='${req.body.time}', stat='-1' WHERE id='${req.session.game_id}'`
  );
  console.log("a");
  res.send("out");
});
