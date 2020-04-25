worm1 worm1;
worm2 worm2;
worm3 worm3;
worm4 worm4;

int wormLegnth = 75;
int wormWidth = 10;
int wormCycle = 10;
float wiggle = 2.5;
float chaseSpeed = 2;

int opacity = 0;
int opacity2 = 0;
float y;

PVector mouse;

PFont text;

ArrayList<worm4> first = new ArrayList<worm4>();

void setup() {
  size(1000, 400);
  ellipseMode(CENTER);
  noStroke();

  y = height/2;

  worm1 = new worm1(wormLegnth, wormWidth, wormCycle);
  worm2 = new worm2(wormLegnth, wormWidth, wormCycle);
  worm3 = new worm3(wormLegnth, wormWidth);
  worm4 = new worm4(wormWidth, width/2, height/2);

  mouse = new PVector(0, height/2);

  text = loadFont("AdobeDevanagari-Italic-48.vlw");
  textFont(text, 32);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);

  mouse.x = mouseX;
  mouse.y = mouseY;

  if (frameCount <= 60*4) {
    fill(0, opacity);
    text("wormulator", width/2, height/2);
    opacity++;
  } else if (frameCount > 60*4 && frameCount <= 60*7) {
    if (y < height-50) {
      y++;
    }
    text("wormulator", width/2, y);
  } else if (frameCount > 60*7 && frameCount <= 60*11) {
    fill(175, 112, 98);
    worm4.dir();
    worm4.show();

    fill(0, opacity);
    text("wormulator", width/2, y);
    fill(0, opacity2);
    text("worm the first", width/2, y);
    opacity-=5;
    opacity2+=5;
  } else if (frameCount > 60*11 && frameCount <= 60*14) {
    fill(175, 112, 98);
    worm4.dir();
    worm4.show();

    fill(0, opacity2);
    text("worm the first", width/2, y);
  } else if (frameCount > 60*14 && frameCount <= 60*18) {
    fill(175, 112, 98);
    worm4.dir();
    worm4.show();

    fill(0);
    text("basic following", width/2, y);
    opacity2 = 255;
  } else if (frameCount > 60*18 && frameCount <= 60*22) {
    fill(175, 112, 98, opacity2);
    worm4.dir();
    worm4.show();

    fill(175, 112, 98);
    worm3.head();
    worm3.moveBody();

    fill(0);
    text("worm the second", width/2, y);
    opacity2-=5;
  } else if (frameCount > 60*22 && frameCount <= 60*26) {
    fill(175, 112, 98);
    worm3.head();
    worm3.moveBody();

    fill(0);
    text("basic shape", width/2, y);
    opacity2 = 255;
  } else if (frameCount > 60*26 && frameCount <= 60*30) {
    fill(175, 112, 98, opacity2);
    worm3.head();
    worm3.moveBody();

    fill(175, 112, 98);
    worm1.head();
    worm1.moveBody();

    fill(0);
    text("worm the third", width/2, y);
    opacity2-=5;
  } else if (frameCount > 60*30 && frameCount <= 60*46) {
    fill(175, 112, 98);
    worm1.head();
    worm1.moveBody();
    
    fill(0);
    text("basic waves", width/2, y);
    opacity2=255;
  } else if (frameCount > 60*46 && frameCount <= 60*50) {
    fill(175, 112, 98, opacity2);
    worm1.head();
    worm1.moveBody();
    
    fill(175, 112, 98);
    worm2.moveBody();
    
    fill(0);
    text("worm the fourth", width/2, y);
    opacity2-=5;
  } else if (frameCount > 60*50) {
    fill(175, 112, 98);
    worm2.moveBody();
    
    fill(0);
    text("inching & shape", width/2, y);
  }
}
