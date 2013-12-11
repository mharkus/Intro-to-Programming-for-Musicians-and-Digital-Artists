<<< "Assignment_2_Chucked_Hall_of_the_Mountain_King" >>>;

SinOsc s => dac;
SinOsc s2 => dac;
0.6 => s.gain;
0 => s2.gain;

[76, 12, 76, 12, 20, 12, 76, 12, 20, 12, 72, 12, 
76, 12, 20, 12, 79, 12, 20, 36, 67, 12, 20, 36] @=> int part1[];

[72, 12, 20, 24, 67, 12, 20, 24, 64, 12, 20, 24, 69, 12, 20, 12, 
71, 12, 20, 12, 70, 12, 69, 12, 20, 12, 67, 16, 76, 16, 79, 16, 
81, 12, 20, 12, 77, 12, 79, 12, 20, 12, 76, 12, 20, 12, 72, 12, 
74, 12, 71, 12, 20, 24] @=> int part2[];

[48, 12, 20, 12, 79, 12, 78, 12, 77, 12, 75, 12, 60, 12, 76, 12, 
53, 12, 68, 12, 69, 12, 72, 12, 60, 12, 69, 12, 72, 12, 74, 12, 
48, 12, 20, 12, 79, 12, 78, 12, 77, 12, 75, 12, 55, 12, 76, 12, 
20, 12, 84, 12, 20, 12, 84, 12, 84, 12] @=> int part3[];

[55, 12, 20, 12, 48, 12, 20, 12, 79, 12, 78, 12, 77, 12, 75, 12, 
60, 12, 76, 12, 53, 12, 68, 12, 69, 12, 72, 12, 60, 12, 69, 12, 
72, 12, 74, 12, 48, 12, 20, 12, 75, 24, 20, 12, 74, 24, 20, 12, 
72, 24, 20, 12, 55, 12, 55, 12, 20, 12, 48, 12] @=> int part4[];

[72, 12, 72, 12, 20, 12, 72, 12, 20, 12, 72, 12, 74, 12, 20, 12, 
76, 12, 72, 12, 20, 12, 69, 12, 67, 12, 20, 12, 43, 12, 20, 12, 
72, 12, 72, 12, 20, 12, 72, 12, 20, 12, 72, 12, 74, 12, 76, 12, 
55, 12, 20, 24, 48, 12, 20, 24, 43, 12, 20, 12, 72, 12, 72, 12, 
20, 12, 72, 12, 20, 12, 72, 12, 74, 12, 20, 12, 76, 12, 72, 12, 
20, 12, 69, 12, 67, 12, 20, 12, 43, 12, 20, 12, 76, 12, 76, 12, 
20, 12, 76, 12, 20, 12, 72, 12, 76, 12, 20, 12, 79, 12, 20, 36, 
67, 12, 20, 36] @=> int part5[];

[76, 12, 72, 12, 20, 12, 67, 12, 55, 12, 20, 12, 68, 12, 20, 12, 
69, 12, 77, 12, 53, 12, 77, 12, 69, 12, 60, 12, 53, 12, 20, 12, 
71, 16, 81, 16, 81, 16, 81, 16, 79, 16, 77, 16, 76, 12, 72, 12, 
55, 12, 69, 12, 67, 12, 60, 12, 55, 12, 20, 12, 76, 12, 72, 12, 
20, 12, 67, 12, 55, 12, 20, 12, 68, 12, 20, 12, 69, 12, 77, 12, 
53, 12, 77, 12, 69, 12, 60, 12, 53, 12, 20, 12, 71, 12, 77, 12, 
20, 12, 77, 12, 77, 16, 76, 16, 74, 16, 72, 12, 64, 12, 55, 12, 
64, 12, 60, 12, 20, 36] @=> int part6[];

[72, 12, 20, 24, 67, 12, 20, 24, 64, 24, 69, 16, 71, 16, 69, 16, 
68, 24, 70, 24, 68, 24, 67, 12, 65, 12, 67, 48] @=> int part7[];

145 => int baseDelay;
float hz;
for(0 => int i; i < part1.cap(); i++){
    if(i % 2 == 0){
        Std.mtof(part1[i]) => hz;
    }else{
        hz => s.freq;
        baseDelay * (part1[i]/12) ::ms => now;
    }
    
}

0 => int playTime;
while(playTime < 2){
    for(0 => int i; i < part2.cap(); i++){
        if(i % 2 == 0){
            Std.mtof(part2[i]) => hz;
        }else{
            hz => s.freq;
            baseDelay * (part2[i]/12)::ms => now;
        }
    }
    
    playTime + 1 => playTime;
    400::ms => now;
}

0.6 => s2.gain;
0 => playTime;
float hz2;

while(playTime < 2){
    for(0 => int i; i < part3.cap(); i++){
        if(i % 2 == 0){
            Std.mtof(part3[i]) => hz;
            Std.mtof(part4[i]) => hz2;
        }else{
            hz => s.freq;
            hz2 => s2.freq;
            baseDelay * (part3[i]/12)::ms => now;
        }
        
        
    }
    
    playTime + 1 => playTime;
    200::ms => now;
}


0 => s2.gain;

for(0 => int i; i < part5.cap(); i++){
    if(i % 2 == 0){
        Std.mtof(part5[i]) => hz;
    }else{
        hz => s.freq;
        baseDelay * (part5[i]/12)::ms => now;
    }
}


0 => playTime;
while(playTime < 2){
    for(0 => int i; i < part2.cap(); i++){
        if(i % 2 == 0){
            Std.mtof(part2[i]) => hz;
        }else{
            hz => s.freq;
            baseDelay * (part2[i]/12)::ms => now;
        }
    }
    
    playTime + 1 => playTime;
    300::ms => now;
}



0 => playTime;
while(playTime < 2){
    for(0 => int i; i < part6.cap(); i++){
        if(i % 2 == 0){
            Std.mtof(part6[i]) => hz;
        }else{
            hz => s.freq;
            baseDelay * (part6[i]/12)::ms => now;
        }
        
        
    }
    
    playTime + 1 => playTime;
    300::ms => now;
}

for(0 => int i; i < part5.cap(); i++){
    if(i % 2 == 0){
        Std.mtof(part5[i]) => hz;
    }else{
        hz => s.freq;
        baseDelay * (part5[i]/12)::ms => now;
    }
}

    for(0 => int i; i < part6.cap(); i++){
        if(i % 2 == 0){
            Std.mtof(part6[i]) => hz;
        }else{
            hz => s.freq;
            baseDelay * (part5[i]/12)::ms => now;
        }


    }

for(0 => int i; i < part7.cap(); i++){
    if(i % 2 == 0){
        Std.mtof(part7[i]) => hz;
    }else{
        hz => s.freq;
        baseDelay * (part5[i]/12)::ms => now;
    }
}
