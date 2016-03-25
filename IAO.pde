/**
 * Words. 
 * 
 * The text() function is used for writing words to the screen.
 * The lettres can be aligned left, center, or right with the 
 * textAlign() function. 
 */

PFont f,f2;
import java.util.*;

String citation = "De tout ce qui est écrit, je n’aime que ce que l’on écrit avec son propre sang. Écris avec du sang et tu apprendras que le sang est esprit.";
int x, y;
int maxWidth = 500;
int minWidth = width/8;
int minHeight = height;
int fontSize = 32;
int hasBrackets = 0;
float x1, y1,x2,y2;


void setup() {
  size(640, 520);

  // Create the font
  //  printArray(PFont.list());
  f = createFont("SourceCodePro-Regular.ttf", fontSize);
  f2 = createFont("SourceCodePro-Regular.ttf", fontSize*2);
  textFont(f);
  background(255);
  textAlign(LEFT);
  //text(citation, minWidth, minHeight-50, 500, 500);
  fill(0);
  drawType(minWidth);
}

void draw() {
}

// b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,y,z

boolean voyelle(char lettre) {
  lettre = Character.toLowerCase(lettre);
  if (lettre == 'a' || lettre == 'e' || lettre == 'i' || lettre == 'o' || lettre == 'u')
  {
    return true;
  } else
  {
    return false;
  }
}
//atomar per el culo
boolean exposant(char lettre) {
  if (lettre == 'd' || lettre == 'f' || lettre == 'h' || lettre == 'k' || lettre == 'l' || lettre == 't')
  {
    return true;
  } else
  {
    return false;
  }
}

boolean indice(char lettre) {
  if (lettre == 'c' || lettre == 'm' || lettre == 'n' || lettre == 'p' || lettre == 'q'  || lettre == 's' || lettre == 'w')
  {
    return true;
  } else
  { 
    return false; 
  }
}

boolean autreConsonne(char lettre) {
  if (lettre == 'b' || lettre == 'g' || lettre == 'j' || lettre == 'r' || lettre == 'v' || lettre == 'y' || lettre == 'z')
  {
    return true;
  } else
  {
    return false;
  }
}

