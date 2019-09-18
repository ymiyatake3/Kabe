Panel left, right; 
int startTime = 0;
int playtime = 600;  // 10sec
boolean onGame;

void setup() {
  size(800, 600);
  noStroke();
  left = new Panel("left");
  right = new Panel("right");
  onGame = false;
}

void draw() {
  if (onGame) {
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
    
    if (frameCount == startTime + playtime) {
      onGame = false;
    }
    
    left.display();
    right.display();
    
  } else if (frameCount <= 100){
    left.display();
    right.display();
    textSize(120);
    textAlign(CENTER, CENTER);
    fill(0, 128, 128);
    text("READY...", width/2, height/2);
    
  } else if (frameCount <= 140) {
    left.display();
    right.display();
    textSize(200);
    textAlign(CENTER, CENTER);
    fill(220, 20, 60);
    text("GO!!", width/2, height/2);
    if (frameCount == 140) {
      onGame = true;
      startTime = frameCount;
    }
    
  } else {
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
