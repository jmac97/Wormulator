import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class wormulator extends PApplet {

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
float wiggle = 2.5f;
float chaseSpeed = 2;

int opacity = 0;
float y;

PVector mouse;
float mass = 2.0f;
PVector last;
int l = 10;

PFont text;

int wormNum = 0;

public void setup() {
  
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

public void draw() {
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
class Worm1 {
  PVector pos;
  int total = 0;
  int max = 75;
  float w;
  PVector[] tail = new PVector[max];

  Worm1(float w_, float x, float y) {
    pos = new PVector(x, y);
    w = w_;

    for (int i = 0; i < max; i++) {
      tail[i] = (new PVector(x, y));
    }
  }

  public void update(float x, float y) {
    if (total < max) {
      tail[total] = (new PVector(x, y, 0));
      total++;
    } else {
      total = 0;
    }
  }

  public void dir() {
    PVector d = PVector.sub(mouse, pos);
    if (d.mag() >= 5) {
      d.normalize();
      d.mult(chaseSpeed);
      update(pos.x, pos.y);
      pos.add(d);
    }
  }

  public void show() {
    for (int i = 0; i < max; i++) {
      PVector v = tail[i];
      ellipse(v.x, v.y, wormWidth, wormWidth);
      v.z++;
    }
    ellipse(pos.x, pos.y, wormWidth, wormWidth);
  }
}
class Worm2 {
  ArrayList<Segment2> worm;
  int l;
  float w;
  float wMin;

  Worm2(int l_, int w_) {
    w = w_;
    l = l_;
    
    worm = new ArrayList<Segment2>(l);

    float inc = l/3; 
    wMin = w/inc;

    for (int i = 0; i < l; i++) {
      if (i < inc) {
        worm.add(new Segment2(wMin, width/2, height/2));
        wMin += w/inc;
      } else if (i >= l-inc) {
        worm.add(new Segment2(wMin, width/2, height/2));
        wMin -= w/inc;
      } else {
        worm.add(new Segment2(w, width/2, height/2));
      }
    }
  }

  public void head() {
    Segment2 w = worm.get(0);
    PVector dir = PVector.sub(mouse, w.pos);
    if (dir.mag() >= 1) {
      dir.normalize();
      dir.mult(chaseSpeed);
      w.pos.add(dir);
      w.seg();
    }
  }

  public void moveBody() {
    for (int i = 1; i < l; i++) {
      Segment2 wCurrent = worm.get(i);
      Segment2 wLast = worm.get(i-1);
      PVector dir = PVector.sub(wLast.pos, wCurrent.pos);
      if (dir.mag() >= wCurrent.w/2) {
        dir.normalize();
        dir.mult(2);
        wCurrent.pos.add(dir);
      } else {
      }
      wCurrent.seg();
    }
  }
}

class Segment2 {
  float w;
  PVector pos;

  Segment2(float w_, float x, float y) {
    w = w_;
    pos = new PVector(x, y);
  }

  public void seg() {
    ellipse(pos.x, pos.y, w, w);
  }
}
class Worm3 {
  ArrayList<Segment3> worm;
  int l;
  float w;
  int cycle;

  Worm3(int l_, int w_, int c) {
    w = w_;
    l = l_;
    cycle = c; 

    worm = new ArrayList<Segment3>(l);

    for (int i = 0; i < l; i++) {
      worm.add(new Segment3(w, width/2, height/2));
    }
  }

  public void head() {
    Segment3 w = worm.get(0);
    PVector dir = PVector.sub(mouse, w.pos);
    if (w.cycled == worm.get(cycle).cycled) {
      w.extend();
      if (dir.mag() >= 1) {
        dir.normalize();
        w.pos.add(dir);
      }
    }
    w.update();
  }

  public void moveBody() {
    for (int i = 1; i < l; i++) {
      Segment3 wCurrent = worm.get(i);
      Segment3 wLast = worm.get(i-1);
      PVector dir = PVector.sub(wLast.pos, wCurrent.pos);
      if (!wLast.extend || !wCurrent.extend) {
        wCurrent.extend();
        if (dir.mag() >= wCurrent.h/3) {
          dir.normalize();
          dir.mult(chaseSpeed);
          wCurrent.pos.add(dir);
        }
      }
      wCurrent.update();
    }
  }
}


class Segment3 {
  PVector pos;
  float h;
  float hMax;
  float hMin;
  boolean extend;
  int cycled;

  Segment3(float h_, float x, float y) {
    h = h_;
    hMax = h_;
    hMin = 5*h_/6;

    pos = new PVector(x, y);
    extend = true;
    cycled = 0;
  }

  public void extend() {
    if (extend) {
      if (h >= hMin) {
        h--;
      } else {
        extend = false;
      }
    } else {
      if (h <= hMax) {
        h++;
      } else {
        extend = true;
        cycled++;
      }
    }
  }

  public void update() {
    ellipse(pos.x, pos.y, h, h);
  }
}
class Worm4 {
  ArrayList<Segment4> worm;
  int l;
  int w;
  float wMin;
  int cycle;
  float inc;

  Worm4(int l_, int w_, int c) {
    w = w_;
    l = l_;
    cycle = c;

    worm = new ArrayList<Segment4>(l);


    inc = l/3; 
    wMin = w/inc;

    for (int i = 0; i < l; i++) {
      if (i < inc) {
        worm.add(new Segment4(wMin, width/2, height/2));
        wMin += w/inc;
      } else if (i >= l-inc) {
        worm.add(new Segment4(wMin, width/2, height/2));
        wMin -= w/inc;
      } else {
        worm.add(new Segment4(w, width/2, height/2));
      }
    }
  }


  public void moveBody() {
    PVector dir;
    for (int i = 0; i < worm.size(); i++) {
      Segment4 wCurrent = worm.get(i);

      if (i == 0) {
        dir = PVector.sub(wCurrent.pos, worm.get(cycle).pos);
        if (worm.get(cycle).cycled == wCurrent.cycled) {
          dir = PVector.sub(mouse, wCurrent.pos);
          dir.normalize();
          dir.mult(chaseSpeed);
          wCurrent.pos.add(dir);
          wCurrent.pos.x += random(-wiggle, wiggle);
          wCurrent.pos.y += random(-wiggle, wiggle);
          wCurrent.extend();
        }
      } else {
        Segment4 wLast = worm.get(i-1);
        PVector size = new PVector(wLast.w/2, wCurrent.w/2);
        dir = PVector.sub(wLast.pos, wCurrent.pos);
        if (wLast.cycled != wCurrent.cycled) {
          wCurrent.extend();
        }
        if (dir.mag() >= size.mag()*.6f) {
          dir.normalize();
          dir.mult(chaseSpeed);
          wCurrent.pos.add(dir);
        }
      }

      wCurrent.update();
    }
  }
}

class Segment4 {
  PVector pos;
  float w;
  boolean extend;
  float wMax;
  float wMin;
  int cycled;
  
  Segment4(float w_, float x, float y) {
    w = w_;
    pos = new PVector(x, y);

    extend = true;
    cycled = 0;

    wMax = w_*1.5f;
    wMin = w_*.5f;
  }

  public void extend() {
    if (extend) {
      if (w >= wMin) {
        w--;
      } else {
        extend = false;
      }
    } else {
      if (w <= wMax) {
        w++;
      } else {
        extend = true;
        cycled++;
      }
    }
  }

  public void update() {
    ellipse(pos.x, pos.y, w, w);
  }
}
class Section5 {
  ArrayList<Segment5> part;
  int l;

  Section5() {
    part = new ArrayList<Segment5>();
    l = 5;

    for (int i = 0; i < l; i++) {
      part.add(new Segment5(width/2, height/2, mass));
    }
  }

  public void move(PVector follow) {
    for (int i = 0; i < l; i++) {
      Segment5 s = part.get(i);

      if (i == 0) {
        Segment5 last = part.get(l-1);
        PVector dir = new PVector(last.x, last.y);
        PVector cur = new PVector(s.x, s.y);
        dir = PVector.sub(dir, cur);
        s.head(follow);
        s.display();
      } else {
        Segment5 previous = part.get(i-1);
        s.update(previous.x, previous.y);
        s.display();
      }
    }
  }
}

class Segment5 {
  float vx, vy;
  float x, y;
  float mass;
  float radius = 10;
  float stiffness = 0.2f;
  float damping = 0.7f;

  Segment5(float xpos, float ypos, float m) {
    x = xpos;
    y = ypos;
    mass = m;
  }


  public void head(PVector follow) {
    PVector pos = new PVector(x, y);
    PVector d = PVector.sub(follow, pos);
    if (d.mag() >= 5) {
      d.normalize();
      pos.add(d);
      x = pos.x;
      y = pos.y;
    }
  }

  public void update(float targetX, float targetY) {
    PVector dir = new PVector(targetX, targetY);
    PVector cur = new PVector(x, y);
    dir = PVector.sub(dir, cur);
    if (dir.mag() > radius/5) {
      float forceX = (targetX - x) * stiffness;
      float ax = forceX / mass;
      vx = damping * (vx + ax);
      x += vx;

      float forceY = (targetY - y) * stiffness;
      float ay = forceY / mass;
      vy = damping * (vy + ay);
      y += vy;
    }
  }

  public void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
class Section6 {
  ArrayList<Segment6> stuff;

  Section6() {
    stuff = new ArrayList<Segment6>();

    for (int i = 0; i < 5; i++) {
      stuff.add(new Segment6(width/2, height/2, mass));
    }
  }

  public void move(PVector follow) {
    for (int i = 0; i < 5; i++) {
      Segment6 s = stuff.get(i);

      if (i == 0) {
        s.head(follow);
      } else {
        s.update(stuff.get(i-1).x, stuff.get(i-1).y, stuff.get(i-1).radius);
      }
    }
  }
  public void show() {
    for (Segment6 s : stuff) {
      s.display();
    }
  }
}

class Segment6 {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float mass;
  float stiffness = 0.2f;
  float damping = 0.7f;

  float radius = 10;
  float rMax = 12;
  float rMin = 8;

  Segment6(float xpos, float ypos, float m) {
    x = xpos;
    y = ypos;
    mass = m;
  }


  public void head(PVector follow) {
    PVector pos = new PVector(x, y);
    PVector d = PVector.sub(follow, pos);
    if (d.mag() >= 5) {
      d.normalize();
      if (radius > rMin) {
        radius-=.5f;
      }
      d.mult(.75f);
      pos.add(d);
      x = pos.x;
      y = pos.y;
    } else if (radius < rMax) {
      radius+=.5f;
    }
  }

  public void update(float targetX, float targetY, float targetR) {
    PVector dir = new PVector(targetX, targetY);
    PVector cur = new PVector(x, y);
    dir = PVector.sub(dir, cur);
    radius = targetR;
    if (dir.mag() > radius) {
      float forceX = (targetX - x) * stiffness;
      float ax = forceX / mass;
      vx = damping * (vx + ax);
      x += vx;

      float forceY = (targetY - y) * stiffness;
      float ay = forceY / mass;
      vy = damping * (vy + ay);
      y += vy;
    }
  }

  public void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
class Section7 {
  ArrayList<Segment7> stuff;
  int l = 5;

  Section7() {
    stuff = new ArrayList<Segment7>();

    for (int i = 0; i < l; i++) {
      stuff.add(new Segment7(width/2, height/2, mass));
    }
  }

  public void move(PVector follow) {
    for (int i = 0; i < l; i++) {
      Segment7 s = stuff.get(i);

      if (i == 0) {
        s.head(follow);
      } else {
        s.update(stuff.get(i-1).x, stuff.get(i-1).y, stuff.get(i-1).radius);
      }
    }
  }
  public void show() {
    for (Segment7 s : stuff) {
      s.display();
    }
  }
}

class Segment7 {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float mass;
  float stiffness = 0.2f;
  float damping = 0.7f;

  float radius = 10;
  float rMax = 12;
  float rMin = 8;

  int cycled;

  boolean change;

  Segment7(float xpos, float ypos, float m) {
    x = xpos;
    y = ypos;
    mass = m;

    cycled = 0;

    change = true;
  }


  public void head(PVector follow) {
    PVector pos = new PVector(x, y);
    PVector d = PVector.sub(follow, pos);
    if (d.mag() >= 5) {
      d.normalize();
      if (radius > rMin) {
        radius-=.5f;
      }
      d.mult(.75f);
      pos.add(d);
      x = pos.x;
      y = pos.y;
    } else if (radius < rMax) {
      radius+=.5f;
    }
  }

  public void update(float targetX, float targetY, float targetR) {
    PVector dir = new PVector(targetX, targetY);
    PVector cur = new PVector(x, y);
    dir = PVector.sub(dir, cur);
    radius = targetR;
    if (dir.mag() > .75f) {
      float forceX = (targetX - x) * stiffness;
      float ax = forceX / mass;
      vx = damping * (vx + ax);
      x += vx;

      float forceY = (targetY - y) * stiffness;
      float ay = forceY / mass;
      vy = damping * (vy + ay);
      y += vy;
    }
  }

  public void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
class Section8 {
  ArrayList<Segment8> stuff;

  Section8() {
    stuff = new ArrayList<Segment8>();

    for (int i = 0; i < 5; i++) {
      stuff.add(new Segment8(width/2, height/2, mass));
    }
  }

  public void move(PVector follow) {
    for (int i = 0; i < 5; i++) {
      Segment8 s = stuff.get(i);

      if (i == 0) {
        s.head(follow);
      } else {
        s.update(stuff.get(i-1).x, stuff.get(i-1).y, stuff.get(i-1).radius);
      }
    }
  }
  public void show() {
    for (Segment8 s : stuff) {
      s.display();
    }
  }
}

class Segment8 {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float mass;
  float stiffness = 0.2f;
  float damping = 0.7f;

  float radius = 10;
  float rMax = 12;
  float rMin = 8;

  Segment8(float xpos, float ypos, float m) {
    x = xpos;
    y = ypos;
    mass = m;
  }


  public void head(PVector follow) {
    PVector pos = new PVector(x, y);
    PVector d = PVector.sub(follow, pos);
    if (d.mag() >= 5) {
      d.normalize();
      if (radius > rMin) {
        radius-=.5f;
      }
      d.mult(.75f);
      pos.add(d);
      x = pos.x;
      y = pos.y;
    } else if (radius < rMax) {
      radius+=.5f;
    }
  }

  public void update(float targetX, float targetY, float targetR) {
    PVector dir = new PVector(targetX, targetY);
    PVector cur = new PVector(x, y);
    dir = PVector.sub(dir, cur);
    radius = targetR;
    if (dir.mag() > radius*.25f) {
      float forceX = (targetX - x) * stiffness;
      float ax = forceX / mass;
      vx = damping * (vx + ax);
      x += vx;

      float forceY = (targetY - y) * stiffness;
      float ay = forceY / mass;
      vy = damping * (vy + ay);
      y += vy;
    }
  }

  public void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
  public void settings() {  size(1000, 400); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "wormulator" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
