#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enemyspr_index="nothing"
xsc=1
ysc=1

//duct tape sales _/
x+=8
y+=8
ystart=y

hspeed=-0.5 //choose(-0.5,0.5)

getregion(x)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if hspeed!=0 savhsp=hspeed
hspeed=0
if !inview() exit

bfr+=1
bfr=bfr mod 32
bframe=ceil(bfr div 8)
//unique frame variables to not conflict with other drawing scripts or something it'd be fine probably but like it won't hurt to make these different why am I even explaining it it's just a variable name

if instance_place(x,y,collider) && content!="bubble" event_perform(ev_collision,player)

active=1

s=(s+2) mod 360
y=ystart+round(lengthdir_y(10,s))
hspeed=savhsp

sprite=content
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with other {other.plr=id}
s=(nearestplayer().xsc)
switch (content) {
    case "coin": {
        with instance_create(x,y,itemdrop)  {vspeed=-2.5 type="coinup"}
        break}
    case "ring": {
        with instance_create(x,y,itemdrop) {vspeed=-2.5 type="ringup"}
        break}
    case "mushroom": {
        with instance_create(x,y,mushroom)  {c=1 vspeed=-2.5 alarm[0]=-1}
        break}
    case "1up": {
        with instance_create(x,y,lifemush)  {c=1 vspeed=-2.5 alarm[0]=-1}
        break}
    case "poison": {
        with instance_create(x,y,mushpoison)  {c=1 vspeed=-2.5 alarm[0]=-1}
        break}
    case "mini": {
        with instance_create(x,y,mushmini)  {c=1 vspeed=-2.5 alarm[0]=-1}
        break}
    case "fire": {
        with instance_create(x,y,flower)  {c=1 vspeed=-2.5}
        break}
    case "feather": {
        with instance_create(x,y,feather)  {c=1 vspeed=-2.5 alarm[0]=2}
        break}
    case "shield": {
        with instance_create(x,y,shield)  {vspeed=-2.5}
        break}
    case "star": {
        with instance_create(x,y,starman)  {c=1 vspeed=-2.5 alarm[0]=-1}
        break}
    case "shard": {
        with instance_create(x,y,starshard)  {vspeed=-2.5}
        break}
    case "key": {
        instance_create(x,y,keyitem)
        break}
    case "card": {
        instance_create(x,y,carditem)
        break}
    case "tokenw": {
        with instance_create(x,y,token) {type=0}
        break}
    case "tokenb": {
        with instance_create(x,y,token) {type=1}
        break}
    case "tokeng": {
        with instance_create(x,y,token) {type=2 name=other.nogt}
        break}
    case "goomba": {
        with instance_create(x,y,goomba) {vspeed=-2.5 phase=other.plr}
        break}
    case "goombrat": {
        with instance_create(x,y,goombrat) {vspeed=-2.5 phase=other.plr}
        break}
    case "bob-omb": {
        with instance_create(x,y,bobomb) {vspeed=-2.5 phase=other.plr}
        break}
    case "bob-ombfuse": {
        with instance_create(x,y,litbobomb) {vspeed=-2.5 phase=other.plr}
        break}
    case "spinyegg": {
        with instance_create(x,y,spinyegg) {vspeed=-2.5 phase=other.plr}
        break}
    case "shell": {
        with instance_create(x,y,shell) {vspeed=-2.5 phase=other.plr}
        break}
    case "redshell": {
        with instance_create(x,y,shell) {vspeed=-2.5 type="red" phase=other.plr}
        break}
    case "yelshell": {
        with instance_create(x,y,shell) {vspeed=-2.5 type="yel" phase=other.plr}
        break}
    case "blushell": {
        with instance_create(x,y,shell) {vspeed=-2.5 type="blu" phase=other.plr}
        break}
    case "beetleshell": {
        with instance_create(x,y,shell) {vspeed=-2.5 type="beetle" phase=other.plr}
        break}
    case "spinyshell": {
        with instance_create(x,y,shell) {vspeed=-2.5 type="spiny" phase=other.plr}
        break}
}
sound("itembubblepop")
instance_create(x,y,bubblepop)
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
     if content="tokenw" && spentblock() {changectrl.tokens+=1 instance_destroy()}
else if content="tokenb" && spentblock() {instance_destroy()}
else if content="tokeng" {
    pack = global.lskins[global.levelskin+1,0]
    if (pack == global.lbase) pack = ""
    if settings("token " + nogt + " " + chr(187) + pack) instance_destroy()
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
xsc=-esign(hspeed,1)

//having a bunch of else ifs and a big chain of ORs being constantly called every frame isnt that good // i was gonna do that eventually
switch (content) {
    case "1up": ssw_items("lifemush") break;
    case "poison": ssw_items("mushpoison") break;
    case "fire": ssw_items("fflower") break;
    case "feather": ssw_items("bfeather") break;
    case "tokenw": {type=0 ssw_items("token") break}
    case "tokenb": {type=1 ssw_items("token") break}
    case "tokeng": {type=2 ssw_items("token") break}
    case "goomba":
    case "goombrat":
    case "bob-omb":
    case "shell":
    case "redshell":
    case "beetleshell":
    case "spinyshell":
    xoff=1

    enemy_spritechange()

    enemy_animate()
    ssw_enemy(sprite)
    break;
    case "bob-ombfuse":
    xoff=-2

    enemy_spritechange()

    enemy_animate()
    ssw_enemy(sprite)
    break;
    case "spinyegg":
    yoff=8

    enemy_spritechange()

    enemy_animate()
    ssw_enemy(sprite)
    break;
    default:
    ssw_items(sprite)
}
draw_background_part_ext(global.masterobjects[biome],256+(24*bframe),96,24,24,floor(x)-12,floor(y)-12,image_xscale,image_yscale,c_white,image_alpha)