String raccourcir(String mot, int x, int y) {
  String note = "";
  int pas = 30;
  int noAccentLength = 0;
  
  // Ecriture du mot suppression des voyelles
  for (int n = 0; n < mot.length(); ++n) {
    char lettre = mot.charAt(n);
    if (n == 0) {
      note += lettre;
      ++noAccentLength;
    } else {
      if (lettre == 'a' || lettre == 'e' || lettre == 'i' || lettre == 'o' || lettre == 'u') {
      } else {
        note += lettre;
        ++noAccentLength;
      }
      if (lettre == 'i') {
        note += lettre;
      }
    }
  }

  // Si une seule consonne, ajouter les voyelles
  if (note.length() == 1) {
    if ((mot.charAt(0) == 'j' || mot.charAt(0) == 'J') && (mot.length() == 2)) {
      if (mot.charAt(1) == 'e') {
        //println("je ici.");
        text('J',x,y);
        return "j";
      }
    }
    else if ((mot.charAt(0) == 'd' || mot.charAt(0) == 'D')) {
      if (mot.length() ==  2) {
        if (mot.charAt(1) == 'e' || mot.charAt(1) == 'u') {
          text("(",x,y);
          ++hasBrackets;
          return ("(");
        }
      }
    }
    else if (mot.charAt(0) == 'l' || mot.charAt(0) == 'L') {
      if (mot.length() == 2) {
        if (mot.charAt(1) == 'a' || mot.charAt(1) == 'e') {
          return "";
        }
      }
    }

    else {
      text(mot, x, y);
      return mot;
    }
  }
      else if (note.length() > 1){
    // mettre en minuscule si une seule lettre et l'autre i
    mot = note;
    note = "";
    char lettre = 'a';
    //println(mot);
    int z = 0;
    for (int n = 0; n < mot.length(); ++n) {
      lettre = mot.charAt(n);
      
      if ((n == 0) && (lettre  == 'e' || lettre == 'E')) {
        if (mot.length() == 3){
           if (mot.charAt(1) == 's') {
             if (mot.charAt(2) == 't') {
               text('=',x,y);
               return "=";
             }
          }
        }
        else if (mot.length() == 2) {
          if (mot.charAt(1) == 't') {
            text('&',x,y);
            return "&";
          }
        }
      }

        
      else if ((n==0) && (lettre == 'n' || lettre == 'N') && (mot.length() == 2)) {
            if (mot.charAt(1) == 'e' || mot.charAt(1) == '’') {
              text ("\\",x,y);
              ++n;
            }
      }

      else if ((n==0) && (voyelle(lettre)) && (noAccentLength > 2)) {
        // delete first letter
        // get the next one as UpperCase
        // return the whole
        text(Character.toUpperCase(mot.charAt(1)),x,y);
        ++n;
      }
      
      // Check for accents
      else if (lettre == 'é' || lettre == 'É') { 
        x -= fontSize/2;
        textFont(f2);
        text("´",x+fontSize*0.2,y+fontSize*0.7);
        textFont(f);
      }
      else if (lettre == 'è' || lettre == 'à') {
        x -= fontSize/2;        
        textFont(f2);
        // Draw line
        text("`",x+fontSize/2,y-fontSize);
        textFont(f);
      }
      else if (lettre == 'i') {
        if (n-1 == 0)
          text('.', x-fontSize*0.5, y-fontSize*0.7);
        else if (n < mot.length()-1) {
          if (exposant(mot.charAt(n+1))) {
            text('.', x-fontSize*0.5, y-fontSize*0.7);
          }
        }
        else
          text(".", x-fontSize*0.5,y-fontSize*0.7);
      }

      // Check first letter
      else if (n == 0) {
        lettre = Character.toUpperCase(lettre);
        if (mot.charAt(n+1) == 'i') {
          lettre = Character.toLowerCase(lettre);
        }
        else if (voyelle(lettre)) {
          if (mot.length() > 1) {
            if (!voyelle(mot.charAt(1))) {
              // delete first letter, change second letter to upperCase
            }
          }
        }
        text(lettre, x, y);
      }

      // d f h k l t = exposants
      else if (exposant(lettre)) {
        if (n>0) {
          //if (mot.charAt(n-1) != 'i')
          //  text(lettre, x, y-fontSize/4);
          z -= 10;
          text(lettre, x, y+z);
        }
      }

      // indices = c m n s w
      else if (indice(lettre)) {
        z += 5;
        text(lettre, x, y+z);
      }
      // autres = b g j p q r v y z
      else if (autreConsonne(lettre)) {
        text(lettre, x, y+z);
      }
      
      if (lettre != 'i'){
        note += lettre;
        x += fontSize/2;
      }
    }
  }
  return note;
}


void drawType(int x) {
  String phrase = "";
  String mot = "";
  y = minHeight;
  for (int i = 0; i < citation.length(); ++i) {
    char lettre = citation.charAt(i); // how to get lettre?

    if (lettre == ' ' || lettre == '.' || lettre == ',' || lettre == '’') {
      // stop word

      if(lettre == '’') {
        // how to catch accent?
        mot+=lettre;
      }
      if (hasBrackets > 0) {
        mot = raccourcir(mot, x, y);
        x+=0.8*fontSize;
        text(")",x+0.4*fontSize,y);
        x+= fontSize*0.8*mot.length();
        --hasBrackets;
      }
      else {
        mot = raccourcir(mot, x, y);  
        x+= fontSize*0.8*mot.length();
      }

      //println("get word: "+mot);

      if (lettre == ',') {
        x -= fontSize*1.5;
        text(lettre,x,y);
        x += fontSize/2;
      } mot = "";

      if (x > maxWidth) {
        y += 100;
        x = minWidth;
      }
    }
    else {
      mot += lettre;
    }
  }
}

