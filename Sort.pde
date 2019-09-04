//----------------------------Ben Pennell-------------------------------//
//---------------------------Image Sorting------------------------------//
//-------------------------September 4, 2019----------------------------//

float shade = 0;
int frames = 0;
boolean scrambling = true;
int[] indexes; 
int bubble = 0;
PImage image;

//----------------------------------------------------------------------//

void setup() {
  //Seting up the image and screen size
  image = loadImage("Together.jpg");
  size(200, 111); // set to image width and image height
  image(image, 0, 0);
  indexes = new int[22201]; // image width * image height


  for (int i = 0; i < indexes.length; i++) {
    indexes[i] = i;
  }
}

//----------------------------------------------------------------------//

void draw() {

  //Scrambling  + animation
  loadPixels();
  if (scrambling) {
    for (int i = 0; i < width; i++) {

      int rand1 = floor(random(pixels.length));
      int rand2 = floor(random(pixels.length));

      color c = pixels[rand1];
      pixels[rand1] = pixels[rand2];
      pixels[rand2] = c;

      int buffer = indexes[rand1];
      indexes[rand1] = indexes[rand2];
      indexes[rand2] = buffer;
    }
    frames++;
    if (frames > height) {
      scrambling = false;
    }
  } 

  //----------------------------------------------------------------------//

  //BUBBLE SORT -> un-comment to insertion sort, does a different animation!
  /*<-----------------------
   if (!scrambling) {
   for (int i = 0; i < 1000000; i++) {
   if (indexes[bubble] > indexes[bubble + 1]) {
   
   color c = pixels[bubble + 1];
   pixels[bubble + 1] = pixels[bubble];
   pixels[bubble] = c;
   
   int buffer = indexes[bubble + 1];
   indexes[bubble + 1] = indexes[bubble];
   indexes[bubble] = buffer;
   }
   bubble++;
   
   if (bubble == indexes.length - 1) {
   bubble = 0;
   }
   }
   }
   ------------------------>*/
  //BUBBLE SORT DONE

  //INSERTION SORT -> MAKE SURE YOU COMMENT OUT IF YOU ARE GOING TO BUBBLE SORT

  if (!scrambling) {
    for (int j = 0; j < 100; j++) {
      int current = frames - height;
      frames++;
      if(current == indexes.length - 1) {
        noLoop();
        break;
      }
      for (int i = 0; i < indexes.length; i++) {
        if (indexes[i] == current) {

          color c = pixels[current];
          pixels[current] = pixels[i];
          pixels[i] = c;

          int buffer = indexes[current];
          indexes[current] = indexes[i];
          indexes[i] = buffer;

          i = indexes.length + 1;
        }
      }
    }
  }

  //INSERTION SORT DONE

  updatePixels();
}
