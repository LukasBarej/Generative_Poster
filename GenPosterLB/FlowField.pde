class FlowField {
  
  PVector[] vectors;
  int cols, rows;
  float inc = 0.1;
  float zoff = 0;
  int scl;
  
  FlowField(int res) {
    scl = res;
    cols = floor(width / res) + 1;
    rows = floor(height / res) + 1;
    vectors = new PVector[cols * rows];
  }
  void update() {
    float yoff = 0;
    for (int y = 0; y < rows; y++) { 
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        
        int s = x*scl;
        int w = y*scl;
        int c = img.get(int(s),int(w));
        float theta = map(brightness(c),255,0,0,TWO_PI);
        
        float angle = noise(xoff, yoff, zoff) * theta*4;
        
        PVector v = PVector.fromAngle(angle);
        v.setMag(map(brightness(c),255,0,.3,1));
        //v.setMag(1);
        int index = x + y * cols;
        vectors[index] = v;
       
        xoff += inc;
      }
      yoff += inc;
    }
    zoff += 0.004;
  }
  void display() {
    for (int y = 0; y < rows; y++) { 
      for (int x = 0; x < cols; x++) {
        int index = x + y * cols;
        PVector v = vectors[index];
        
        
        stroke(#FFE5D1, 40);
        strokeWeight(0.1);
        pushMatrix();
        translate(x * scl, y * scl);
        rotate(v.heading());
        line(0, 0, scl, 0);
        popMatrix();
      }
    }
  }
}
