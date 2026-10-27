#define create

if !(custom_sprite_exists("treasure")) {
    sheet=add_custom_sprite(myobjdir+"treasure.png","treasure",0,0,0,0);
} else {
	sheet=get_custom_sprite("treasure")
}

x-=8
y-=8

x+=unreal(data_0,0)
y+=unreal(data_1,0)

friction=0.1
drop=0
lok=0
fresh=1

#define step

with instance_place(x,y,player) {
	
	piped=1
	set_sprite("treasure")
	sound("itemtreasure")


	with other {
		award=1
		awardee=other.id
	}
}


if award {
    award+=1
    x=awardee.x-16
    y=awardee.y-40
    if award>40 {
		with awardee {
			piped=0
			with other give_item(other.id,"treasure") //quiet
			if itemget=0 treasure_get=1
		}
        instance_destroy()
    }    
}


#define draw
draw_sprite(sheet,0,floor(x),floor(y))

#define lemon_display
if !(custom_sprite_exists("treasure-lemon")) {
    sheet=add_custom_sprite(myobjdir+"treasure-lemon.png","treasure-lemon",0,0,0,0);
} else {
	sheet=get_custom_sprite("treasure-lemon")
}

draw_sprite(sheet,0,(x*16)-8,(y*16)-8)

#define editobjmenu
thedefault=argument1
type=argument0

global.cobjectreturn = "----"

if (type==0) {
	global.cobjectreturn = get_string("Alignment in pixels (X): ",thedefault)
	exit;
}
else if (type==1) {
    global.cobjectreturn = get_string("Alignment in pixels (Y): ",thedefault)
    exit;
}

	

#define editobjdataname
i=string(argument1)
type=argument0

if type==0 {
	global.cobjectreturn = "Align X: " + i
	exit;
}else if type==1 {
	global.cobjectreturn = "Align Y: " + i
	exit;
}

#define lemon_data
switch(argument0) {
	case 0: global.cobjectreturn = 0 break;
	case 1: global.cobjectreturn = 0 break;
}