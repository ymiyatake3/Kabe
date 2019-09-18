Panel left, right; 
int playtime = 600;  // 10sec
int remainSec = 10;
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
    // Playtime decrease
    playtime--;
    if (playtime % 60 == 0) {
      remainSec--;
    }
    
    // Randomly push each other once in 0.5s
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
    
    // End game
    if (playtime == 0) {
      onGame = false;
    }
    
    left.display();
    right.display();
    fill(255);
    rectMode(RADIUS);
    rect(width/2, 40, 50, 60);
    textSize(60);
    textAlign(CENTER, CENTER);
    fill(0, 0, 0);
    text(remainSec, width/2, 40);
    
  } else if (frameCount <= 100){
    // Ready...
    left.display();
    right.display();
    textSize(120);
    textAlign(CENTER, CENTER);
    fill(0, 128, 128);
    text("READY...", width/2, height/2);
    
  } else if (frameCount <= 140) {
    // Go!
    left.display();
    right.display();
    textSize(200);
    textAlign(CENTER, CENTER);
    fill(220, 20, 60);
    text("GO!!", width/2, height/2);
    if (frameCount == 140) {
      onGame = true;
    }
    
  } else {
    // After finish
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
