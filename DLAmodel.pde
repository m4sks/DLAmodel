
ArrayList<Particle> particles;
int max = 2000;
boolean isJoining;
int countJoinning = 0;
int countFoundation = 0;
int c = 0;
//float dist = 0;

final int Width = 300;
final int Height = 300;

final int divisionRate = 10;
final int divisionOverlap = 5;
final int divisionSideX = width / divisionRate + 2 * divisionOverlap;
final int divisionSideY = height / divisionRate + 2 * divisionOverlap;

final float depositionRate = 0.2;

void settings() {
  size(Width, Height);
}

void setup() {
  frameRate(100000);
  background(255);
  strokeWeight(2);
  particles = new ArrayList<Particle>();

  for (int i = 0; i < max; i++) {
    particles.add(new Particle(i, 3));
    //num.add(particles.size() - 1);
  }
}

void draw() {
  background(255);
  particle();
  
}

void mouseClicked() {
  particles.add(new Particle(mouseX, mouseY, true, 5));
  countFoundation++;
}

void keyPressed() {
  if (key == ' ') {
    for (int i = 0; i < particles.size(); i++) {
      particles.get(i).changeState();
    }
  }
  if (key == 'c') {
    println(c % 255);
  }
}