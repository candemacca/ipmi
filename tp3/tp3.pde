// Link Youtube: https://youtu.be/ZSbdoiE7gZI
//Alumna: Candela Macca
//Legajo: 119072/2
//Comision 3
//Profesor: David Bedoian
PImage referencia;
int cant = 12;
int corazonesCant = 13;
float ubic;

void setup() {
  size(800, 400);
  referencia = loadImage ("obra.jpg");

}

void draw() {
  background(255);
  image(referencia, 0, 0);
  ubic = 400/cant;

  for (int i = 0; i < cant; i++) {
    for (int j = 0; j < cant; j++) {
      if ((i + j) % 2 == 0) {
        fill(255, 214, 233); 
      } else {
        fill(188, 112, 184); 
      }
      noStroke();
      rect(400+i*ubic, j*ubic, ubic, ubic); 
    }
  }

  for (int i = 0; i < corazonesCant; i++) {
    for (int j = 0; j < corazonesCant; j++) {
      float tam = calcularTam(400+i*ubic, j*ubic);
     
      if ((i + j) == 1 || (i+j) == 4 || (i+j) == 6 || (i+j) == 7 ||(i+j) == 9 || (i+j) == 12 || (i+j) == 15 ||(i+j) == 17 || (i+j) == 19 || (i+j) == 20|| (i+j) == 22) {
        fill(255); 
      } else {
        fill(210, 0, 0); 
      }
      noStroke();
      corazon(400+i*ubic, j*ubic, tam); 
    }
  }
}

//Función con parámetros que no retorna un valor
void corazon(float x, float y, float size) {
  float escala = size / 10;
  beginShape();
  vertex(x, y);
  bezierVertex(x + escala*5, y - escala*5, x + escala*10, y, x, y + escala*12);
  bezierVertex(x - escala*10, y, x - escala*5, y - escala*5, x, y);
  endShape();
}

//Función con parámetros que retorna un valor
float calcularTam(float x, float y) {
  float distancia = dist(mouseX, mouseY, x, y);
  float diagonal = dist(0, 0, width, height);
  return map(distancia, 100, diagonal, 5, ubic/2); 
}

void mousePressed() {
  if (cant > 2) {
    cant--;
  }
}

void keyPressed() {
  cant = 12; 
}
