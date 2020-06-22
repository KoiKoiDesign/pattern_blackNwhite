int sc = 1;

int nx = 24/sc + 1;
int ny = 44/sc + 2;
cube[][] c = new cube[nx][ny];

int n = 0;

float d;
float a; // angle (hauteur) initial des cubes

void setup() {
  size(500, 500);
  pixelDensity(displayDensity());
  frameRate(25);

  for (int i = 0; i < nx; i++) {
    for (int j = 0; j < ny; j++) {

      if (j % 2 == 0) { // Blanc
        d = dist((width/2+10)/sc, (height/2+10)/sc, i*25+12.5, j*12.5); // "+10" => éviter que les 4 du centre bougent en synchro
        a = map(d, 0, width, 0, TWO_PI*4);
        c[i][j] = new cube(i*25+12.5, j*12.5, 20, 10, 0.2, a, #E8E8E8, #CECECE, #FFFFFF); // settings 1
        //c[i][j] = new cube(i*25+12.5, j*12.5, 10, 10, 0.2, a, #E8E8E8, #CECECE, #FFFFFF); // settings 2
        //c[i][j] = new cube(i*25+12.5, j*12.5, 10, 10, 0.2, a, #E8E8E8, #CECECE, #FFFFFF); // settings 3
      } else { // Noir
        d = dist((width/2+10)/sc, (height/2+10)/sc, i*25, j*12.5);
        a = map(d, 0, width, 0, TWO_PI*4); // "+10" => éviter que les 4 du centre bougent en synchro
        c[i][j] = new cube(i*25, j*12.5, 20, 10, 0.2, a, #343434, #272727, #4D4D4D); // settings 1
        //c[i][j] = new cube(i*25, j*12.5, 10, 10, 0.2, -a, #343434, #272727, #4D4D4D); // settings 2 : juste "-a" et hauteur max
        //c[i][j] = new cube(i*25, j*12.5, 10, 10, -0.2, a, #343434, #272727, #4D4D4D); // settings 3 : incrément inversé (-0.2)
      }
    }
  }
}

void draw() {
  //println(frameRate, millis());
  //println(mouseX, mouseY);
  background(#FFFFFF);
  scale(sc, sc);

  for (int j = 0; j < ny; j++) { // j en premier pour que le cube soient bien l'un devant l'autre
    for (int i = 0; i < nx; i++) {
      c[i][j].update();
      c[i][j].display();
    }
  }

  /*
  if (millis() >= 2000) {
   saveFrame("capture_########.jpg");
   n++;
   }
   if (n >= 120) {
   exit();
   }
   */
   
   
   
}
