int winSize = 600; 
float[] values = {60, 370, 70, 34,235,234,12,54,124,6,64,12,200,0};
float tickLength = winSize / (values.length - 1);

void setup(){
  size(winSize,winSize); 
  smooth();

}

void draw(){
  clear();
  background(138,26,7);
  stroke(255);
  strokeWeight(1);
  line(0, winSize/2, winSize, winSize/2);
  lineChart(values, winSize);
  hoverEffect();
}

void lineChart(float[] values, int winSize){
  float zeroLine = winSize / 2;
  float[] sValues = new float[values.length];
  float stretchRatio = (height - zeroLine) / max(values);
  float tickLength = winSize / (values.length - 1);
  smooth(2);
  strokeWeight(6);
  strokeCap(PROJECT);
  int i = 0;
  
  /* Translate the chart data into plottable elemetns */
  while ( i < values.length) {
    sValues[i] = zeroLine - (values[i] * stretchRatio);
    i ++;
  }
  
  float xPos = 0;
  /* This renders each segment of the chart */
  for (int n = 0; n < sValues.length - 1; n++) {
    line(xPos, sValues[n], xPos + tickLength, sValues[n+1]);
    /* print(sValues[n],":", xPos," ", sValues[n], " ", (xPos + tickLength), " ", sValues[n+1], "\n"); */
    xPos = xPos + tickLength;
  }
}

void hoverEffect() {
  float[] leftEdge = new float[values.length];
  float[] rightEdge = new float[values.length];
  
  /* Writes the edges of each horizontal slice into two Arrays */
  for (int i = 0; i < leftEdge.length; i++) {
    leftEdge[i] = tickLength * i;
    rightEdge[i] = leftEdge[i] + tickLength;
  }

  /* Tests each horizontal slice for mouseX presence. When found, highlights the column. */
  
  noStroke();
  fill(255, 10);
  for (int n = 0; n < leftEdge.length; n++) {
    if(mouseX > leftEdge[n] && mouseX <= rightEdge[n]) {
      rect(leftEdge[n],0,rightEdge[n] - leftEdge[n], winSize);
    }
  }
}
