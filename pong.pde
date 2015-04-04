import processing.serial.*;
float ballX = 20;
float ballY = 20;
float ballR = 10;
float dX = random(2, 4);
float dY = random(2, 4);
float paddleX;
float paddleY = 10;
float paddleW = 10;
float paddleH = 30;
float paddle2X;
float paddle2Y = 10;
float paddle2W = 10;
float paddle2H = 30;
int player1Score = 0;
int player2Score = 0;


Serial port; // The serial port object
void setup() {
  size(800, 800);
    ballX = width-(width/2);
    ballY = height-(height/2);
    paddleX = width - 15;
    paddle2X = 15;
    //println(Serial.list()[2]);
     // Using the first available port (might be different on your computer)
  //port = new Serial(this, Serial.list()[2], 9600); 
  delay(1000);
}
 
void draw() {
 
  background(0, 0, 0);
   PFont f;
  f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f,36);
  fill(255);
  text(player1Score,40,40);
  text(player2Score,width-40, 40);
  ellipse(ballX, ballY, 2 * ballR, 2 * ballR);
 
  rect(paddleX, paddleY, paddleW, paddleH);
  rect(paddle2X, paddle2Y, paddle2W, paddle2H); 
  
  if (ballRight() > width) {
    fill(255, 0, 0, 100);
    rect(0, 0, width, height);
    player1Score += 1;
    ballX = width-(width/2);
    ballY = height-(height/2);
     
  }
  
  if(ballLeft() < 0){
    fill(255,0,0,100);
    rect(0,0,width, height);
    player2Score += 2;
    ballX = width-(width/2);
    ballY = height-(height/2);
  }
 
  if (collision()) {
    dX = -dX; // if dX == 2, it becomes -2; if dX is -2, it becomes 2
  }
 
  if (ballLeft() < 0) {
   // dX = -dX; // if dX == 2, it becomes -2; if dX is -2, it becomes 2
  }
 
  if (ballBottom() > height) {
    dY = -dY; // if dY == 2, it becomes -2; if dY is -2, it becomes 2
  }
 
  if (ballTop() < 0) {
    dY = -dY; // if dY == 2, it becomes -2; if dY is -2, it becomes 2
  }
 
  ballX = ballX + dX;
  ballY = ballY + dY;
}
 
boolean collision() {
  boolean returnValue = false; // assume there is no collision
  if ((ballRight() >= paddleX) && (ballLeft() <= paddleX + paddleW)) {
    if ((ballBottom() >= paddleY) && (ballTop() <= paddleY + paddleH)) {
      returnValue = true;
    }
  }
  if ((ballLeft() <= paddle2X) && (ballRight() >= paddle2X + paddle2W)) {
    if ((ballBottom() >= paddle2Y) && (ballTop() <= paddle2Y + paddle2H)) {
      returnValue = true;
    }
  }
  return returnValue;
}
 
 float ballLeft() { 
   return ballX-ballR;
 }
 
float ballRight() {
  return ballX + ballR;
}
 
float ballTop() {
  return ballY - ballR;
}
 
float ballBottom() {
  return ballY + ballR;
}
 
// based on code from http://processing.org/reference/keyCode.html
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      paddleY = paddleY - paddleH;
    } else if (keyCode == DOWN) {
      paddleY = paddleY + paddleH;
    }
  }
}

// Called whenever there is something available to read
void serialEvent(Serial port) {
  String val = port.readStringUntil('\n');         // read it and store it in val
      if (val != null)
      {     
        try
        {
        int[] nums = int(split(val, ','));
        
        
        //paddleY = nums[0]*400/100;
        //paddle2Y = nums[1]*400/100;
        //println(paddleY);
        //println(paddle2Y);  
      }
        catch(Exception e)
        {
        }
      }   
  // For debugging
  // println( "Raw Input:" + val);
}
