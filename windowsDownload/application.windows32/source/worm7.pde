class Section7 {
  ArrayList<Segment7> stuff;
  int l = 5;

  Section7() {
    stuff = new ArrayList<Segment7>();

    for (int i = 0; i < l; i++) {
      stuff.add(new Segment7(width/2, height/2, mass));
    }
  }

  void move(PVector follow) {
    for (int i = 0; i < l; i++) {
      Segment7 s = stuff.get(i);

      if (i == 0) {
        s.head(follow);
      } else {
        s.update(stuff.get(i-1).x, stuff.get(i-1).y, stuff.get(i-1).radius);
      }
    }
  }
  void show() {
    for (Segment7 s : stuff) {
      s.display();
    }
  }
}

class Segment7 {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float mass;
  float stiffness = 0.2;
  float damping = 0.7;

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


  void head(PVector follow) {
    PVector pos = new PVector(x, y);
    PVector d = PVector.sub(follow, pos);
    if (d.mag() >= 5) {
      d.normalize();
      if (radius > rMin) {
        radius-=.5;
      }
      d.mult(.75);
      pos.add(d);
      x = pos.x;
      y = pos.y;
    } else if (radius < rMax) {
      radius+=.5;
    }
  }

  void update(float targetX, float targetY, float targetR) {
    PVector dir = new PVector(targetX, targetY);
    PVector cur = new PVector(x, y);
    dir = PVector.sub(dir, cur);
    radius = targetR;
    if (dir.mag() > .75) {
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

  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
