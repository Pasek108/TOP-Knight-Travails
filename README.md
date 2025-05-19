<h1 align="center">TOP-Knight-Travails - Readme</h1>
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
  * [Acknowledgements](#acknowledgements)
* [Details :scroll:](#details-scroll)
  * [User interface](#user-interface)
  * [Pathfinding algorithm](#pathfinding-algorithm)

<br>

# The Odin Project :thinking:

## What is it  
[The Odin Project](https://www.theodinproject.com) is a free, open-source curriculum that teaches web development from the ground up. It covers HTML, CSS, JavaScript, Ruby, Git, React, and back-end technologies like Node.js and Ruby on Rails, offering a structured path from beginner to job-ready developer. The curriculum includes hands-on projects, coding exercises, and real-world applications to reinforce learning.

## Is it worth doing  
The Odin Project is an excellent resource for self-taught developers looking for a structured and comprehensive learning path. It encourages active learning through projects and collaboration with the community. However, since it requires self-discipline and problem-solving skills, those who prefer guided instruction with direct mentorship might find it challenging.

<br>

# Overview :sparkles:

## About
This project is my solution for [Project: Knights Travails](https://www.theodinproject.com/lessons/ruby-knights-travails) on [Ruby Course](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) from [The Odin Project (TOP)](https://www.theodinproject.com) which is an open-source curriculum for learning full-stack web development.

<br>

![preview](/_for_readme/preview.png)

## Technologies
Languages:
- Ruby
  
Programs:
- [VSCode](https://code.visualstudio.com)
- [ShareX](https://getsharex.com)
- [GIMP](https://www.gimp.org)

## Features
### Project requirements
- ✅ Implement a `knight_moves` function that finds the shortest path between two squares.  
- ✅ Use Breadth-First Search (BFS) to explore valid knight moves.  
- ✅ Prevent moves that go off the board.  
- ✅ Output the full sequence of positions from start to end.  
- ✅ Allow multiple valid shortest paths as long as the rules are followed.  
- ✅ Provide clear feedback to the user, including number of moves and path taken.  

### Additions
- Prompting the user to input start and end positions or quit the program.
- Validate inputs and provide error messages for invalid entries.
- Graphical representation of the board and knight's path.

## Setup
- Download this repository
- Open folder in terminal
- Run `ruby ./lib/main.rb`

## Acknowledgements
- [Wikipedia - Box-drawing characters](https://en.wikipedia.org/wiki/Box-drawing_characters)

<br>

# Details :scroll:

## User interface

### Program start
When the program runs, an empty board is displayed for reference. The user is then prompted to input the start and end positions in the specified format, or enter 'q' to quit.
![program start](/_for_readme/UI/start.png)

If the user provides invalid input, an error message is displayed and the prompt appears again.
![wrong input](/_for_readme/UI/wrong_input.png)

---

### Answer
When valid positions are provided, the algorithm calculates the shortest path for the knight, visualizes it on the board, and prints the path.
![answer](/_for_readme/UI/answer.png)

## Pathfinding algorithm
The algorithm used to find the knight's path is a simple Breadth-First Search (BFS). It takes two positions: `from [x, y]` and `to [x, y]`, and returns the shortest sequence of knight moves between them.

```
1. Initialize a queue with the starting position and no parent: [[from x, from y, nil]].
2. Set the index to 0. While the index is within the bounds of the queue:
   - Check if the current position matches the target. If so, reconstruct and return the path.
   - Generate all 8 possible knight moves from the current position.
   - Filter out moves that are off the board or already visited.
   - Add the valid, unvisited moves to the queue, linking them to the current position as their parent.
   - Increment the index to continue processing the next position.
4. If the target is reached, backtrack using parent links to reconstruct the path.
5. Return the final path in reverse order so it starts from the initial position.
6. If the target is not found after processing all positions, return nil.
```
