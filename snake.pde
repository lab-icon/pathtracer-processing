class Snake {
  float x, y;
  float speed = 2;
  boolean alive = true;
  boolean start = false;
  ArrayList<PVector> body = new ArrayList<PVector>();
  PVector head;
  float xdir, ydir;

  Snake(float x, float y) {
    this.x = x;
    this.y = y;
    for(int i = 0; i < 5; i++) {
      this.body.add(new PVector(this.x - i * 12, this.y));
    }
    this.head = this.body.get(0);
  }

  void setStart(boolean start) {
    this.start = start;
  }

  void setDir(float x, float y) {
    if(this.xdir == -x || this.ydir == -y) {
      return;
    }
    this.xdir = x;
    this.ydir = y;
  }

  void show() {
    pushMatrix();
    for(int i = 0; i < this.body.size(); i++) {
      // fill(colors[i], colors[i + 1], colors[i + 2]);
      fill(255);
      ellipse(this.body.get(i).x, this.body.get(i).y, 60, 60);
    }
    fill(0);
    float eyeRadius = 10;
    float eyeOffset = 20;
    float eyeX1 = this.body.get(0).x + this.xdir * eyeOffset - this.ydir * eyeOffset;
    float eyeY1 = this.body.get(0).y + this.ydir * eyeOffset + this.xdir * eyeOffset;
    float eyeX2 = this.body.get(0).x + this.xdir * eyeOffset + this.ydir * eyeOffset;
    float eyeY2 = this.body.get(0).y + this.ydir * eyeOffset - this.xdir * eyeOffset;
    ellipse(eyeX1, eyeY1, eyeRadius, eyeRadius);
    ellipse(eyeX2, eyeY2, eyeRadius, eyeRadius);
    popMatrix();
  }

  void update() {
    float bodyspeed = this.speed/50;
    for(int i = this.body.size() - 1; i > 0; i--) {
      float dx = this.body.get(i - 1).x - this.body.get(i).x;
      float dy = this.body.get(i - 1).y - this.body.get(i).y;
      float dist = sqrt(dx * dx + dy * dy);
      if(dist > 0) {
        this.body.get(i).x += dx * bodyspeed;
        this.body.get(i).y += dy * bodyspeed;
      }
    }
    this.body.set(0, new PVector(this.x, this.y));
  }

  void step() {
    if (this.start == true){
      this.speed = 2;
      if(this.xdir == 0 && this.ydir == 0){
        this.xdir = 1;
        this.ydir = 1;
      }
      else {
        this.x += this.xdir * this.speed;
        this.y += this.ydir * this.speed;
      }
    }
    else {
      this.speed = 0;
    }
  }

  void kill() {
    this.start = false;
    this.speed = 0;
    this.alive = false;
  }

  //void eat(Apple apple) {
  //  PVector head = this.body.get(0);
  //  float d = dist(head.x, head.y, apple.loc.x, apple.loc.y);
  //  if(d < 35) {
  //    this.speed += random(0.05,0.5);
  //    apple.location();
  //    this.body.add(new PVector(this.x, this.y));
  //  }
  //}
}
