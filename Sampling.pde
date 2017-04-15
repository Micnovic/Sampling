PImage image;
float imageWidth;
float imageHeight;

float canvasWidth;
float canvasHeight;

ArrayList<Sample> samples = new ArrayList<Sample>();
int numberOfSamples = 1000;

void setup(){
  size(600, 600);
  canvasWidth = width;
  canvasHeight = height;
  
  image = loadImage(sketchPath() + "/data/img.jpg");
  scaleImage(); //scale image to fit canvas
  
  //fill canvas with samples
  for(int i = 0; i < numberOfSamples; i++){
    samples.add(new Sample(sampler(10)));
  }
}

void draw(){
  background(0);
  imageMode(CENTER);
  image(image, width/2, height/2, imageWidth, imageHeight);
  
  for(int i = 0; i < samples.size(); i++){
    samples.get(i).display(); 
  }
}

void scaleImage(){
  //функция устанавливает перемнные imageWidth и imageHeight, чтобы image умещалось в окно программы
  float aspect;
  if(image.width > image.height){
    aspect = canvasWidth/image.width;
    imageWidth = canvasWidth;
    imageHeight = image.height*aspect;
  } else {
    aspect = canvasHeight/image.height;
    imageHeight = canvasHeight;
    imageWidth = image.width*aspect;
  }
}

PVector sampler(int numberOfCandidates){
  //функция возвращает координаты нового сэмпла, основанные на расположении существующих сэмплов
  //сделано по примеру отсюда: https://bost.ocks.org/mike/algorithms/
  PVector bestCandidatePosition = new PVector(0,0);
  float bestDistance = 0;

  for(int i = 0; i < numberOfCandidates; i++){
    PVector tryPosition = new PVector(random(0,imageWidth), random(0,imageHeight));
    float closest = Float.POSITIVE_INFINITY;
    for(int j = 0; j < samples.size(); j++){
      float tryDistance = dist(tryPosition.x, tryPosition.y, samples.get(j).position.x, samples.get(j).position.y); 
      if(tryDistance < closest){
        closest = tryDistance;
      }
    }
    if(closest > bestDistance){
      bestDistance = closest;
      bestCandidatePosition = tryPosition;
    }
  }
 return bestCandidatePosition;
}