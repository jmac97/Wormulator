Worm1 worm1;
ArrayList<Worm1> first = new ArrayList<Worm1>();
Worm2 worm2;
Worm3 worm3;
Worm4 worm4;
ArrayList<Section5> worm5;
ArrayList<Section6> worm6;
ArrayList<Section7> worm7;
ArrayList<Section8> worm8;

int wormLength = 50;
int wormWidth = 10;
int wormCycle = 10;
float wiggle = 2.5;
float chaseSpeed = 2;

int opacity = 0;
float y;

PVector mouse;
float mass = 2.0;
PVector last;
int l = 10;

PFont text;

int wormNum = 0;

void setup() {
  size(1000, 400);
  ellipseMode(CENTER);
  noStroke();

  y = height/2;

  worm1 = new Worm1(wormWidth, width/2, height/2);
  worm2 = new Worm2(wormLength, wormWidth);
  worm3 = new Worm3(wormLength, wormWidth, wormCycle);
  worm4 = new Worm4(wormLength, wormWidth, wormCycle);

  worm5 = new ArrayList<Section5>();
  for (int i = 0; i < l; i++) {
    worm5.add(new Section5());
  }

  worm6 = new ArrayList<Section6>();
  for (int i = 0; i < l; i++) {
    worm6.add(new Section6());
  }

  worm7 = new ArrayList<Section7>();
  for (int i = 0; i < l*2; i++) {
    worm7.add(new Section7());
  }

  worm8 = new ArrayList<Section8>();
  for (int i = 0; i < l; i++) {
    worm8.add(new Section8());
  }

  mouse = new PVector(0, height/2);
  last = new PVector(width/2, height/2);

  text = loadFont("AdobeDevanagari-Italic-48.vlw");
  textFont(text, 32);
  textAlign(CENTER, CENTER);

  frameCount = 0;
  opacity = 0;
}

