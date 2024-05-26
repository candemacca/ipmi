//Alumna: Candela Macca
//Legajo: 119072/9
//DNI: 47261016
//Comision: 3
//Profesor: David Bedoian

PImage portada, obra1, obra2, obra3;

PFont fuente;

float px, py;

int estado, contador;

String parrafo1, parrafo2, parrafo3;

float opacidadTexto = 255;


void setup() {
  //asignacion de valores
  size (640, 480);
  portada = loadImage("portada.jpg");
  obra1 = loadImage("pantalla1.jpg");
  obra2 = loadImage("pantalla2.jpg");
  obra3 = loadImage("pantalla3.jpg");

  parrafo1= "La exhibición `Imagine Van Gogh´\nes una experiencia inmersiva\nque combina arte, música\ny tecnología para ofrecer\nuna nueva perspectiva sobre\nlas obras del famoso pintor Vincent van Gogh."; 
  
  parrafo2="Incluyendo algunas de sus\npinturas más icónicas como\n`La noche estrellada´\n`Los girasoles´\n`La habitación de Arlés´, etc";

  parrafo3="La exhibición se realiza mediante una técnica\nllamada`proyección mapeada´o `mapping´.\nLas obras de son escaneadas y luego\nproyectadas sobre superficies\ncomo paredes o pantallas,\nde manera que las imágenes se ajusten\na la forma de la superficie.";

  py=height;
  px=20;
  estado=1;
  contador=0;

  fuente = loadFont("Impact-48.vlw");
}
void draw() {
  

  if (estado==1) {
    //PANTALLA 1 (portada)(Sin transicion)
    background(148, 188, 112);
    image(portada, 10, 10);
    textFont(fuente);
    textAlign(CENTER, CENTER);
    textSize(70);
    fill(255, 254, 224);

    text("IMAGINE VAN GOGH", width/2, 150);
    textSize(50);
    text("La Rural", width/2, 220);

    contador++;
    if (contador>=100) {
      estado++;
      contador=0;
    }
  } else if (estado==2) {
    //PANTALLA 2 (Obra 1)
    background(129, 142, 224);
    image(obra1, 10, 10);

    fill(255);
    textFont(fuente);
    textAlign(LEFT);
    textSize(30);
    text(parrafo1, px, py);

    contador++;
    if (contador>=10) {
      estado++;
      contador=0;
    }
  } else if (estado==3) {
    //transicion texto

    background(129, 142, 224);
    image(obra1, 10, 10);

    float tono = map (py, 290, 180, 255, 0);
    fill(255, tono);
    textFont(fuente);
    textAlign(LEFT);
    textSize(30);
    text(parrafo1, px, py);

    if (py>=50) {
      py --;
      contador=contador+1;
      if (contador==300) {
        estado++;
        contador=0;
      }
    }
  } else if (estado==4) {
    //PANTALLA 3 (Obra 2)
    background(255, 255, 88);
    image(obra2, 10, 10);
    fill(255);
    textFont(fuente);
    textAlign(LEFT);
    textSize(40);
    text(parrafo2, 20, 50);

    contador++;
    if (contador>=20) {
      estado++;
      contador=0;
    }
  } else if (estado==5) {
    //transicion texto
  
    background(255, 255, 88);
    image(obra2, 10, 10);

    fill(255, opacidadTexto);
    textFont(fuente);
    textAlign(LEFT);
    textSize(map(opacidadTexto, 255, 0, 40, 0 ));
    text(parrafo2, 20, 50);

    opacidadTexto-=2;
    if (opacidadTexto<=0) {
      estado=6;
      contador=0;
      opacidadTexto=255;
    }
  } else if (estado==6) {
    //PANTALLA 4(Obra 3)
    background(180, 97, 58);
    image(obra3, 10, 10);
    fill(255);
    textFont(fuente);
    textAlign(LEFT);
    textSize(30);
    text(parrafo3, 20, py);
     contador++;
    if (contador>=20) {
      estado++;
      contador=0;
    }
    
  }
  else if  (estado>=7){
    //transicion texto
    background(180, 97, 58);
    image(obra3, 10, 10);
    fill(255);
    textFont(fuente);
    textAlign(LEFT);
    textSize(30);
    text(parrafo3, 20, py);
    py-=1;
//Boton de reinicio
    if ( mouseX>450 && mouseX<450+130
      && mouseY >400 && mouseY<400+40 ) {
      fill(70, 49, 24);
    } else {
      fill(253, 255, 242);
    }

    rect( 450, 400, 130, 40);
    fill(178, 134, 81);
    textSize(29);
    text("REINICIAR", 460, 430);
  } else {
    //un estado no previsto
  }
}


void mousePressed() {


  if (estado==7) {
    if (mouseX>450 && mouseX<450+130
      && mouseY >400 && mouseY<400+40) {
      estado = 1;
      py=height;
      contador=0;
    }
  } else {
    estado++;
    contador = 0;
    println (estado);
  }
}
