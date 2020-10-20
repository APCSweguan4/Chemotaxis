int colonySize = 75;
Bacteria[] colony = new Bacteria[colonySize];
int screenSize = 700;
boolean backgroundON = true;
int speedCap = 6;
void setup()   
{
  size(700, 700);
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria();
    colony[i].newSpeed();
  }
}   
void draw()   
{
  if (backgroundON) {
    background(0);
  }
  for (int i = 0; i < colony.length; i++) {
    if (colony[i].myX + colony[i].mySpeed > screenSize) {
      colony[i].myRand = (int)(Math.random() * 3) + 1;
      if (colony[i].myRand == 1) {
        colony[i].myDir = 1;
      } else if (colony[i].myRand == 2) {
        colony[i].myDir = 8;
      } else {
        colony[i].myDir = 7;
      }
    }
    if (colony[i].myY + colony[i].mySpeed > screenSize) {
      colony[i].myRand = (int)(Math.random() * 3) + 1;
      if (colony[i].myRand == 1) {
        colony[i].myDir = 1;
      } else if (colony[i].myRand == 2) {
        colony[i].myDir = 2;
      } else {
        colony[i].myDir = 3;
      }
    }
    if (colony[i].myY - colony[i].mySpeed < 0) {
      colony[i].myRand = (int)(Math.random() * 3) + 1;
      if (colony[i].myRand == 1) {
        colony[i].myDir = 7;
      } else if (colony[i].myRand == 2) {
        colony[i].myDir = 6;
      } else {
        colony[i].myDir = 5;
      }
    }
    if (colony[i].myX - colony[i].mySpeed < 0) {
      colony[i].myRand = (int)(Math.random() * 3) + 1;
      if (colony[i].myRand == 1) {
        colony[i].myDir = 3;
      } else if (colony[i].myRand == 2) {
        colony[i].myDir = 4;
      } else {
        colony[i].myDir = 5;
      }
    }
    colony[i].move();
    colony[i].show();
  }
}  
void mousePressed() {
  for (int i = 0; i < colony.length; i++) {
    colony[i].newDir();  
  }
}
void keyPressed() {
  for (int i = 0; i < colony.length; i++) {
    if (keyCode == UP && colony[i].myActivity + 1 < 11) {
      colony[i].myActivity++;
    }
    if (keyCode == DOWN && colony[i].myActivity - 1 > 0) {
      colony[i].myActivity--;
    }
  }
  if (keyCode == LEFT && speedCap - 1 >= 4) {
      speedCap--;
    }
    if (keyCode == RIGHT && speedCap + 1 <= 11) {
      speedCap++;
    }
  if (key == 'r' || key == 'R') {
    colonySize = 75;
    colony = new Bacteria[colonySize];
    speedCap = 6;
    for (int i = 0; i < colony.length; i++) {
      colony[i] = new Bacteria();
      colony[i].newSpeed();
    }
  }
  if ((key == 'z' || key == 'Z') && colonySize + 10 < 206) {
    colonySize += 10;
    colony = new Bacteria[colonySize];
    for (int i = 0; i < colony.length; i++) {
      colony[i] = new Bacteria();
      colony[i].newSpeed();
    }
  }
  if ((key == 'x' || key == 'X') && colonySize - 10 > 0) {
    colonySize -= 10;
    colony = new Bacteria[colonySize];
    for (int i = 0; i < colony.length; i++) {
      colony[i] = new Bacteria();
      colony[i].newSpeed();
    }
  }
  if (key == ' ') {
    if (backgroundON) {
      backgroundON = false;
    } else {
      backgroundON = true;  
    }
  }
  if (key == 'c' || key == 'C') {
    for (int i = 0; i < colony.length; i++) {
      colony[i].myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));  
    }
  }
}
class Bacteria    
{
  int myX, myY, myColor, mySize, mySpeed, myDir, myRand, myActivity;
  Bacteria() {
    myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256));
    mySize = 15;
    myX = (int)(Math.random() * 401) + 125;
    myY = (int)(Math.random() * 401) + 125;
    myDir = (int)(Math.random() * 8) + 1;
    mySpeed = (int)(Math.random() * 6) + 1;
    myActivity = 2;
  }
  void newSpeed() {
    mySpeed = (int)(Math.random() * speedCap) + 1;
  }
  void newDir() {
    myDir = (int)(Math.random() * 8) + 1;
  }
  void tl() {
    newSpeed(); //different step each time
    myX -= mySpeed;
    myY -= mySpeed;
  }
  void up() {
    newSpeed();
    myY -= mySpeed;
  }
  void tr() {
    newSpeed();
    myX += mySpeed;
    myY -= mySpeed;
  }
  void r() {
    myX += mySpeed;
    newSpeed();
  }
  void br() {
    newSpeed();
    myX += mySpeed;
    myY += mySpeed;
  }
  void dwn() {
    newSpeed();
    myY += mySpeed;
  }
  void bl() {
    newSpeed();
    myX -= mySpeed;
    myY += mySpeed;
  }
  void l() {
    newSpeed();
    myX -= mySpeed;
  }
  void move() {
    if (myDir == 1) {
      tl();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 2) {
      up();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 3) {
      tr();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 4) {
      r();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 5) {
      br();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 6) {
      dwn();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 7) {
      bl();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    } else if (myDir == 8) {
      l();
      myX += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
      myY += (int)(Math.random() * (myActivity * 2 + 1)) - myActivity;
    }
  }
  void show() {
    noStroke();
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
}
