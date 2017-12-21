
void particle() {
  for (int i = 0; i < particles.size(); i++) {
    Particle p = (Particle) particles.get(i);
    p.divisionNumManage();
    if (!p.isJoin && p.isRunning) {
      p.randomWalk();
      p.toJoin();
    }
    p.display();
  }
}

class Particle {
  int rand;
  float x, y;
  boolean isJoin = false;
  color particleColor;
  int number;
  float size;
  boolean isRunning = true;
  int[] divisionNum = new int[2];

  Particle(int num, float Size) {
    this.x = random(width);
    this.y = random(height);
    this.particleColor = color(random(255), random(255), random(255), 100);
    this.number = num;
    this.size = Size;
  }
  Particle(float xpos, float ypos, boolean state, float Size) {
    this.x = xpos;
    this.y = ypos;
    this.isJoin = state;
    this.particleColor = color(random(255), random(255), random(255));
    this.size = Size;
  }

  void randomWalk() {
    rand = int(random(4)) + 1;
    if (rand <= 2) {
      x += int(pow(-1, rand % 2 + 1));
      if (x == width + 1) x = 0;
      if (x == -1) x = width;
    } else {
      y += int(pow(-1, rand % 2 + 1));
      if (x == height + 1) y = 0;
      if (y == -1) y = height;
    }
  }

  void toJoin() {
    for (int i = 0; i < particles.size(); i++) {
      if (i == this.number) continue;
      //if (particles.get(i).divisionNum[0] == particles.get(number).divisionNum[0] && particles.get(i).divisionNum[1] == particles.get(number).divisionNum[1]) {
        if (particles.get(i).isJoin) {
          float x_ = particles.get(i).x;
          float y_ = particles.get(i).y;
          if ((x - x_)*(x - x_) + (y - y_)*(y - y_) < (particles.get(i).size + this.size) * 1.5) {
            if (random(1)<depositionRate){
              this.isJoin = true;
              countJoinning++;
              this.changeColor();
              c += 10;
            }
          }
        }
      //}
    }
  }

  void divisionNumManage() {
    this.divisionNum[0] = (int)x / divisionRate;
    this.divisionNum[1] = (int)y / divisionRate;

    if ((int)x%divisionRate > 0) {
      this.divisionNum[0]++;
    }
    if ((int)y%divisionRate > 0) {
      this.divisionNum[1]++;
    }
  }

  void changeState() {
    this.isRunning = !isRunning;
  }

  void changeColor() {
    this.particleColor = color(c % 255, (c - 100) % 255, 200, 250);
    //(200, (c - 100) % 255, c % 255, 250);
  }

  void display() {
    strokeWeight(size);
    stroke(particleColor);
    point(x, y);
    stroke(particleColor);
  }
}