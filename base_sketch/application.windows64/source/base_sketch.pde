int radius = 380;
int centerX = 400;
int centerY = 400;
float angle = 0;
float step = PI/24.00;
int numCircles = 360;
float[] circleAngles;
int[] circleSizes;

void setup() {
  size(800, 800);
  circleSizes = makeCircleSizes(numCircles, 24, 1);
  circleAngles = makeCircleAngles(numCircles);
}

void draw() {
  background(0);
  if (mousePressed) {
    angle = -1 * angle;
    step = -1 * step;
  }
  drawCircles();
  updateAngles();
}

int[] makeCircleSizes(int numCircles, int largestSize, int circleStep) {
  int[] circleSizes = new int[numCircles];
  for (int i = 0; i < numCircles; i++) {
    if (i < largestSize) {
      circleSizes[numCircles - 1 - i] = largestSize - i*circleStep; 
    } else {
      circleSizes[numCircles - 1 - i] = 0;
    }
  }
  return circleSizes;
}

float[] makeCircleAngles(int numCircles) {
  float[] circleAngles = new float[numCircles];
  for (int i = 0; i < numCircles; i++) {
    circleAngles[numCircles - 1 - i] = angle - i*step;
  }
  return circleAngles;
}

void drawCircles() {
  for (int i = 0; i < circleSizes.length; i++) {
    if (circleAngles[i] >= 0) {
      ellipse(centerX + radius*cos(circleAngles[i]), centerY + radius*sin(circleAngles[i]), circleSizes[i], circleSizes[i]);  
    }
  }
}

void updateAngles() {
  for (int i = 0; i < circleAngles.length; i++) {
    circleAngles[i] += step;
  }
}
