class Circle {
  int x, y; 
  final int diam = 50;
  
  Circle(int posx, int posy) {
    x = posx;
    y = posy;
  }
  
  void drawCircle(boolean isOn) {
    if (isOn) {
      fill(255);
    } else {
      fill(50);
    }
    ellipse(x, y, diam, diam);
  }
}
