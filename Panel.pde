class Panel {
  Player player;
  String position;  // "left" or "right"
  color backcolor;
  int sx, sy;
  final int w = width/2, h = height;
  
  final int cnum = 9;
  Circle[] circles = new Circle[cnum];
  
  // Distance between the center point of 2 adjacent circles
  int distance = 100;
  
  
  
  Panel(String p) {
    position = p;
    if (p == "left") {
      sx = 0;
      sy = 0;
      player = new Player(0);
      backcolor = color(255, 165, 0);
    } else {
      sx = width/2;
      sy = 0;
      player = new Player(1);
      backcolor = color(125, 196, 240);
    }
    
    // Set the position of each circle
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
          int x = sx + w/2 + ((j-1) * distance);
          int y = sy + h/2 + ((i - 1) * distance);
          circles[i*3+j] = new Circle(x, y);
      }
    }
  }
  
  void display() {
    // Draw panel
    fill(backcolor);
    rect(sx, sy, w, h);
    textSize(30);
    textAlign(LEFT);
    fill(20);
    if (position == "left") {
      text("Player 1", sx + 50, h - 50);
    } else {
      text("Player 2", sx + 50, h - 50);
    }
    
    // Draw circles
    for (int i = 0; i < cnum; i++) {
      if (i != 4) {
        circles[i].drawCircle(player.wall.bars[i].on);
      }
    }
    
    // Draw score
    textSize(70);
    textAlign(CENTER, CENTER);
    fill(20);
    text(player.score, sx+w/2, h/2);
  }
  
  void finish(String result) {
    textSize(80);
    textAlign(CENTER);
    fill(255);
    text(result, sx+w/2, 100);
  }
}
