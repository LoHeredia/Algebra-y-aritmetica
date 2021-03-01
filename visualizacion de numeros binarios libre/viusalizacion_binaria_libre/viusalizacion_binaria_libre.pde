int nBits = 128; //entre cuantos segementos de numeros vamos a trabajr 0-31
float size;

void setup() {
  size(800, 800);
  background(255);
  noLoop(); 
  size = width-70; //este size es para que salga centrado 
  stroke(255);

  // Pies and scale
  //for (int j=0; j<16; j++) {
  //for (int k =0; k<10; k++) {

  for (int i = 0; i < 256; i++) { //este for recorre del 0 al 63
    float nums = 360.0/nBits; //esta variable asigna el tamaño en angulo de las rebanadas 360/32
    int nDig = decimalToBinary(i).length(); //leer cuantos digitos hay 

    for (int k = nDig-1; k > -1; k--) { //esto es un for invertido para que las rebanadas no se sobrepongan 
      String value = str(decimalToBinary(i).charAt(k)); // codigo de la clase que pinta de blanco o de negro (igual a 1 o 0)
      if (value.equals("1")) {
        noFill();
        fill(255,244,133);
        stroke(255,244,133);
      } else {
        fill(128,200,255);
        //stroke(128,200,255);
      }
      // Segment does not have a colour
      arc(width/2, height/2, (size/nDig)*(k+1), (size/nDig)*(k+1), radians(nums*i), radians((nums*i)+nums), PIE); //funcion arc(a, b, c, d, start, stop, mode)
      //(size/nDig) que tan grande va a ser la rebanda (k+i) para decir de que tamaño va a ser ese en partiuclar 
      
      //arc(width/2, height/2,(size/nDigis)*(k+1), (size/nDigis)*(k+1), (PI*i), (PI*i) + PI, PIE);
      
      fill(0);
      fill(255);
    }
  }
}

String decimalToBinary (int decimal) {
  String binary = "";
  while (decimal > 0) {
    int bit = decimal%2;
    binary = bit + binary;
    decimal = decimal/2;
  }

  return binary;
}
