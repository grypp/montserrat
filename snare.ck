.5::second => dur T;
T - (now % T) => now;

SndBuf buf => Gain g => JCRev r => dac;
"snare.wav" => buf.read;
.5 => g.gain;
.05 => r.mix;
65 => int where;
while( true )
{
    Std.rand2f(.8,.9) => buf.gain;
            0 => int i;
        while( i < 8 )
        {
            i / 8.0 => buf.gain;
            where => buf.pos;
            (1.0/8.0)::T => now;
            i++;
        }
        
        while( i > 0 )
        {
            i / 8.0 => buf.gain;
            where => buf.pos;
            (1.0/8.0)::T => now;
            i--;
        }
}
