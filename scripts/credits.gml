//game credits string
var betas,l;

l=0

list[l]="CowboyJoseph64" l+=1
list[l]="Cubie/nekonesse" l+=1
list[l]="-S-" l+=1
list[l]="Emília" l+=1
list[l]="Flareguy" l+=1
list[l]="MotorRoach" l+=1
list[l]="Christian32307" l+=1
list[l]="WildCard78" l+=1
list[l]="CyanideJam" l+=1
list[l]="Bedoop!" l+=1
list[l]="ArcanePool" l+=1
list[l]="Myllie" l+=1
list[l]="LunarLuna" l+=1
list[l]="Maxine" l+=1
list[l]="kattnip" l+=1
list[l]="biobthe1" l+=1
list[l]="TheMaurii64" l+=1
list[l]="azumadeline" l+=1
list[l]="Scarf" l+=1
list[l]="dajumpjump" l+=1
list[l]="Harold" l+=1
list[l]="Sylve" l+=1
list[l]="LeEpicPasta" l+=1
list[l]="SuperSani24" l+=1
list[l]="ScarlyNight" l+=1
list[l]="GoldenB4" l+=1
list[l]="DaOrangeBoi" l+=1
list[l]="sunnisydedown" l+=1
list[l]="MosterSMTH" l+=1
list[l]="Reinaweyy" l+=1
list[l]="Chearii" l+=1
list[l]="chopp" l+=1
list[l]="shoujosystem" l+=1
list[l]="SinFrog" l+=1
list[l]="Ethan" l+=1
list[l]="Kaching720" l+=1
list[l]="GabeRSP" l+=1
list[l]="Dewey" l+=1
list[l]="ILostMySol" l+=1
list[l]="Dara" l+=1
list[l]="Luk" l+=1
list[l]="Mellia" l+=1
list[l]="Carbo64" l+=1
list[l]="[Hakumuda]" l+=1
list[l]="TwistedMaky" l+=1
list[l]="TheBlazePage" l+=1

var contributors, cont_final, z;
z=0
contributors[z]="LilyPads07" z+=1
contributors[z]="SA64ds" z+=1
contributors[z]="dudujesus664" z+=1
contributors[z]="sejoczay-gif" z+=1
contributors[z]="possiblyamagicmage" z+=1
contributors[z]="LYB4" z+=1
contributors[z]="WanderingLetterS" z+=1
contributors[z]="CowboyJoseph64" z+=1
contributors[z]="nekonesse" z+=1
contributors[z]="MosterSMTH" z+=1
contributors[z]="SuperSani24" z+=1
contributors[z]="Poker500" z+=1
contributors[z]="ChristianJ32307" z+=1
contributors[z]="todadoat" z+=1
var v;
cont_final=""
for (v=0;v<z;v+=1) {
    cont_final+=contributors[v]
    if (v<z-1) {
        if (v mod 3==2) cont_final+="#"
        else cont_final+=" - "
    }
}

//shuffle betas
for (i=l-1;i>0;i-=1) {
    j=irandom(i)
    t=list[i]
    list[i]=list[j]
    list[j]=t
}

//build list of betas
betas=""
for (i=0;i<l;i+=1) {
    betas+=list[i]
    if (i<l-1) {
        if (i mod 3==2) betas+="#"
        else betas+=" - "
    }
}

return gametitle+"

[version "+version+"]


A long and fruitful venture from the wonderful
folks of the ever-changing Boll Team


2010-2025


PRESS ESC TO EXIT AT ANY TIME! 


[Game Design]

nekonesse - CowboyJoseph64
Emília - -S- - Flareguy


[Programming]

nekonesse - -S-
MosterSMTH - Scarf
SuperSani24 - BonesMilk
Christian32307 - zulc22
Chearii - DrgnBeauty
Floogle - Symbolcom


[Art]

nekonesse - -S-
MotorRoach - dajumpjump
GoldenB4 - CyanideJam
scarf - sunnisydedown
BonesMilk - ArcanePool
azumadeline - Nathan Silver
WildCard74 - Just Kam
Bedoop! - Myllie
Harold - Fuzzy Cactus
Mr Gandy - MiwwieUwU


[Level Design]

Emília - nekonesse
CyanideJam - dajumpjump
ArcanePool - MosterSMTH
Christian32307 - GoldenB4
-S- - Flareguy - Carbo64


[Music]

TheMaurii64 - BonesMilk


[Testing]
[Additional Game Design] 
[And Miscellaneous work]

"+betas+"

[GitHub Contributors]

"+cont_final+"

[Special Thanks]

-S- - Flareguy
shoujosystem - Kaching720
MotorRoach - VAdaPEGA
Wariah - Fractor
Anter - roman6a
BlackDoomer
John Croissant
DrgnBeauty
Vim! (For the Main Menu music)
lyb4 - KellyM
DaOrangeBoi
BonesMilk - JaqlynWithAQ
LillyPads07 - Poker
SA64ds - Ninten
ElectrotainZap - hashie
The Cherry Treehouse Team
Everyone else who worked on Sonic Boll



...and YOU!



This game is dedicated to all the cool
people at the old Exploding Rabbit forums.
Without your support, this project
would never have happened.



FMOD audio engine by Firelight
Technologies Pty Ltd.




Thank you for playing!
See you in MARIO & SONIC BOLL 2."
