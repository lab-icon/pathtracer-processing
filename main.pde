Snake snake;
//Apple apple;

static int initialX = 700;
static int initialY = 500;

boolean breaking = false;

void setup() {
  fullScreen();
  background(0);

  reset();
  mapper();

}

void draw() {
  mapMonitor();

  // apple.show();
  for (int i = 0; i < lines.size(); i++) {
    if (breaking) {
      break;
    }
    
    //Line specificLine = lines[i];
    //println(specificLine);

    // if (specificLine.crossedLine(snake.x, snake.y, snake.body[4].x, snake.body[4].y, specificLine)) {
    //   breaking = true;
    //   snake.kill();
    //   breaking = true;
    // }

  }

  snake.show();
  snake.update();
  snake.mouseChase();
}

void mapMonitor() {
  push();  
  noStroke();
  fill(255,209,0);
  
  // SUPERIOR ESQUERDO
  int mx1 = round(481);
  int my1 = round(0);
  int mw1 = round(400);
  int mh1 = round(640);
  rect(mx1,my1,mw1,mh1);

  // SUPERIOR DIREITO
  int mx2 = round(928);
  int my2 = round(66);
  int mw2 = round(640);
  int mh2 = round(400);
  rect(mx2,my2,mw2,mh2);
  

  // INFERIOR ESQUERDO 
  int mx3 = round(351);
  int my3 = round(572);
  int mw3 = round(640);
  int mh3 = round(360);
  rect(mx3,my3,mw3,mh3); 
  
  // INFERIOR DIREITO
  int mx4 = round(1047);
  int my4 = round(440);
  int mw4 = round(400);
  int mh4 = round(640);
  rect(mx4,my4,mw4,mh4);
  
  fill(255,209,0); // cor dos monitores 
  int mbx1 = round(879);
  int mby1 = round(66);
  int mbw1 = round(60);
  int mbh1 = round(400);
  rect(mbx1,mby1,mbw1,mbh1); // borda de cima
  
  int mbx2 = round(989);
  int mby2 = round(572);
  int mbw2 = round(60);
  int mbh2 = round(360);   
  rect(mbx2,mby2,mbw2,mbh2); // borda de baixo
  
  pop();
}

 void keyPressed() {
  if (keyCode == ENTER) {
    snake.setStart(true);
    if (snake.alive == false){
      reset();
    }
  }

  if (keyCode == UP) {
    snake.setDir(0, -1);
  } 
  if (keyCode == DOWN) {
    snake.setDir(0, 1);
  }
  if (keyCode == RIGHT) {
    snake.setDir(1, 0);
  }
  if (keyCode == LEFT) {
    snake.setDir(-1, 0);
  }
}

void reset() {
  snake = new Snake(initialX,initialY);
  // apple = new Apple();
  breaking = false;
}
