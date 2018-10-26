class Sprite{
  
  PImage[] runImg = new PImage[42];
  PImage[] jumpImg = new PImage[36];
  float[] coord = {0, 0};
  int[] size ={113/2, 176/2};
  int imgCount = 0;
  
  Sprite(float x, float y){
    coord[0] = x;
    coord[1] = y;
  }
  
  void reset(){
    imgCount = 0;
    coord[0] = displayWidth/10;
    coord[1] = 0;
  }
  
  void paint(int groundPos){
    if(coord[1] < 0){
      image(jumpImg[imgCount], coord[0] -35, coord[1] + groundPos - size[1]);
      if(imgCount >= jumpImg.length-1){
        imgCount = jumpImg.length-1;
      }
      else{
        imgCount = imgCount + 1;
      }
    }
    else{
      image(runImg[imgCount], coord[0], coord[1] + groundPos - size[1]);
      if(imgCount >= runImg.length-1){
        imgCount = 0;
      }
      else{
        imgCount = imgCount + 1;
      }
    } 
  }
  
  void setImgCount(int value){
    imgCount = value;
  }
  
  int[] getSize(){
    return size;
  }
  
  float[] getCoord(){
    return coord;
  }
  
  void setCoord(float value, int index){
    coord[index] = value;
  }
  
  void loadRunImg(){
    for(int i = 0; i < runImg.length; i++){
      runImg[i] = loadImage(String.format("sprite/run/%d.png", i));
      runImg[i].resize(size[0], size[1]);
    } 
  }
  
  void loadJumpImg(int w, int h){
    for(int i = 0; i < jumpImg.length; i++){
      jumpImg[i] = loadImage(String.format("sprite/jump/%d.png", i));
      jumpImg[i].resize(w, h);
    } 
  }

}
