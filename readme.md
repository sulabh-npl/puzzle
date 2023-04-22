
# Treasure Hunt Puzzle

The Interactive Puzzle Application is designed to assess the soft skills of users. It can be played by anyone by a simple registration.


## Soft Skills measured

- Attention to detail
- Planning of future
- Problem Solving
- Curiosity


## Features
#### From player's POV
- Registration
- Login
- Play New Game
- Resume Previous Unfinished Game


#### From admin's POV (visible at url '/dashboard')
- Data analytics through charts
- List of Players and their best performances in interactive table

## Check-list of features as per requirements
✅ Anyone with an email address can create an Id and password to participate in the game

✅ The puzzle must contain
- ✅ Minimum 5 clues (7 levels with clues)
- ✅ Minimum 2 dead-ends (5 Wrong attempts and one at last level)
- ✅ Minimum 1 solution  (Only 1 correct answer in each level)
✅ All the progress / user data (eg - time taken by each user for every step, solution accuracy, etc.) depending on your puzzle requirements should be stored for every user

✅ On refreshing, from either browser or website, the puzzle should start from the same step or give the user an option to restart

✅ A dashboard for the admin where the progress of all the users can be tracked & analyzed

✅ User analytics (eg - time taken by each user for every step, solution accuracy, etc.) depending on your puzzle should be stored and shown in the admin dashboard

✅ Data analysis using different graphs or tables

✅ User Leaderboard

## Deployment

To deploy this project run

```bash
  npm install
```
To start the project

```bash
  node index.js
```

## Demo

[Click here for demo](http://sulabh-assignment.ap-1.evennode.com/)


## Solutions
These are the solutions to the problems that will occur in game.
- lets go to school
- closet
- welcome mat
- Move the person to school(No fixed path)
- 1, 6, 7, 2, 3, 8, 4 Respectively
- Anything you enter is correct just a dummy phase to make it go  through school. Time spent in this section will not be added for analysis
- Some are born great some achieve greatness and some have greatness thrust upon them
- Dont check the checkbox (if checked its deadend)