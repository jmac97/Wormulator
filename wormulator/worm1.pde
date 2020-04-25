class worm1 {
  ArrayList<segment1> worm;
  int l;
  float w;
  int cycle;

  worm1(int l_, int w_, int c) {
    w = w_;
    l = l_;
    cycle = c; 

    worm = new ArrayList<segment1>(l);

    for (int i = 0; i < l; i++) {
        worm.add(new segment1(w, width/2-100, height/2));
    }
  }

  void head() {
    segment1 w = worm.get(0);
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

  void moveBody() {
    for (int i = 1; i < l; i++) {
      segment1 wCurrent = worm.get(i);
      segment1 wLast = worm.get(i-1);
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


class segment1 {
  PVector pos;
  float h;
  float hMax;
  float hMin;
  boolean extend;
  int cycled;

  segment1(float h_, float x, float y) {
    h = h_;
    hMax = h_;
    hMin = 5*h_/6;

    pos = new PVector(x, y);
    extend = true;
    cycled = 0;
  }

  void extend() {
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

  void update() {
    ellipse(pos.x, pos.y, h, h);
  }
}
