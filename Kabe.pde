Panel left, right; 
int timelimit = 600;  // 10sec

void setup() {
  size(800, 600);
  noStroke();
  left = new Panel("left");
  right = new Panel("right");
}

void draw() {
  if (frameCount < timelimit) {
    if (frameCount % 30 == 0) {
      int left_pushed = left.player.push();
      if (left_pushed >= 0) {
        right.player.pushed(left_pushed);
      }
      int right_pushed = right.player.push();
      if (right_pushed >= 0) {
        left.player.pushed(right_pushed);
      }
    }
    left.display();
    right.display();
  } else if (frameCount == timelimit){
    if (left.player.score > right.player.score) {
      left.finish("WIN!");  
      right.finish("LOSE!");
    } else if (left.player.score < right.player.score) {
      left.finish("LOSE!");
      right.finish("WIN!");
    } else {
      left.finish("DRAW!");
      right.finish("DRAW!");
    }
  }
}

// For test
void keyPressed() {
  int keynum = int(key) - 48;
  if ((0 <= keynum && keynum <= 3) || (5<= keynum && keynum <= 8)) {
    println(keynum);
    int pushed = right.player.push(keynum);
    left.player.pushed(pushed);
  }
}
