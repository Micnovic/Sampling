class Sample{
  PVector position;
  float radius = 4;
  color clr = color(255,0,0);
  //TODO: можно добавить больше параметров сэмплу, которые будут учитываться, при его расположении на изображении.
  //например, зависимость от яркости пиксела изображения
  
  Sample(PVector _position){
    position = _position;
  }
  
  void display(){
   noStroke();
   fill(clr);
   //координаты сэмпла откладываются от левого верхнего угла image
   ellipse((canvasWidth/2 - imageWidth/2) + position.x, (canvasHeight/2 - imageHeight/2) + position.y, radius, radius);
  }
}