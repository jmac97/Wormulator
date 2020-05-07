# Wormulator
A very basic earthworm movement simulation.

<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/worm.gif">
</p>

## Introduction
This program steps through progression of the development of an earthworm simulator. It shows four different worms that follow the user's mouse. 

1. Why Worms
2. Research
3. Development and Code Breakdown
4. Instructions for non-Processing Download
5. Extra: Some Recent Worm Moments

## Why Worms
I've been thinking about worms a lot recently, mostly because one post-night-out, Uber ride home, me and my friend planned to have a Nightcrawler party where we give out goody bags of dirt. Each bag has a worm in it but one has a nightcrawler. Whoever had the nightcrawler bag was the winner of the night.

This was an exciting idea at the time. 

We had planned to do some joke version of this in the spring, but with quarantine (and also finding out that nightcrawler is just another name for an earthworm), the party had to be postponed. 

<p align="center">
  <img width="375" height="378.5" src="https://github.com/jmac97/Wormulator/blob/master/media/text3.png">
</p>

## Research
I researched earthworm locomotion (notes found in the "files" folder) and found that they move through waves of peristalis. They extend their body to reach forward, then contract it to anchor it. This motion follows in waves along the body. 

<p align="center">
  <img width="337" height="477" src="https://github.com/jmac97/Wormulator/blob/master/media/graph.png">
</p>

## Development and Code Breakdown
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
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/fourth.gif">
</p>

Getting the worm to contract to a slightly larger than "relaxed worm width" size was difficult and, although technically more correct, made the worm look less realistic. Adjusting things like this and other parameters to get better movement was surprisingly difficult.

Then I changed the worm to be broken into sections of five and changed the following function to be based on the chain example in Processing.
<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/fifth.gif">
</p>

Then I added inching.
<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/sixth.gif">
</p>

Then adjusted the distance of the inching cycle, the length of the worm, and the distance between the sections.
<p align="center">
  <img width="600" height="240" src="https://github.com/jmac97/Wormulator/blob/master/media/seventh.gif">
</p>

I dont't like the last worm that much. 

I readjusted the sixth worm to be more similar distance wise to the seventh worm.


I like this last worm very much.

Because the following and inching of each section is based on the radius of the previous, adjusting the shape of the worm so that it's sloping in the front and sloping in the back is difficult and hurt my head. But, since this is a focus on the movement of the worm, I think the lacking shape is ok.

The program steps through all the worms in order. After the seventh worm, you can press a number 1-8 to see the respective worm again.


## Instructions for non-Processing Download
This sadly this only works for Windows computers.
To download:
1. Click the green "Clone or download" button on the right
2. Clone the repo or click "Download ZIP" and unzip the folder
3. Go into the "windowsDownload" folder and open the 32 or 64 bit folder, depending on your computer (most likely 64)
4. Click "wormulator.exe"
5. If you're just going to use this application, you only need the stuff in the 32 or 64 bit folder you went into. You can move this folder somewhere else and delete the rest if you wish

## Extra: Some Recent Worm Moments
<p align="center">
  <img width="375" height="160" src="https://github.com/jmac97/Wormulator/blob/master/media/text1.png">
</p>

##

<p align="center">
  <img width="375" height="263" src="https://github.com/jmac97/Wormulator/blob/master/media/text2.png">
</p>
