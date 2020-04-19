//Worm worm;
//int wormLegnth = 100;
//int wormWidth = 10;
//int wormCycle = 10;

//float chaseSpeed = 2;
//PVector mouse;

//void setup() {
//  size(1000, 800);
//  rectMode(CENTER);
//  fill(0, 155, 255);
//  noStroke();

//  worm = new Worm(wormLegnth, wormWidth, wormCycle);
//  mouse = new PVector(0, height/2);
//}

//void draw() {
//  background(255);
  
//  mouse.x = mouseX;
//  mouse.y = mouseY;

//  //worm.move();
//  worm.head();
//  worm.moveBody();
//}


//class Worm {
//  ArrayList<Segment> worm;
//  int l;
//  float w;
//  float wMin;
//  int cycle;

//  Worm(int l_, int w_, int c) {
//    w = w_;
//    l = l_;
//    cycle = c; 

//    worm = new ArrayList<Segment>(l);

//    float inc = l/3; 
//    wMin = w/inc;

//    for (int i = 0; i < l; i++) {
//      //if (i == 0) {
//        worm.add(new Segment(w, w, 0, height/2));
//      //} //else {
//      //  worm.add(new Segment(w, w, 0-(7*w/8)*i, height/2));
//      //}
//    }
//  }

//  void move() {
//    for (int i = 0; i < worm.size(); i++) {
//      Segment s = worm.get(i);

//      if (i == 0 && s.cycled == worm.get(cycle).cycled) {
//        s.extend();
//      }

//      if (i >= 1) {
//        if (!worm.get(i-1).extend || !s.extend) {
//          s.extend();
//        }
//      }

//      s.update();
//    }
//  }

//  void head() {
//    Segment w = worm.get(0);
//    PVector dir = PVector.sub(mouse, w.pos);
//    if (w.cycled == worm.get(cycle).cycled) {
//      w.extend();
//      if (dir.mag() >= 1) {
//        dir.normalize();
//        //dir.mult(chaseSpeed);
//        w.pos.add(dir);
//      }
//    }
//    w.update();
//  }

//  void moveBody() {
//    for (int i = 1; i < l; i++) {
//      Segment wCurrent = worm.get(i);
//      Segment wLast = worm.get(i-1);
//      PVector dir = PVector.sub(wLast.pos, wCurrent.pos);
//      if (!wLast.extend || !wCurrent.extend) {
//        wCurrent.extend();
//        if (dir.mag() >= wCurrent.w/3) {
//          dir.normalize();
//          dir.mult(chaseSpeed);
//          wCurrent.pos.add(dir);
//        }
//      }
//      wCurrent.update();
//    }
//  }
//}


//class Segment {
//  PVector pos;

//  float h;
//  float hMax;
//  float hMin;

//  float w;
//  float wMax;
//  float wMin;

//  boolean extend;
//  int cycled;

//  float rad;

//  Segment(float w_, float h_, float x, float y) {
//    w = w_;
//    wMax = 2*w_;
//    wMin = w_;

//    h = h_;
//    hMax = h_;
//    hMin = 5*h_/6;

//    rad = w/3;

//    pos = new PVector(x, y);

//    extend = true;

//    cycled = 0;
//  }

//  void extend() {
//    if (extend) {
//      if (h >= hMin) {
//        h--;
//      } else {
//        extend = false;
//      }
//    } else {
//      if (h <= hMax) {
//        h++;
//      } else {
//        extend = true;
//        cycled++;
//      }
//    }
//  }


//  void update() {
//    rect(pos.x, pos.y, h, h, rad, rad, rad, rad);
//  }
//}
