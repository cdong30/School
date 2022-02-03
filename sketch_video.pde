import processing.video.*;
Capture video;

void setup() {
  size(640,480);
  video = new Capture(this,Capture.list()[0]);
  video.start();
}

void draw() {
    video.resize(width,height);
    image(video,0,0);
}

void captureEvent(Capture video) {
  video.read();
}  
