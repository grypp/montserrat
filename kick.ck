.5::second => dur T;
T - (now % T) => now;

SndBuf buf => Gain g => dac;
"kick.wav" => buf.read;
.5 => g.gain;

while( true )
{
    0 => buf.pos;
    Std.rand2f(.8,.9) => buf.gain;
    1::T => now;
}
