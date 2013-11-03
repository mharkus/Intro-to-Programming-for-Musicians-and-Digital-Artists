<<< "Assignment_2_Melody_Bass_Line" >>>;

// setup our oscillators
TriOsc s => Pan2 p => dac;
SinOsc s2 => Pan2 p2 => dac;
SinOsc s3 => Pan2 p3 => dac;
SinOsc s4 => dac;

// setup our pans
0 => p.pan;
-1 => p2.pan;
1 => p3.pan;

// and gains...
0.3 => s.gain;
0.3 => s2.gain;
0.3 => s3.gain;
0.6 => s4.gain;

// mute our s4 oscillator as we will
// only use it at runningTime == 8.25 onwards
0 => s4.freq;

[55,50,53,55,50,55,52,50] @=> int melody[];

// limit this melody to 30 seconds
now + 30::second => time limit;
0.25 => float runningTime;

// this is the start of higher note beats
8.25 => float index;

while(now < limit){

// play our melody    
for(0 => int i; i < melody.cap(); i++){
    Std.mtof(melody[i]) => float hz;
    
    // add some variations to the tone
    Std.mtof(melody[i] + 12) => float hz2;
    Std.mtof(melody[i] - 12) => float hz3;
    hz => s.freq;
    
    // play the beat on a specific running time..
    if(runningTime == index){
        Std.mtof(59) => s4.freq;
    }else if(runningTime == (index + 0.75)){
        Std.mtof(62) => s4.freq;
    }else if(runningTime == (index + 2)){
        Std.mtof(62) => s4.freq;
    }else if(runningTime == (index + 2.75)){
        Std.mtof(62) => s4.freq;
        index  + 4 => index;
    }else{
        0 => s4.freq;
    }
    
    hz2 => s2.freq;
    hz3 => s3.freq;
    
    // wait for 1 quarter note
    
    0.25::second => now;
    
    // increment our running time
    runningTime + 0.25 => runningTime;
}
}




