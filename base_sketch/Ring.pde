class Ring {
  float x,y;
  float diam;
  boolean on = false;
  
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diam = 1;
  }
  
  void grow() {
    if (on) {
      diam += 5;
      if (diam > 2000) {
        on = false;
      }
    }
  }
  
  void display() {
    if (on) {
      noFill();
      strokeWeight(4);
      stroke(255);
      ellipse(x, y, diam, diam);
    }
  }
}
