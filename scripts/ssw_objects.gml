///ssw_objects(name)
//This handles sprite switching for the items that are on the master sheet

if (!inview()) exit

var frox,froy, frx,fry, fr,ffr4,fr8,fr88, xsc,ysc,w,h, plat;

fr=global.frame
ffr4=global.fastframe4
fr8=global.frame8
fr88=global.frame88
itemframe=global.itemframe

frox=0 froy=0 frx=0 fry=0 w=1 h=1 xsc=1 ysc=1 plat=0
switch (argument[0]) {
    case "cork": {frx=34 fry=8 frox=8 froy=8 break}
    case "stone": {frx=34 fry=6 frox=8 froy=8 break}
    case "powblock": {frx=28+1*powphase fry=6 xsc=xsc+pxsc ysc=1-pxsc*0.3 frox=pxsc*4 break}
    case "delfruit": {frx=28+delfr*1.5 fry=7.5 w=1.5 h=1.5 frox=12 froy=12 break}
    case "pswitch": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=28+fr fry=9 frox=0 froy=0 break}
    case "pswitchhit": {if (hspeed>=0 && skindat("itemflip")) xsc=-1 frx=32 fry=9 frox=0 froy=0 break}
    case "sonicspike": {
        if (dir=0) {frx=5.5 fry=18.5+floor(frame)}
        if (dir=1) {frx=1.5+floor(frame) fry=17.5}
        if (dir=2) {frx=0.5 fry=18.5+floor(frame)}
        if (dir=3) {frx=1.5+floor(frame) fry=22.5}
        if (dir=4) {frx=1.5+floor(frame) fry=17.5}
    break}
    case "bumper": {frx=14+3.5*frame fry=20.5 w=3 h=3 frox=24 froy=24 break}
    case "bumpersmall": {frx=9.5+1.5*frame fry=22 w=1.5 h=1.5 frox=12 froy=12 break}
    case "bumperball": {frx=19.5+(1*round(floor(frame)/2)) fry=18.5 froy=8 frox=8 break}
    case "conveyorbeltcenter": {frx=10.5+(1*frame) fry=26.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "conveyorbeltleft": {frx=10.5+(1*frame) fry=27.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "conveyorbeltright": {frx=10.5+(1*frame) fry=28.5 w=1 h=1 xsc=-1*sign(beltspd) if xsc=-1 frox=16 else frox=0 break}
    case "cardreaderup": {frx=19 fry=12 w=2 h=2 frox=16 froy=16 break}
    case "cardreaderdown": {frx=21 fry=12 w=2 h=2 frox=16 froy=16 break}
    case "tap": {frx=9.5+other.frame fry=20.5 break} //genuinely convinced this used to just be straight up copy-pasted from ssw_items -moster
    case "axe": {frx=22.5+fr fry=16.5 break}
    case "pollflower": {frx=0.5+frame*5 fry=30.5 w=5 h=3 froy=32 break}
    case "pollen": {frx=0.5+fr*2.5 fry=33.5 w=2.5 h=2.5 frox=17 froy=16 break}
    case "redring": {frx=13+itemframe*1.5 fry=11.5 w=1.5 h=2.5 frox=12 froy=20 break}

    case "signalblock": {frx=11+(1*active)  fry=18.5 break}

    case "grinder": {frx=25.5 fry=4+2*fr w=2 h=2 froy=8 frox=8 break}
    case "dashpanel": {frx=7 fry=17.5+(1.5*fr) w=2 h=1.5 froy=8 break}

    case "spring": {frx=27.5+frame fry=24+bbb-aaa h=2-max(bbb,aaa) froy=17-16*bbb frox=0 break}
    case "sprong": {frx=27.5+frame fry=26+bbb-aaa h=2-max(bbb,aaa) froy=17-16*bbb frox=0 break}
    case "spreng": {frx=31.5 fry=24+frame w=2 frox=8 froy=1 break}
    case "sprung": {frx=33.5 fry=24+frame w=2 frox=8 froy=1 break}
    case "terrainspring": {
        switch (real(dir)) { //stole the math from pokerboll lol
            case (0): {frx=0.5+frame fry=0.5+bbb-aaa h=1.5-max(bbb,aaa) froy=8-8*bbb frox=0} break; //up
            case (1): {frx=4.5+frame fry=0.5+bbb-aaa h=1.5-max(bbb,aaa)                    } break; //down
            case (2): {frx=9 fry=0.5+frame w=1.5 frox=8                                    } break; //left
            case (3): {frx=9 fry=4.5+frame w=1.5                                           } break; //right
            case (4): {frx=5 fry=2.5+1.5*frame w=1.5 h=1.5 frox=8 froy=8                   } break; //up left
            case (5): {frx=0.5 fry=2.5+1.5*frame w=1.5 h=1.5 froy=8                        } break; //up right
            case (6): {frx=3.5 fry=2.5+1.5*frame w=1.5 h=1.5 frox=8                        } break; //down left
            case (7): {frx=2 fry=2.5+1.5*frame w=1.5 h=1.5                                 } break; //down right
        }
    break
    }
    case "terrainsprong": {
        switch (real(dir)) { //stole the math from pokerboll lol
            case (0): {frx=0.5+frame fry=8.5+0.5+bbb-aaa h=1.5-max(bbb,aaa) froy=8-8*bbb frox=0} break; //up
            case (1): {frx=4.5+frame fry=8.5+0.5+bbb-aaa h=1.5-max(bbb,aaa)                    } break; //down
            case (2): {frx=9 fry=8.5+0.5+frame w=1.5 frox=8                                    } break; //left
            case (3): {frx=9 fry=8.5+4.5+frame w=1.5                                           } break; //right
            case (4): {frx=5 fry=8.5+2.5+1.5*frame w=1.5 h=1.5 frox=8 froy=8                   } break; //up left
            case (5): {frx=0.5 fry=8.5+2.5+1.5*frame w=1.5 h=1.5 froy=8                        } break; //up right
            case (6): {frx=3.5 fry=8.5+2.5+1.5*frame w=1.5 h=1.5 frox=8                        } break; //down left
            case (7): {frx=2 fry=8.5+2.5+1.5*frame w=1.5 h=1.5                                 } break; //down right
        }
    break
    }

    case "beepblockon": {amion="on" frx=15+frame fry=24+blue w=1 h=1 break}
    case "beepblockoff": {frx=17+frame fry=24+blue w=1 h=1 break}
    case "bubblepop": {frx=15.5+(frame*1.5) fry=7 w=1.5 h=1.5 frox=12 froy=12 break}
}


if plat=0 draw_background_part_ext(global.masterobjects[biome],frx*16+8,fry*16+8,w*16,h*16,floor(x-frox*xsc)+notex,floor(y-froy*ysc)+dy+notey,xsc,ysc,$ffffff,1)
if (plat!=0) draw_background_part_ext(global.masterobjects[biome],(frx+2)*16+8,fry*16+8,16,16,floor(x-frox*xsc+plat*16*xsc),floor(y-froy*ysc)+dy,xsc,ysc,$ffffff,1)
