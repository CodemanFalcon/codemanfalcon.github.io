PImage img;
float r;//kaleidoscope radius
float angle = radians(45);//" angle
float imgAngleOff = 0;//offset angle when uv mapping

void setup(){
  size(1000, 1000, P3D);
  r = height;
  //String url = "https://d1o50x50snmhul.cloudfront.net/wp-content/uploads/2017/09/28161418/behemoth_blackhole.jpg";
  img = loadImage("behemoth_blackhole.jpg");
  noStroke();textureMode(NORMAL);
  
}

void draw(){
  background(0);
  angle = PI/(int)map(mouseX, 0, width, 2, 36);
  float offset = map(mouseY, 0, height, 0.0001, 0.01);
  beginShape(TRIANGLE_FAN);
  texture(img);
  vertex(width/2, height/2, 0.5, 0.5);
  float angleOff = 0;
  for(int i=0; i<TWO_PI/angle; i++){
    float uvAngle1 = imgAngleOff;
    float uvAngle2 = angle+imgAngleOff;
    if(i%2 == 1){
      uvAngle2 = imgAngleOff;
      uvAngle1 = angle+imgAngleOff;
    }
    vertex(width/2+cos(angleOff)*r, height/2+sin(angleOff)*r, 0.5+cos(uvAngle1)/2, 0.5+sin(uvAngle1)/2);
    vertex(width/2+cos(angle+angleOff)*r, height/2+sin(angle+angleOff)*r, 0.5+cos(uvAngle2)/2, 0.5+sin(uvAngle2)/2); 
    angleOff += angle;
  }
  endShape();
  imgAngleOff += offset;
}
