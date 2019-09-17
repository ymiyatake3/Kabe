// A class to keep the information of a player
class Player {
  int num;  // Player number. 0 or 1
  int score;
  Wall wall;
  
  Player(int n) {
    num = n;
    score = 40;
    wall = new Wall(num);
  }
  
  // Push by keyboard
  int push(int a) {
    if (!wall.bars[a].on) {
      wall.bars[a].turn();
      score += 10;
    }
    return a;
  }
  
  // Push randomly
  int push() {
    // Random integer value from 0 to 8
    int r = int(random(0, 9));
    int ret = 0;
    if (!wall.bars[r].on) {
      wall.bars[r].turn();
      score += 10;
      ret = r;
    } else {
      ret = -1;
    }
    return ret;
  }
  
  void pushed(int b) {
    if (wall.bars[b].on) {
       wall.bars[b].turn();
       score -= 10;
    }
  }
}
