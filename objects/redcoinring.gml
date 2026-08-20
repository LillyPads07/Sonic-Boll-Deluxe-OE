#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=0

xp=x
yp=y

alarm[0]=4

if (spentblock()) instance_destroy()

ring=skindat("chkrng")

redcount=0
open=0
spent=0
h=""
t=0
t2=0

bonus=1
classic=0

cid=string(x)+"."+string(y)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (redcoin) {
    instance_create(x,y,smoke)
    y=-verybignumber
    active=0
    gamemanager.redcount=0
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (redcoin) flash=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
t+=0.25
dy=round(sin(x+t/2)*2-3)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
throwsparks(x+8,y)
spent=1
open=0
sound("itemredcoinring")
with (redcoin) {y=ystart active=1 flash=0 visible=1 instance_create(x,y,smoke)}
alarm[0]=768
alarm[1]=640
mask_index=spr_nothing
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ssw_objects("redring")
