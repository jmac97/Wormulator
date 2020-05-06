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

  void move(PVector follow) {
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
  float stiffness = 0.2;
  float damping = 0.7;

  Segment5(float xpos, float ypos, float m) {
    x = xpos;
    y = ypos;
    mass = m;
  }


  void head(PVector follow) {
    PVector pos = new PVector(x, y);
    PVector d = PVector.sub(follow, pos);
    if (d.mag() >= 5) {
      d.normalize();
      pos.add(d);
      x = pos.x;
      y = pos.y;
    }
  }

  void update(float targetX, float targetY) {
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

  void display() {
    ellipse(x, y, radius*2, radius*2);
  }
}
