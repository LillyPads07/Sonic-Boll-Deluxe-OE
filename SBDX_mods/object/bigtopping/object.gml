#define create
friction=0.1
drop=0
lok=0
fresh=1

realtype=unreal(data_0,0)
x+=unreal(data_1,0)
y+=unreal(data_2,0)

if realtype=0 {randomize() toppingtype=choose(0,1,2,3,4)}
else toppingtype=5

if !(custom_sprite_exists("bigtoppings")) {
	sheet=add_custom_sprite(myobjdir+"bigtoppings.png","bigtoppings",1,1,0,0);
} else {
	sheet=get_custom_sprite("bigtoppings")
}
depth=1000000
mask_index=spr_mask32c32
x+=16
y+=16
	
#define step
if (toppingtype!=5 || !gamemanager.kaerublockstate) {
	with instance_place(x,y,player) {
		with other {
			with other {
				itemget=0
				with other give_item(other.id,"bigtopping")
				if itemget=0 bigtopping_get=1
			}
			
			
			stats("toppings collected",stats("toppings collected")+1)
			if toppingtype=5 sound("itemtoppingbell")
			else with other sound("itemtopping")
			instance_destroy()
		}
	}
}
	
#define draw
switch toppingtype {
	case 0: draw_sprite_part_ext(sheet,0,4,4,32,32,x-16,y-16,1,1,c_white,1) exit; 
	case 1: draw_sprite_part_ext(sheet,0,36,4,32,32,x-16,y-16,1,1,c_white,1) exit; 
	case 2: draw_sprite_part_ext(sheet,0,68,4,32,32,x-16,y-16,1,1,c_white,1) exit; 
	case 3: draw_sprite_part_ext(sheet,0,4,36,32,32,x-16,y-16,1,1,c_white,1) exit; 
	case 4 : draw_sprite_part_ext(sheet,0,36,36,32,32,x-16,y-16,1,1,c_white,1) exit; 
	
	case 5 : draw_sprite_part_ext(sheet,0,68,36,32,32,x-16,y-16,1,1,c_white,0.25+0.75*(!gamemanager.kaerublockstate)) exit; 
}
	
	
#define lemon_display
if !(custom_sprite_exists("bigtoppings")) {
	sheet=add_custom_sprite(myobjdir+"bigtoppings.png","bigtoppings",1,1,0,0);
} else {
	sheet=get_custom_sprite("bigtoppings")
}

realtype=unreal(data[0],0)

if realtype=0 draw_sprite_part_ext(sheet,0,4.5,4.5,32,32,(x*16+unreal(data[1],0)),(y*16+unreal(data[2],0)),1,1,c_white,1) 
else draw_sprite_part_ext(sheet,0,68.5,36.5,32,32,(x*16+unreal(data[1],0)),(y*16+unreal(data[2],0)),1,1,c_white,1)

		 
	
#define deloaded
if !(custom_sprite_exists("bigtoppings")) || get_custom_sprite("bigtoppings") == 0 {
	//no need to deload anything.	
}else {
	delete_custom_sprite("bigtoppings")
}

#define editobjmenu
thedefault=argument1
type=argument0


if (type==1) {
	global.cobjectreturn = get_string("Object's X Offset",thedefault)
	exit;
}
else if (type==2) {
    global.cobjectreturn = get_string("Object's Y Offset",thedefault)
    exit;
}
else if (type==0) {
    i=show_contextmenu("Topping Type:|-|Normal|Bell",0)
    if (!i) global.cobjectreturn = thedefault
    else global.cobjectreturn = string(i-1)
    exit;
}

global.cobjectreturn = "----"
	

#define editobjdataname
i=string(argument1)
type=argument0

if type==1{
	global.cobjectreturn = "Offset X: " + i
	exit;
}else if type==2{
	global.cobjectreturn = "Offset Y: " + i
	exit;
}else if type==0{
	if i=="1" global.cobjectreturn = "Bell";
	else global.cobjectreturn = "Normal";
	exit;
}

#define lemon_data
switch(argument0) {
	case 0: global.cobjectreturn = 0 break;
	case 1: global.cobjectreturn = 0 break;
	case 2: global.cobjectreturn = 0 break;
}