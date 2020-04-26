# Wormulator
A very basic earthworm movement simulation.

<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/worm.gif">
</p>

## Introduction
This program steps through progression of the development of an earthworm simulator. It shows four different worms that follow the user's mouse. 

## Why Worms
I've been thinking about worms a lot recently, mostly because one post-night-out, Uber ride home, me and my friend planned to have a Nightcrawler party where we give out goody bags of dirt. Each bag has a worm in it but one has a nightcrawler. Whoever had the nightcrawler bag was the winner of the night.

This was an exciting idea at the time. 

We had planned to do some joke version of this in the spring, but with quarantine (and also finding out that nightcrawler is just another name for an earthworm), the party had to be postponed. 

<p align="center">
  <img width="375" height="378.5" src="https://github.com/jmac97/Wormulator/blob/master/media/text3.png">
</p>

## Development
I researched earthworm locomotion (notes found in the "files" folder) and found that they move through waves of peristalis. They extend their body to reach forward, then contract it to anchor it. This motion follows in waves along the body. 

I started with a line of ellipses that follow the mouse. 
<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/first.gif">
</p>

I then adjusted the shape and had the ellipses follow the mouse less strictly.
<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/second.gif">
</p>

Then I created a series of extensions and contractions that moved along the body. The "head" of the worm does not move until X segment of the body has completed the cycle.
<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/third.gif">
</p>

Then I adjusted the shape and added irregular movements to the "head" to mimic wiggling/searching for the next anchor point. 
<p align="center">
  <img width="600" height="240" src="">
</p>

Getting the worm to contract to a slightly larger than "relaxed worm width" size was difficult and, although technically more correct, made the worm look less realistic. Adjusting things like this and other parameters to get better movement was surprisingly difficult. I am continuing to work on improving this model, but for now I need a break from worms. 

## Extra: Some Recent Worm Moments
<p align="center">
  <img width="375" height="160" src="https://github.com/jmac97/Wormulator/blob/master/media/text1.png">
</p>

##

<p align="center">
  <img width="375" height="263" src="https://github.com/jmac97/Wormulator/blob/master/media/text2.png">
</p>
