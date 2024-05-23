
PImage portada, obra1, obra2, obra3;

PFont fuente;

int py, px;

int estado;

String parrafo,parrafo2;

int contador;


void setup() {
  size (640, 480);
  portada = loadImage("portada.jpg");
  obra1 = loadImage("pantalla1.jpg");
  obra2 = loadImage("pantalla2.jpg");
  obra3 = loadImage("pantalla3.jpg");
  
  parrafo="La expocision, que se llevó a cabo en La Rural, \nfue una experiencia inmersiva que permitió \na los visitantes sumergirse en la vida \ny obra del famoso pintor postimpresionista \nVincent van Gogh.";
  parrafo2="Incluyendo algunas de sus pinturas\nmás icónicas como\n~La noche estrellada~, ~Los girasoles~,\n~La habitación de Arlés~, etc";

  py=height;
  px=width;
  estado=0;
  contador=0;

  fuente = loadFont("Impact-48.vlw");
}
void draw() {
println ("estado="+estado);
  contador++;
  if (contador>=100) {
    estado++;
    contador=0;
  } else if (estado>=4) {
    estado=0;
  }
  if (estado==0) {
    //PANTALLA A
    background(148, 188, 112);

    image(portada, 10, 10);
    textFont(fuente);
    textAlign(CENTER, CENTER);
    textSize(70);
    fill(255, 254, 224);

    text("IMAGINE VAN GOGH", width/2, 150);
    textSize(50);
    text("La Rural", width/2, 220);
  } else if (estado==1) {
    //PANTALLA B
    background(129, 142, 224);
    image(obra1, 10, 10);

    fill(255);
    textFont(fuente);
    textAlign(LEFT);
    textSize(30);
    text(parrafo, 20, py);
    if(py>50){
      py --;
    }
  } else if (estado==2) {
    //PANTALLA C
    background(255, 255, 88);
    image(obra2, 10, 10);

    fill(255);
    textFont(fuente);
    textAlign(LEFT);
    textSize(28);
    text(parrafo2, 20, py);
    if (py>50){
      py--;
    }
  } else if (estado==3) {
    //PANTALLA D
    background(180, 97, 58);
    image(obra3, 10, 10);
  }
}

void mousePressed() {
  estado=estado+1;
  contador=0;
  if (contador>=estado);
  if (estado>=4)
    estado=0;
  println (estado);
}
