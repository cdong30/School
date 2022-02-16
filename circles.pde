class circles{
  float x = width/7;
  float y = height/7;
  float c = color(0);
  
  Ani expandAni;
  float expandStart = 200;
  float expandEnd = 5;
  float expand = expandStart;
  float duration = 0.5;
  
  circles(float ax, float ay, float radii, color ac){
    x = ax;
    y = ay;
    expandStart = radii;
    c = ac;
    fill(ac);
    expandAni = new Ani(this, duration, "expand", expandEnd);
    expandAni.pause();
    expand = expandEnd;
  }
  
  void bang(){
    expand = expandStart;
    expandAni.seek(0);
    expandAni.resume();
  }
  
  void display(){
    circle(x, y, expandStart);
  }
}
