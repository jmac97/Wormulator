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


  void moveBody() {
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
        if (dir.mag() >= size.mag()*.6) {
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

    wMax = w_*1.5;
    wMin = w_*.5;
  }

  void extend() {
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

  void update() {
    ellipse(pos.x, pos.y, w, w);
  }
}
