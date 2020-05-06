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

  void head() {
    Segment2 w = worm.get(0);
    PVector dir = PVector.sub(mouse, w.pos);
    if (dir.mag() >= 1) {
      dir.normalize();
      dir.mult(chaseSpeed);
      w.pos.add(dir);
      w.seg();
    }
  }

  void moveBody() {
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

  void seg() {
    ellipse(pos.x, pos.y, w, w);
  }
}
