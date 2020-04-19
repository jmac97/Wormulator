//float chaseSpeed = 2;
//int wormLegnth = 100;
//int wormWidth = 10;
//PVector mouse;
//Worm worm;


//void setup() {
//  size(1000, 400);

//  //rectMode(CENTER);

//  mouse = new PVector(0, height/2);
//  worm = new Worm(wormLegnth, wormWidth);

//  fill(175, 112, 98);
//  noStroke();
//}

//void draw() {
//  background(255);

//  // mouse
//  mouse.x = mouseX;
//  mouse.y = mouseY;

//  // worm chase
//  worm.head();
//  worm.moveBody();
//}





//class Worm {
//  ArrayList<Segment> worm;
//  int l;
//  float w;
//  float wMin;

//  Worm(int l_, int w_) {
//    w = w_;
//    l = l_;
    
//    worm = new ArrayList<Segment>(l);

//    float inc = l/3; 
//    wMin = w/inc;

//    for (int i = 0; i < l; i++) {
//      if (i < inc) {
//        worm.add(new Segment(wMin, 0-1, height/2));
//        wMin += w/inc;
//      } else if (i >= l-inc) {
//        worm.add(new Segment(wMin, 0-1, height/2));
//        wMin -= w/inc;
//      } else {
//        worm.add(new Segment(w, 0-1, height/2));
//      }
//    }
//  }

//  void head() {
//    Segment w = worm.get(0);
//    PVector dir = PVector.sub(mouse, w.pos);
//    if (dir.mag() >= 1) {
//      dir.normalize();
//      dir.mult(chaseSpeed);
//      w.pos.add(dir);
//      w.seg();
//    }
//  }

//  void moveBody() {
//    for (int i = 1; i < l; i++) {
//      Segment wCurrent = worm.get(i);
//      Segment wLast = worm.get(i-1);
//      PVector dir = PVector.sub(wLast.pos, wCurrent.pos);
//      if (dir.mag() >= wCurrent.w/2) {
//        dir.normalize();
//        dir.mult(2);
//        wCurrent.pos.add(dir);
//      } else {
//      }
//      wCurrent.seg();
//    }
//  }
//}

//class Segment {
//  float w;
//  float h;
//  float rad;
//  PVector pos;

//  Segment(float w_, float x, float y) {
//    w = w_;
//    h = w_;
//    rad = w/3;
//    pos = new PVector(x, y);
//  }

//  void seg() {
//    rect(pos.x, pos.y, w, h, rad, rad, rad, rad);
//  }
//}
