class cube {
  float xp;
  float yp;
  float yAmp; // Amplitude en y
  float ty;
  float ty_m;
  float a;
  float inc;
  color cG, cD, cH;

  cube(float x_, float y_, float ty_, float ty_m_, float i_, float a_, color cG_, color cD_, color cH_) {
    xp = x_;
    yp = y_;
    ty = -ty_;
    ty_m = ty_m_;
    inc = i_;
    a = a_;
    cG = cG_;
    cD = cD_;
    cH = cH_;
    noStroke();
    colorMode(HSB, 360, 100, 100);
  }

  void update() {
    yAmp = norm(sin(a), -1, 1) * ty - ty_m + yp;
    a += inc;
  }

  void display() {
    fill(cG);
    quad(xp-12.5, yAmp, xp, yAmp+10.0, xp, yp+10.0, xp-12.5, yp); // Gauche
    fill(cD);
    quad(xp, yAmp+10.0, xp+12.5, yAmp, xp+12.5, yp, xp, yp+10.0); // Droit
    fill(cH);
    quad(xp-12.5, yAmp, xp, yAmp+10.0, xp+12.5, yAmp, xp, yAmp-10.0); // Haut
  }
} // fin de la classe
