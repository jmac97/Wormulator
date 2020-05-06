class Section6 {
  ArrayList<Segment6> stuff;

  Section6() {
    stuff = new ArrayList<Segment6>();

    for (int i = 0; i < 5; i++) {
      stuff.add(new Segment6(width/2, height/2, mass));
    }
  }

  void move(PVector follow) {
    for (int i = 0; i < 5; i++) {
      Segment6 s = stuff.get(i);

      if (i == 0) {
        s.head(follow);
      } else {
        s.update(stuff.get(i-1).x, stuff.get(i-1).y, stuff.get(i-1).radius);
      }
    }
  }
  void show() {
    for (Segment6 s : stuff) {
      s.display();
    }
  }
}

class Segment6 {
  float vx, vy; // The x- and y-axis velocities
  float x, y; // The x- and y-coordinates
  float mass;
  float stiffness = 0.2;
  float damping = 0.7;

  float radius = 10;
  float rMax = 12;
  float rMin = 8;

  Segment6(float xpos, float ypos, float m) {
    x = xpos;
    y = ypos;
    mass = m;
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

  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
