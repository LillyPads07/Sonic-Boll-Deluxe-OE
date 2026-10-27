#define create
friction=0.1
drop=0
lok=0
fresh=1

timeamount=unreal(data_0,0)
x+=unreal(data_1,0)
y+=unreal(data_2,0)

if !(custom_sprite_exists("bigsamba")) {
    sheet=add_custom_sprite(myobjdir+"bigsamba.png","bigsamba",0,1,0,0);
} else {
    sheet=get_custom_sprite("bigsamba")
}

if !(custom_sprite_exists("bigsambamask")) {
    mask_index=add_custom_sprite(myobjdir+"bigsambamask.png","bigsambamask",0,0,0,0);
} else {
    mask_index=get_custom_sprite("bigsambamask")
}

x-=16
y-=48
#define step

if dead && !inview() instance_destroy()

if instance_place(x,y,player) {
	if !dead {
		global.pizzatime=1 
		with other sound("sambahit")
		regionmarker.typemus="pizzatime" stagemusic(other.id,other.p2)
		//other.combo+=1
		//global.inf_time=0
		gamemanager.tick=real(timeamount)*60
		player.tick=real(timeamount)*60
		gamemanager.frog_escape=1
		gamemanager.frog_escape_timer=real(timeamount)*60
		vspeed = random_range(-3, -5) 
		hspeed = (random_range(3, 5)) 
		gravity=0.2 
		dead=1 
		instance_activate_object(konblock)
		instance_activate_object(koffblock)
		with (konblock) alarm[0]=1
		with (koffblock) {alarm[0]=1 owner=global.coll} //koffmo is DEAD!
		gamemanager.kaerublockstate=!gamemanager.kaerublockstate

		with (door) if (is_frogdoor) {frogged=1}
		wait=13
		tpos=1
		global.lap2x=x
		global.lap2y=y
		
		with instance_create(x,y,scriptblock) {
			scriptname="pizzatimeanim"
			event_user(0)
		}
	} 

}

	
#define draw
lookxsc=-1
if instance_exists(player) && !dead {
	lookxsc=esign(player.x-x,-1)
}

draw_sprite_part_ext(sheet,0,4+64*dead,4,64,112,x-64*lookxsc+64*(lookxsc==1),y,lookxsc,1,c_white,1)
if global.debug draw_sprite_ext(mask_index,0,x,y,1,1,0,c_white,0.5)
	
	
	
#define lemon_display
if !(custom_sprite_exists("bigsamba")) {
    sheet=add_custom_sprite(myobjdir+"bigsamba.png","bigsamba",0,1,0,0);
} else {
    sheet=get_custom_sprite("bigsamba")
}

lookxsc=1
if instance_exists(lemongrab){
	lookxsc=esign(lemongrab.spawnx-x,-1)   
}

draw_sprite_part_ext(sheet,0,4,4,64,112,(x*16+16)-32*lookxsc+unreal(data[1],0),(y*16)-48,lookxsc+unreal(data[2],0),1,c_white,1)
	
#define deloaded
if !(custom_sprite_exists("bigsamba")) || get_custom_sprite("bigsamba") == 0 {
	//no need to deload anything.	
}else {
	delete_custom_sprite("bigsamba")
}

if !(custom_sprite_exists("bigsambamask")) || get_custom_sprite("bigsambamask") == 0 {
	//no need to deload anything.	
}else {
	delete_custom_sprite("bigsambamask")
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
   global.cobjectreturn = get_string("Time to escape:",thedefault)
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
	global.cobjectreturn = "Timer: " + i
	exit;
}


#define lemon_data
switch(argument0) {
	case 0: global.cobjectreturn = 200 break;
	case 1: global.cobjectreturn = 0 break;
	case 2: global.cobjectreturn = 0 break;
}