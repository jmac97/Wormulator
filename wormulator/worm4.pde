class worm4 {
  PVector pos;
  int total = 0;
  int max = 100;
  float w;
  PVector[] tail = new PVector[100];

  worm4(float w_, float x, float y) {
    pos = new PVector(x, y);
    w = w_;

    for (int i = 0; i < max; i++) {
      tail[i] = (new PVector(x, y));
    }
  }

  void update(float x, float y) {
    if (total < max) {
      tail[total] = (new PVector(x, y, 0));
      total++;
    } else {
      total = 0;
    }
  }

  void dir() {
    PVector d = PVector.sub(mouse, pos);
    if (d.mag() >= 5) {
      d.normalize();
      d.mult(chaseSpeed);
      update(pos.x, pos.y);
      pos.add(d);
    }
  }

  void show() {
    for (int i = 0; i < max; i++) {
      PVector v = tail[i];
      ellipse(v.x, v.y, wormWidth, wormWidth);
      v.z++;
    }
    ellipse(pos.x, pos.y, wormWidth, wormWidth);
  }
}
