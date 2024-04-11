int centX, centY, lensX;
int imagefocusX, objectfocusX;
int objectlength, lenslen, imagelength;
int a, b, f, r;

PFont font; // PFont is font data type

void setup(){
  size(1200, 500);
  background(255);
  font = loadFont("Jokerman-Regular-48.vlw"); // loading font file I maked
  textFont(font, 50); // selecting size 16
  fill(0); // color of font
  
  centY = height/2 ;
  centX = width/2 ;
  lensX= 600;
  f = 100; //focuslength
  r = 2*f; //radius of curvature 
  
  imagefocusX = lensX + f;
  objectfocusX = lensX - f;
  
  objectlength = 50;
}

void draw(){
  if(mouseX > 565) mouseX = 565; // can't go to opposite side

  stroke(0); //black
  background(255);
  strokeWeight(3); //thickness

  noFill();
  arc(lensX - r, centY, 2*r+62,  2*r+62, -PI/6, PI/6); // right surface of lense
  arc(lensX + r, centY, 2*r+62,  2*r+62, PI*5/6, PI*7/6); //left surface of lense
  line(0,centY,width,centY); // axis of lens
  
  stroke(0,255,0); //green
  line(mouseX,centY-objectlength, mouseX, centY); //object
  
  a = lensX - mouseX; // object distance from lens
  if(a != f) b = a*f/(a-f);  // image distance from lens
  else       b = -1000;   //  for a-f != 0
  if(a != 0) imagelength = b*objectlength/a;  // imagelength
  else       imagelength = objectlength; // for imagelength != infinite
  
  stroke(255, 0 , 0); //red
  line(lensX + b, centY, lensX + b,centY + imagelength); // image
 
  stroke(0); //black
  line(mouseX,centY-objectlength, lensX, centY-objectlength); // from object top to lens surface
  line(lensX, centY-objectlength,lensX+100*(imagefocusX-lensX), centY-objectlength +100*(objectlength)); // from lens surface to ...+
  stroke(129); //gray
  line(lensX, centY-objectlength,lensX-100*(imagefocusX-lensX), centY-objectlength -100*(objectlength)); // from lens surface to ...-
  
  stroke(0); //black
  line(mouseX,centY-objectlength, lensX, centY); // from object top to lens center
  line(lensX, centY, lensX+100*(lensX-mouseX), centY+100*(objectlength)); // from lens cetner to ...+
  stroke(129); //gray
  line(mouseX,centY-objectlength,lensX-100*(lensX-mouseX), centY-100*(objectlength)); // from lens cetner to ...-
  
  stroke(7,181,232); //sky color
  strokeWeight(3);
  point(imagefocusX,centY); // image focus
  point(objectfocusX,centY); // object focus
  
  stroke(255,247,0); //yellow
  point(lensX + r,centY); // 2* image focus
  point(lensX - r,centY); // 2* object focus
  
  text("convexlens simulation", 600, 50);
  text("a: ", 1000, 100);
  text(a, 1050, 100);   // displaying a value
  text("b: ", 1000, 150); 
  if(a != f) text(b, 1050, 150);  // displaying b value
  else       text("X",1050,150);
  text("f: ", 1000, 200);
  text(f, 1050, 200);  // displaying f
}

void mousePressed(){ //if mouse is clicked
  saveFrame("image/img-####.tif");   // takeing a picture and saving it in a file named 'image'
}
