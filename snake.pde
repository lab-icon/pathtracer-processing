class Snake {
  private float x, y;
  private float speed = 2;
  private boolean alive = true;
  private boolean start = false;
  private ArrayList<PVector> body = new ArrayList<PVector>();
  private PVector head;
  private float xdir, ydir;
  private float radius = 60;

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

  ArrayList<PVector> getBody() {
    return this.body;
  }

  void show() {
    pushMatrix();
    for(int i = 0; i < this.body.size(); i++) {
      // fill(colors[i], colors[i + 1], colors[i + 2]);
      fill(255);
      
      circle(this.body.get(i).x, this.body.get(i).y, this.radius);
    }
    fill(0);
    float eyeRadius = 10;
    push();
    float circleposX = this.body.get(0).x;
    float circlePosY = this.body.get(0).y;
    translate(circleposX, circlePosY);
    float eyeX1 = x + this.radius / 2 * this.xdir + this.radius / 2 * this.ydir;
    float eyeY1 = y + this.radius / 2 * this.ydir - this.radius / 2 * this.xdir; 
    float eyeX2 = x + this.radius / 2 * this.xdir - this.radius / 2 * this.ydir;
    float eyeY2 = y + this.radius / 2 * this.ydir + this.radius / 2 * this.xdir;
    pop();
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

  void mouseChase() {
    if(this.start == true) {
      float dx = mouseX - this.x;
      float dy = mouseY - this.y;
      float dist = sqrt(dx * dx + dy * dy);
      if(dist > 0) {
        this.x += dx / dist * this.speed;
        this.y += dy / dist * this.speed;
      }
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
