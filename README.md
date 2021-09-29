# Gilded Rose tech test

Makers Week 10 technical task to practice producing high quality code without strict time pressure.<br>
Intended to be similar to a technical take-home task as part of a hiring process.<br>
The solution is all my own work. 

## Installation

## Run tests

## Run program

## Requirements
AKA My interpretation of those in kata_bits/GildedRoseRequirements.txt
----------------

**Do not alter the Item class or Items property** (you can make the UpdateQuality method and Items property static if you like, we'll cover for you).
Can change UpdateQuality method

### Existing functionality
An Item has a sell_in value (days left to sell)
  After sell_in has passed, quality degrades twice as fast

An Item has a quality value (0-50 (or 80 for Sulfuras))

Each day value and sell_in lower
  Except "Aged Brie" & "Backstage passes" value increases as sell_in approaches
  BP -	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

"Sulfuras", being a legendary item, never has to be sold or decreases in Quality

### New functionality
	- "Conjured" items degrade in Quality twice as fast as normal items

## Focuses
* TDD
* OO design
* Code is readable
* Code is reliable
* Code is easy to maintain and change
* Self-review: Ability to assess code quality and improve my own code

## Plan, how I structured my code and why
I spent a short time reading through the files in the Ruby folder, and my plan of attach was this:
* Ensure system has good test in place for existing functionality
* Refactor existing functionality
* TDD new feature
