import processing.serial.*;
Serial port;


int iterate;
int val;
float mapped;
PGraphics graph;

void setup() {
  size( 1024, 400); 
  port = new Serial(this, Serial.list()[0], 9600);
  background( 255 );
  graph = createGraphics(width, height, P2D);
}


void draw() {
  background( 255 );
  iterate = iterate % width;
  val = port.read();
  mapped = map( val, 0, 1024, 0., 1.);
  graph.beginDraw();
  graph.stroke( mapped*255, mapped*255, mapped*255);
  graph.line( iterate, height, iterate, mapped*height);
  if( iterate == 0) { graph.background( 255 ); }
  graph.endDraw();
  image( graph, 0, 0);
  text( mapped, 10, height -30 );
  println( val);
  iterate++;
}

