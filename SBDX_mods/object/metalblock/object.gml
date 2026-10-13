#define object_type
hittable

#define create

if !(custom_sprite_exists("metalblock")) {
    sheet=add_custom_sprite(myobjdir+"metalblock.png","metalblock",0,0,0,0);
} else {
	sheet=get_custom_sprite("metalblock")
}

x+=unreal(data_0,0)
y+=unreal(data_1,0)

image_xscale=2
image_yscale=2

#define step

tpos=0
insted=0
go=0
wait=0

#define hitblock
if (abs(owner.hsp)>2) {	
	i=instance_create(x,y+16,part)
	i.vspeed=-2
	i.hspeed=-2
	i.spritepart=0
	i.visible=0
	i.metalblockpart=1

	i=instance_create(x+16,y+16,part)
	i.vspeed=2
	i.hspeed=2
	i.spritepart=1
	i.visible=0
	i.metalblockpart=1
	
	i=instance_create(x+16,y,part)
	i.vspeed=-2
	i.hspeed=2
	i.spritepart=2
	i.visible=0
	i.metalblockpart=1
	
	i=instance_create(x,y,part)
	i.vspeed=2
	i.hspeed=-2
	i.spritepart=3
	i.visible=0
	i.metalblockpart=1
	
	image_xscale=0
	image_yscale=0
	
	sound("metalbreak")
	
}

#define draw
draw_sprite_part_ext(sheet,0,0,0,32,32,floor(x),floor(y),image_xscale/2,image_yscale/2,c_white,1)

with (part) if metalblockpart {
	draw_sprite_part_ext(other.sheet,0,0+16*spritepart,0,16,16,x,y,1,1,c_white,1)
}

#define lemon_display
if !(custom_sprite_exists("metalblock")) {
    sheet=add_custom_sprite(myobjdir+"metalblock.png","metalblock",0,0,0,0);
} else {
	sheet=get_custom_sprite("metalblock")
}

draw_sprite_part_ext(sheet,0,0,0,32,32,(x*16+unreal(data[0],0)),(y*16+unreal(data[1],0)),1,1,c_white,1)

	
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