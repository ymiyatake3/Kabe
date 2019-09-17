// A class to save the status of a wall
class Wall {
  // For decision of the first condition.
  // Take the number of 0 or 1.
  int whichSide;
  
  // Each wall has 8 bars, but setting it to 9 for simplification
  final int barnum = 9;
  Bar[] bars = new Bar[barnum];
  
  Wall(int n) {
    whichSide = n;
    for (int i = 0; i < barnum; i++) {
      bars[i] = new Bar(false);
    }
    init(whichSide);
    // Set bar[4] ON for not being pushed 
    bars[4].turn();
  } 
  
  void init(int whichSide) {
    // Set the first lighting status. 
    // Each player has 4 turning-on bars at first.
    int[] p0 = {0, 2, 6, 8};
    int[] p1 = {1, 3, 5, 7};
    int[] turnOn = new int[4];
    if (whichSide == 0) {
      arrayCopy(p0, turnOn);
    } else {
      arrayCopy(p1, turnOn);
    }
    for (int i = 0; i < barnum / 2; i++) {
      bars[turnOn[i]].turn();
    }
  } 
}
