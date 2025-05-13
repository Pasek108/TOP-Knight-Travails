<h1 align="center">TOP-Mastermind - Readme</h1>
<p align="center">
  <strong>
    My solution for project from <a href="https://www.theodinproject.com" target="_blank">The Odin Project (TOP)</a> full-stack curriculum
  </strong>
</p>
<div align="center">
  <a href="https://www.theodinproject.com">
    <img src="_for_readme/banner.png">
  </a>
</div>

<br>

# Table of Contents
* [The Odin Project :thinking:](#the-odin-project-thinking)
  * [What is it](#what-is-it)
  * [Is it worth doing](#is-it-worth-doing)
* [Overview :sparkles:](#overview-sparkles)
  * [About](#about)
  * [Features](#features)
  * [Technologies](#technologies)
  * [Setup](#setup)
* [Details :scroll:](#details-scroll)
  * [User interface](#user-interface)
  * [Swaszek algorithm](#swaszek-algorithm)

<br>

# The Odin Project :thinking:

## What is it  
[The Odin Project](https://www.theodinproject.com) is a free, open-source curriculum that teaches web development from the ground up. It covers HTML, CSS, JavaScript, Ruby, Git, React, and back-end technologies like Node.js and Ruby on Rails, offering a structured path from beginner to job-ready developer. The curriculum includes hands-on projects, coding exercises, and real-world applications to reinforce learning.

## Is it worth doing  
The Odin Project is an excellent resource for self-taught developers looking for a structured and comprehensive learning path. It encourages active learning through projects and collaboration with the community. However, since it requires self-discipline and problem-solving skills, those who prefer guided instruction with direct mentorship might find it challenging.

<br>

# Overview :sparkles:

## About
This project is my solution for [Project: Mastermind](https://www.theodinproject.com/lessons/ruby-mastermind) on [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) from [The Odin Project (TOP)](https://www.theodinproject.com) which is an open-source curriculum for learning full-stack web development. The computer codebreaker logic is implemented using the Swaszek algorithm.

<br>

![preview](/_for_readme/preview.png)

## Technologies
Languages:
- Ruby

Libraries:
- [Colorize](https://rubygems.org/gems/colorize/versions/1.1.0)
  
Programs:
- [VSCode](https://code.visualstudio.com)
- [ShareX](https://getsharex.com)
- [GIMP](https://www.gimp.org)

## Features
### Project requirements
- ✅ Option to play as codebreaker or codemaker.
- Codebreaker:
  - ✅ Computer generates a random 4-color code.
  - ✅ Player has 12 attempts to guess the code.
  - ✅ Feedback given after each guess (correct color/position).
- Codemaker:
  - ✅ Player sets the secret code.
  - ✅ Computer makes guesses using a basic or smarter strategy.
  - ✅ Player gives feedback.

## Setup
- Download this repository
- Open folder in terminal
- Run  `bundle install` and `ruby ./lib/main.rb`

<br>

# Details :scroll:

## User interface

### Game start  
When the game begins, the player is prompted to choose a role: guesser or codemaker.  
- If the player chooses to be the **guesser**, they will enter guesses to break the computer's code.
![codebreaker start](/_for_readme/UI/codebreaker_start.png)  
- If the player chooses to be the **codemaker**, they must provide a secret code for the AI to guess.
![codemaker start](/_for_readme/UI/codemaker_start.png)  


---

### Codebreaker 
As the codebreaker, in every turn the player must enter a 4-letter code to which computer provides feedback after each guess.  
![codebreaker game](/_for_readme/UI/codebreaker_game.png)  

If the player enters an invalid input (wrong letters or incorrect number of letters), an error message is shown and the player is prompted to try again.  
![codebreaker invalid](/_for_readme/UI/codebreaker_invalid.png)  

---

### Codemaker 
As the codemaker, the player enters a 4-letter secret code once. The computer then tries to guess the code, and the player must provide accurate feedback after each guess.  
![codemaker game](/_for_readme/UI/codemaker_game.png)  

If the player provides invalid feedback (inaccurate response, wrong letters or incorrect number of letters), an error message is shown and the player is prompted to try again.  
![codemaker invalid](/_for_readme/UI/codemaker_invalid.png)  

## Swaszek algorithm
The Swaszek algorithm is a simple strategy for solving the Mastermind game. It's not the most efficient, it doesn't try to minimize guesses, it just prunes invalid codes and guesses again at random, but it's easy to implement and almost always solves the puzzle in 5 turns or less. 

1. Generate all 1,296 possible codes (all 4-color combinations with repetition).
2. Randomly select an initial guess from the list of possible codes.
3. Compare the guess with the actual solution and get feedback (number of correct colors in correct/wrong positions).
4. Filter out any codes from the list that wouldn't produce the same feedback if they were the solution.
5. Use the same filtered list to select the next guess (again chosen at random).
6. Repeat the process until the correct code is found.
