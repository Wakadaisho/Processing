

void setup(){
  selectFolder("Select folder with images", "combineFromFolder");
}

void combineFromFolder(File selection){
  if(selection==null){
     return;
  }
  int i = 0;
  File files[] = selection.listFiles();
  PImage images[] = new PImage[files.length];
  String filepath = selection.getAbsolutePath();
  for(File file: files){
    images[i++] = loadImage(filepath+File.separatorChar+file.getName());
  }
  
  PImage result = combineImages(images);
  result.save(filepath+File.separatorChar+selection.getName()+".jpg");
  println("Saved file to '" + filepath+File.separatorChar+selection.getName()+".jpg\'");
  exit();
}

PImage combineImages(PImage images[]){
  int imgWidth=0;
  int imgHeight=0;
  
  for(PImage img: images){        //calculate resulting image dimensions
    if(img.width>imgWidth){
      imgWidth = img.width;
    }
    imgHeight+=img.height;
  }
  imgHeight+=4*images.length;
  
  PImage out = createImage(imgWidth, imgHeight, ARGB);
  int totalHeight=0;
  
  out.loadPixels();
  for(int i=0; i<imgHeight; i++){          //background: white
      for(int j=0; j<imgWidth; j++){
        out.pixels[imgWidth*i+j] = color(255, 255, 255);
      }
    }
  int imgX;
  
  for(PImage img: images){    
    img.loadPixels();
    imgX = 0;
    
    if(img.width<imgWidth){            //adjust image to center correction value
      imgX = (imgWidth-img.width)/2;
    }
    
    for(int j=0; j<img.width; j++){    //image top border
        out.pixels[imgWidth*totalHeight+(j+imgX)] = color(0, 0, 0);
    }
    
    totalHeight++;
    
    for(int i=0; i<img.height; i++, totalHeight++){
      out.pixels[imgWidth*totalHeight+(0+imgX)] = color(0, 0, 0);      //image left border
      for(int j=1; j<img.width-1; j++){
        out.pixels[imgWidth*totalHeight+(j+imgX)] = img.pixels[img.width*i+j];
      }
      out.pixels[imgWidth*totalHeight+(img.width-1+imgX)] = color(0, 0, 0);    //image right border
    }
    
    for(int j=0; j<img.width; j++){          //image bottom border
        out.pixels[imgWidth*totalHeight+(j+imgX)] = color(0, 0, 0);
    }
    
    totalHeight+=3;
  }
  out.updatePixels();
  
  return out;
}
