/* Erik Vanlandingham 
*
*
*Loop(forever)
*    if LightValue < mid
*        LeftMotor Power = 40
*        RightMotor Power = 0
*    if LightValue > mid
*        RightMotor Power = 40
*        LeftMotor Power = 0
*   
*/
#define SPEED 60
#define HALFSPEED 30
#define midpoint 60

dseg segment
white sword
black sword
//midpoint sword
level sword 0
dseg ends

thread main
/*Callibrate
 SetSensorLight(IN_3)
 
 //mov white, lightSensorVal
 ReadSensor(IN_3, white)
 
 //mov black, lightSensorVal
 ReadSensor(IN_3, black)
 
 sub midpoint, white, black
 add black, 2
 div midpoint, black */
 
SetSensorLight(IN_3)

Loop:
 ReadSensor(IN_3, level)
 brcmp LT, Left, level, midpoint 
 brcmp GT, Right, level, midpoint 
 OnFwd(OUT_BC,SPEED)
 jmp Loop

Left:
 OnFwd(OUT_B,SPEED)
 OnFwd(OUT_C,HALFSPEED)
 jmp Loop
 
Right:
 OnFwd(OUT_C,SPEED)
 OnFwd(OUT_B,HALFSPEED)
 jmp Loop
 
 exit
endt
