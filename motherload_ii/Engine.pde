class Engine {
  float w, h, scaleRatio;
  float actualW;
  testButton b;
  Engine() {
    this.actualW = 1000.f;
    updateScreenSize();
    b = new testButton(this,350,500,300,75);
  }

  float actualSize(float value) {
    return value * this.scaleRatio;
  }

  float[] actualPosition(float x, float y) {
    float[] result = new float[]{x * scaleRatio, y * scaleRatio};

    if (width > height) {
      result[0] += (w - actualW * scaleRatio) / 2;
    } else {
      result[1] += (h - actualW * scaleRatio) / 2;
    }

    return result;
  }

  void updateScreenSize() {
    this.w = width;
    this.h = height;
    if (width > height) {
      this.scaleRatio = height / this.actualW;
    } else {
      this.scaleRatio = width / this.actualW;
    }
  }


  void drawBackground() {
    fill(225);
    rect(actualPosition(0, 0)[0], actualPosition(0, 0)[1], actualSize(actualW), actualSize(actualW));
  }

  void tick(float ms) {
    updateScreenSize();
    drawBackground();
    textSize(this.actualSize(30));
    fill(0, 155, 0);
    textAlign(LEFT, TOP);
    text("msValue - " + str(ms) + " size - " + str(width) + "x" + str(height), actualPosition(20, 0)[0], actualPosition(0, 20)[1]);
    
    b.tick(ms);
  }
}