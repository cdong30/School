class circles{
  float x = width/10;
  float y = height/10;
  float c = color(0);
  
  Ani expandAni;
  float expandStart = 200;
  float expandEnd = 5;
  float expand = expandStart;
  float duration = 0.5;
  
  circles(){
    expandAni = new Ani(this, duration, "expand", expandEnd);
    expandAni.pause();
    expand = expandEnd;
  }
  
  void bang(){
    expand = expandStart;
    expandAni.seek(0);
    expandAni.resume();
  }
}
