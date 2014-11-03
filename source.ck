
fun float map ( int i ) {
  200.0 + ( i * 2 ) => float f; 
  return f;
}

SinOsc s => dac;

for (0 => int i; i < serrat.cap(); i++) {
  100::ms => now;
  map(serrat[i]) => s.freq;
  <<< s.freq() >>>;
}