void draw() {
  background(255);

  mouse.x = mouseX;
  mouse.y = mouseY;

  // Title sequence
  if (frameCount <= 60*4) {
    fill(0, opacity);
    text("wormulator", width/2, height/2);
    opacity++;
  } else if (frameCount > 60*4 && frameCount <= 60*7) {
    if (y < height-50) {
      y++;
    }
    text("wormulator", width/2, y);
  } 

  // First worm - title
  else if (frameCount > 60*7 && frameCount <= 60*11) {
    fill(175, 112, 98);
    worm1.dir();
    worm1.show();

    fill(0);
    text("worm the first", width/2, y);
  } 

  // First worm - sub title  
  else if (frameCount > 60*11 && frameCount <= 60*14) {
    fill(175, 112, 98);
    worm1.dir();
    worm1.show();

    fill(0);
    text("basic following", width/2, y);
    opacity = 255;
  } 

  // Second worm - title
  else if (frameCount > 60*14 && frameCount <= 60*17) {
    fill(175, 112, 98, opacity);
    worm1.dir();
    worm1.show();

    fill(175, 112, 98);
    worm2.head();
    worm2.moveBody();

    fill(0);
    text("worm the second", width/2, y);
    opacity -= 5;
  } 

  // Second worm - sub title
  else if (frameCount > 60*17 && frameCount <= 60*20) {
    fill(175, 112, 98);
    worm2.head();
    worm2.moveBody();

    fill(0);
    text("basic shape", width/2, y);
    opacity = 255;
  } 

  // Third worm - title
  else if (frameCount > 60*20 && frameCount <= 60*30) {
    fill(175, 112, 98, opacity);
    worm2.head();
    worm2.moveBody();

    fill(175, 112, 98);
    worm3.head();
    worm3.moveBody();

    fill(0);
    text("worm the third", width/2, y);
    opacity -= 5;
  } 

  // Third worm - sub title
  else if (frameCount > 60*30 && frameCount <= 60*40) {
    fill(175, 112, 98);
    worm3.head();
    worm3.moveBody();

    fill(0);
    text("basic waves", width/2, y);
    opacity = 255;
  } 

  // Fourth worm - title
  else if (frameCount > 60*40 && frameCount <= 60*60) {
    fill(175, 112, 98, opacity);
    worm3.head();
    worm3.moveBody();

    fill(175, 112, 98);
    worm4.moveBody();

    fill(0);
    text("worm the fourth", width/2, y);
    opacity -= 5;
  } 

  // Fourth worm - sub title
  else if (frameCount > 60*60 && frameCount <= 60*80) {
    fill(175, 112, 98);
    worm4.moveBody();

    fill(0);
    text("inching & shape", width/2, y);
    opacity = 255;
  } 

  // Fifth worm - title
  else if (frameCount > 60*80 && frameCount <= 60*85) {
    fill(175, 112, 98, opacity);
    worm4.moveBody();

    fill(175, 112, 98);
    worm5.get(0).move(mouse);
    for (int i = 1; i < l; i++) {
      last.x = worm5.get(i-1).part.get(4).x;
      last.y = worm5.get(i-1).part.get(4).y;
      worm5.get(i).move(last);
    }

    fill(0);
    text("worm the fifth", width/2, y);
    opacity -= 5;
  } 

  // Fifth worm - sub title
  else if (frameCount > 60*85 && frameCount <= 60*90) {
    fill(175, 112, 98);
    worm5.get(0).move(mouse);
    for (int i = 1; i < l; i++) {
      last.x = worm5.get(i-1).part.get(4).x;
      last.y = worm5.get(i-1).part.get(4).y;
      worm5.get(i).move(last);
    }

    fill(0);
    text("basic follow in sections", width/2, y);
    opacity = 255;
  } 

  // Sixth worm - title
  else if (frameCount > 60*90 && frameCount <= 60*95) {
    fill(175, 112, 98, opacity);
    worm5.get(0).move(mouse);
    for (int i = 1; i < l; i++) {
      last.x = worm5.get(i-1).part.get(4).x;
      last.y = worm5.get(i-1).part.get(4).y;
      worm5.get(i).move(last);
    }

    fill(175, 112, 98);
    if (worm6.get(4).stuff.get(4).radius == worm6.get(4).stuff.get(4).rMax) {
      worm6.get(0).move(mouse);
    }

    for (int i = 1; i < 5; i++) {
      last.x = worm6.get(i-1).stuff.get(4).x;
      last.y = worm6.get(i-1).stuff.get(4).y;
      worm6.get(i).move(last);
      worm6.get(i).show();
    }

    fill(0);
    text("worm the sixth", width/2, y);
    opacity -= 5;
  } 

  // Sixth worm - sub title
  else if (frameCount > 60*95 && frameCount <= 60*100) {
    fill(175, 112, 98);
    if (worm6.get(4).stuff.get(4).radius == worm6.get(4).stuff.get(4).rMax) {
      worm6.get(0).move(mouse);
    }

    for (int i = 1; i < 5; i++) {
      last.x = worm6.get(i-1).stuff.get(4).x;
      last.y = worm6.get(i-1).stuff.get(4).y;
      worm6.get(i).move(last);
      worm6.get(i).show();
    }

    fill(0);
    text("inching in sections", width/2, y);
    opacity = 255;
  } 

  // Seventh worm - title
  else if (frameCount > 60*100 && frameCount <= 60*105) {
    fill(175, 112, 98, opacity);
    if (worm6.get(4).stuff.get(4).radius == worm6.get(4).stuff.get(4).rMax) {
      worm6.get(0).move(mouse);
    }

    for (int i = 1; i < 5; i++) {
      last.x = worm6.get(i-1).stuff.get(4).x;
      last.y = worm6.get(i-1).stuff.get(4).y;
      worm6.get(i).move(last);
      worm6.get(i).show();
    }

    fill(175, 112, 98);
    if (worm7.get(9).stuff.get(4).radius == worm7.get(9).stuff.get(4).rMax) {
      worm7.get(0).move(mouse);
    }

    for (int i = 1; i < 20; i++) {
      last.x = worm7.get(i-1).stuff.get(4).x;
      last.y = worm7.get(i-1).stuff.get(4).y;
      worm7.get(i).move(last);
      worm7.get(i).show();
    }

    fill(0);
    text("worm the seventh", width/2, y);
    opacity -= 5;
  } 

  // Seventh worm - sub title
  else if (frameCount > 60*105 && frameCount <= 60*110) {
    fill(175, 112, 98);
    if (worm7.get(9).stuff.get(4).radius == worm7.get(9).stuff.get(4).rMax) {
      worm7.get(0).move(mouse);
    }

    for (int i = 1; i < 20; i++) {
      last.x = worm7.get(i-1).stuff.get(4).x;
      last.y = worm7.get(i-1).stuff.get(4).y;
      worm7.get(i).move(last);
      worm7.get(i).show();
    }

    fill(0);
    text("closer sections", width/2, y);
    opacity = 255;
  }

  // Eighth worm - title
  else if (frameCount > 60*110 && frameCount <= 60*115) {
    fill(175, 112, 98, opacity);
    if (worm7.get(9).stuff.get(4).radius == worm7.get(9).stuff.get(4).rMax) {
      worm7.get(0).move(mouse);
    }

    for (int i = 1; i < 20; i++) {
      last.x = worm7.get(i-1).stuff.get(4).x;
      last.y = worm7.get(i-1).stuff.get(4).y;
      worm7.get(i).move(last);
      worm7.get(i).show();
    }

    fill(175, 112, 98);
    if (worm8.get(9).stuff.get(4).radius == worm8.get(9).stuff.get(4).rMax) {
      worm8.get(0).move(mouse);
    }

    for (int i = 1; i < 10; i++) {
      last.x = worm8.get(i-1).stuff.get(4).x;
      last.y = worm8.get(i-1).stuff.get(4).y;
      worm8.get(i).move(last);
      worm8.get(i).show();
    }

    fill(0);
    text("worm the eighth", width/2, y);
    opacity -= 5;
  }

  // Eighth worm - sub title
  else if (frameCount > 60*115 && frameCount <= 60*120) {
    fill(175, 112, 98);
    if (worm8.get(9).stuff.get(4).radius == worm8.get(9).stuff.get(4).rMax) {
      worm8.get(0).move(mouse);
    }

    for (int i = 1; i < 10; i++) {
      last.x = worm8.get(i-1).stuff.get(4).x;
      last.y = worm8.get(i-1).stuff.get(4).y;
      worm8.get(i).move(last);
      worm8.get(i).show();
    }

    fill(0);
    text("refined inching in sections", width/2, y);
    opacity = 255;
  }
  
  // Goodbye worms
  // Eighth worm - sub title
  else if (frameCount > 60*120 && frameCount <= 60*123) {
    fill(175, 112, 98, opacity);
    if (worm8.get(9).stuff.get(4).radius == worm8.get(9).stuff.get(4).rMax) {
      worm8.get(0).move(mouse);
    }

    for (int i = 1; i < 10; i++) {
      last.x = worm8.get(i-1).stuff.get(4).x;
      last.y = worm8.get(i-1).stuff.get(4).y;
      worm8.get(i).move(last);
      worm8.get(i).show();
    }

    fill(0, opacity);
    text("refined inching in sections", width/2, y);
    opacity -= 5;
  }

  // Instructions sequence
  else if (frameCount > 60*123 && frameCount <= 60*128) {
    fill(0, opacity);
    text("wormulator", width/2, height/2);
    opacity += 5;
  } else if (frameCount > 60*128 && frameCount <= 60*132) {
    fill(0);
    text("press a number 1-8 to see a worm", width/2, y);
  }

  // Choose your worm
  else if (frameCount > 60*128) {
    if (keyPressed) {

      // Worm the first selection
      if (key == '1') {
        wormNum = 1;
      }

      // Worm the second
      if (key == '2') {
        wormNum = 2;
      }

      // Worm the third
      if (key == '3') {
        wormNum = 3;
      }

      // Worm the fourth
      if (key == '4') {
        wormNum = 4;
      }

      // Worm the fifth
      if (key == '5') {
        wormNum = 5;
      }

      // Worm the sixth
      if (key == '6') {
        wormNum = 6;
      }

      // Worm the seventh
      if (key == '7') {
        wormNum = 7;
      }

      // Worm the eighth
      if (key == '8') {
        wormNum = 8;
      }
    }

    // Worm the first
    if (wormNum == 1) {
      fill(175, 112, 98);
      worm1.dir();
      worm1.show();

      fill(0);
      text("worm the first", width/2, height-50);
    }

    // Worm the second
    if (wormNum == 2) {
      fill(175, 112, 98);
      worm2.head();
      worm2.moveBody();

      fill(0);
      text("worm the second", width/2, height-50);
    }

    // Worm the third
    if (wormNum == 3) {
      fill(175, 112, 98);
      worm3.head();
      worm3.moveBody();

      fill(0);
      text("worm the third", width/2, height-50);
    }

    // Worm the fourth
    if (wormNum == 4) {
      fill(175, 112, 98);
      worm4.moveBody();

      fill(0);
      text("worm the fourth", width/2, height-50);
    }

    // Worm the fifth
    if (wormNum == 5) {
      fill(175, 112, 98);
      worm5.get(0).move(mouse);
      for (int i = 1; i < l; i++) {
        last.x = worm5.get(i-1).part.get(4).x;
        last.y = worm5.get(i-1).part.get(4).y;
        worm5.get(i).move(last);
      }

      fill(0);
      text("worm the fifth", width/2, height-50);
    }

    // Worm the sixth
    if (wormNum == 6) {
      fill(175, 112, 98);
      if (worm6.get(4).stuff.get(4).radius == worm6.get(4).stuff.get(4).rMax) {
        worm6.get(0).move(mouse);
      }

      for (int i = 1; i < 5; i++) {
        last.x = worm6.get(i-1).stuff.get(4).x;
        last.y = worm6.get(i-1).stuff.get(4).y;
        worm6.get(i).move(last);
        worm6.get(i).show();
      }

      fill(0);
      text("worm the sixth", width/2, height-50);
    }

    // Worm the seventh
    if (wormNum == 7) {
      fill(175, 112, 98);
      if (worm7.get(9).stuff.get(4).radius == worm7.get(9).stuff.get(4).rMax) {
        worm7.get(0).move(mouse);
      }

      for (int i = 1; i < 20; i++) {
        last.x = worm7.get(i-1).stuff.get(4).x;
        last.y = worm7.get(i-1).stuff.get(4).y;
        worm7.get(i).move(last);
        worm7.get(i).show();
      }

      fill(0);
      text("worm the seventh", width/2, height-50);
    }

    // Worm the eighth
    if (wormNum == 8) {
      fill(175, 112, 98);
      if (worm8.get(9).stuff.get(4).radius == worm8.get(9).stuff.get(4).rMax) {
        worm8.get(0).move(mouse);
      }

      for (int i = 1; i < 10; i++) {
        last.x = worm8.get(i-1).stuff.get(4).x;
        last.y = worm8.get(i-1).stuff.get(4).y;
        worm8.get(i).move(last);
        worm8.get(i).show();
      }
      
      fill(0);
      text("worm the eighth", width/2, height-50);
    }
  }
}
