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

if !(custom_sprite_exists("toppings")) {
    sheet=add_custom_sprite(myobjdir+"toppings.png","toppings",0,1,0,0);
} else {
    sheet=get_custom_sprite("toppings")
}

depth=1000000
mask_index=spr_mask12x12

x+=8
y+=8
		

#define step
if (toppingtype!=5 || !gamemanager.kaerublockstate) {
	with instance_place(x,y,player) {
		with other {
			with other {
				itemget=0
				with other give_item(other.id,"topping") //quiet
				if itemget=0 topping_get=1
			}
			
			
			stats("toppings collected",stats("toppings collected")+1)
			if toppingtype=5 sound("itemtoppingclock")
			else with other sound("itemtopping")
			instance_destroy()
		}
	}
}

#define draw
switch toppingtype {
	case 0: draw_sprite_part_ext(sheet,0,4,4,16,16,x-8,y-8,1,1,c_white,1) break; 
	case 1: draw_sprite_part_ext(sheet,0,20,4,16,16,x-8,y-8,1,1,c_white,1) break;
	case 2: draw_sprite_part_ext(sheet,0,4,20,16,16,x-8,y-8,1,1,c_white,1) break;
	case 3: draw_sprite_part_ext(sheet,0,20,20,16,16,x-8,y-8,1,1,c_white,1) break;
	case 4 : draw_sprite_part_ext(sheet,0,4,36,16,16,x-8,y-8,1,1,c_white,1) break;
	
	case 5 : draw_sprite_part_ext(sheet,0,20,36,16,16,x-8,y-8,1,1,c_white,0.25+0.75*(!gamemanager.kaerublockstate)) break; 
}

	
#define lemon_display

if !(custom_sprite_exists("toppings")) {
    sheet=add_custom_sprite(myobjdir+"toppings.png","toppings",1,1,0,0);
} else {
	sheet=get_custom_sprite("toppings")
}

realtype=unreal(data[0],0)

if realtype=0 draw_sprite_part_ext(sheet,0,52.5,36.5,16,16,(x*16),(y*16),1,1,c_white,1) 
else draw_sprite_part_ext(sheet,0,20.5,36.5,16,16,(x*16),(y*16),1,1,c_white,1)

		 

#define deloaded
if !(custom_sprite_exists("toppings")) || get_custom_sprite("toppings") == 0 {
	//no need to deload anything.	
}else {
	delete_custom_sprite("toppings")
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
    i=show_contextmenu("Topping Type:|-|Normal|Timer",0)
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
	if i=="1" global.cobjectreturn = "Timer";
	else global.cobjectreturn = "Normal";
	exit;
}

#define lemon_data
switch(argument0) {
	case 0: global.cobjectreturn = "0" break;
	case 1: global.cobjectreturn = 0 break;
	case 2: global.cobjectreturn = 0 break;
}