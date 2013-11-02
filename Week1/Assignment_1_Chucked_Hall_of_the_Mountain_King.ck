<<< "Assignment_1_Chucked_Hall_of_the_Mountain_King" >>>;

// This is a chucked version of a piece of orchestral music composed
// by Edvard Grieg entitled 'In the Hall of the Mountain King':
// http://en.wikipedia.org/wiki/In_the_Hall_of_the_Mountain_King

// Initialize our sound network.
// We are going to use TriOsc for our bass
// and SawOsc for our treble

TriOsc tri => dac;
SawOsc saw => dac;

// mute our oscillators 

0 => tri.gain;
0 => saw.gain;

// Setup our notes.
// Here, we specify the actual frequencies that we are going
// to use and assign it to variables
// so it will be a lot easier to play a specific frequency/note by just
// doing noteC => saw.freq

// these low notes are going to be our bass which
// will be played by our TriOsc.

130.813 => float noteLowC;
noteLowC + 7.778 => float noteLowCSharp;
noteLowC + 16.019 => float noteLowD;
noteLowC + 24.75 => float noteLowEFlat;
noteLowC + 43.801 => float noteLowF;
noteLowC + 54.184 => float noteLowFSharp;
noteLowC + 65.185 => float noteLowG;
noteLowC + 102.269 => float noteLowBFlat;

// We just need to multiple our lowest C note by 2
// to get the higher octave. These notes are going to be 
// our treble which will be played by our SawOsc.
noteLowC * 2 => float noteC;
noteLowCSharp * 2 => float noteCSharp;
noteLowD * 2 => float noteD;
noteLowEFlat * 2 => float noteEFlat;
noteLowF * 2 => float noteF;
noteLowFSharp * 2 => float noteFSharp;
noteLowG * 2 => float noteG;
noteLowBFlat * 2 => float noteBFlat;
noteC * 2 => float noteTenorC;

// I'm using stanzaIndex to know when to play
// a different melody

0 => int stanzaIndex;

// I'm using this int variable to tell when to play the higher
// octave and when to return back to the original one.
// 1 means play the higher octave, 0 means play the original octave.
// don't you think Chuck should have boolean variable?
0 => int playHighNote;

// setup our gains. Let our SawOsc play a little bit softer
// and let our TriOsc be a bit higher.
0.3 => saw.gain;
0.6 => tri.gain;

// we'll use 28 seconds here so that at the end of the loop,
// we'll have almost 29 seconds running time and then we are going 
// to play the last few notes before we end the composition.
now + 28::second => time limit;

// setup delays for playing our notes
200::ms => dur delay;
400::ms => dur longDelay;
900::ms => dur extraLongDelay;

while( now < limit ){
    
    // play the higher octave version
    // if playHighNote is 1, otherwise, play the 
    // original middle C octave version.
    if(playHighNote == 1){
        noteLowC * 3 => noteC;
        noteLowCSharp * 3 => noteCSharp;
        noteLowD * 3 => noteD;
        noteLowEFlat * 3 => noteEFlat;
        noteLowF * 3 => noteF;
        noteLowFSharp * 3 => noteFSharp;
        noteLowG * 3 => noteG;
        noteLowBFlat * 3 => noteBFlat;
        noteC * 3 => noteTenorC;
    }else{
        noteLowC * 2 => noteC;
        noteLowCSharp * 2 => noteCSharp;
        noteLowD * 2 => noteD;
        noteLowEFlat * 2 => noteEFlat;
        noteLowF * 2 => noteF;
        noteLowFSharp * 2 => noteFSharp;
        noteLowG * 2 => noteG;
        noteLowBFlat * 2 => noteBFlat;
        noteC * 2 => noteTenorC;
    }
    
    noteC => saw.freq;
    noteLowC => tri.freq;
    delay => now;
    
    noteD => saw.freq;
    noteLowD => tri.freq;
    delay => now;
    
    noteEFlat => saw.freq;
    noteLowEFlat => tri.freq;
    delay => now;
    
    noteC => saw.freq;
    noteLowC => tri.freq;
    delay => now;
    
    noteG => saw.freq;
    noteLowG => tri.freq;
    delay => now;
        
    noteEFlat => saw.freq;
    noteLowEFlat => tri.freq;
    delay => now;
    
    if(stanzaIndex == 0){
        noteG => saw.freq;
        noteLowG => tri.freq;
        longDelay => now;
                
        noteFSharp => saw.freq;
        noteLowFSharp => tri.freq;
        delay => now;
        
        noteD => saw.freq;
        noteLowD => tri.freq;
        delay => now;
        
        noteFSharp => saw.freq;
        noteLowFSharp => tri.freq;
        longDelay => now;
        
        noteF => saw.freq;
        noteLowF => tri.freq;
        delay => now;
        
        noteCSharp => saw.freq;
        noteLowCSharp => tri.freq;
        delay => now;
        
        noteF => saw.freq;
        noteLowF => tri.freq;
        longDelay => now;
        
        // now let's play a different version after this loop
        1 => stanzaIndex;
        
    }else if(stanzaIndex == 1){
        // for this version, mute our bass (TriOsc)
        // and just let the SawOsc play the succeeding notes.
        
        0 => tri.gain;
        
        noteG => saw.freq;
        delay => now;
        
        noteTenorC => saw.freq; 
        delay => now;
        
        noteBFlat => saw.freq; 
        delay => now;
        
        noteG => saw.freq; 
        delay => now;
        
        noteEFlat => saw.freq; 
        delay => now;
        
        noteG => saw.freq; 
        delay => now;
        
        noteBFlat => saw.freq; 
        extraLongDelay => now;
        
        // In this if/else block, 
        // we are just switching the playHighNote variable
        // between 1 and 0 so that the normal and higher octave version
        // will be played alternately.
        
        if(playHighNote == 1){
            0 => playHighNote;
        }else{
            1 => playHighNote;
        }
        
        // after our SawOsc played the solo, turn up 
        // the gain for our bass (TriOsc)
       
        1 => tri.gain;
        0 => stanzaIndex;
    }
    
        
}

// play the last few notes as our ending...

noteC => saw.freq;
noteLowC => tri.freq;
delay => now;
    
noteD => saw.freq;
noteLowD => tri.freq;
delay => now;
    
noteEFlat => saw.freq;
noteLowEFlat => tri.freq;
delay => now;
    
noteC => saw.freq;
noteLowC => tri.freq;
delay => now;
    
noteG => saw.freq;
noteLowG => tri.freq;
delay => now;
    



