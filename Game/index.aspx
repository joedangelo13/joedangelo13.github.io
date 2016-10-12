<%@ Page Title="Game" Language="VB" AutoEventWireup="false" Debug="true"%>
<head runat="server">
<script src="JS/jquery-1.7.2.min.js"></script>
    <title>My fancy game</title>

<style>
body{
        background-color:#000;

}
html{
       background-color:#000;
       overflow-x: hidden;
       overflow-y: hidden;
}
#canvas{

        background:url(Images/background.jpg);
        background-repeat:no-repeat;
        background-size:4800px 600px;


}

#colors{
    position:absolute;
    z-index:99999;
    visibility:hidden;



}
#Burst{
   display:none; 
}
#supercontainer{

width:1200px;
height:625px;
overflow:scroll;
overflow: -moz-scrollbars-none;


}
#bgm{
    display:none;
}
::-webkit-scrollbar { 
    visibility: hidden; 
}
#explosion{
    position:absolute;
    z-index: 5;
    margin-left:900;
    margin-top:250;
}
#randomlvl1{
    position:absolute;
    z-index: 10;
    width: 750px;
    height:650px;
    color: #FFFFFF;
    margin-left: -760px;
    margin-top: 25px;
    background:url(Images/rocket.png);
    background-repeat:no-repeat;
    background-size:750px;
   
    }
#lvltext1{
    margin-left:150px;
    margin-top:270px;
    font-weight: bold;
    color: black;
}
#randomlvl2{
    position:absolute;
    z-index: 10;
    color: #FFFFFF;
    height:;
    width: 600px;
    height: 700px;
   
    margin-left: 2400px;
    margin-top: 0px;
    background-color: #FF0000;
    background:url(Images/tentacleright.png);
    background-repeat:no-repeat;
    background-size:600px 625px;
   
    
}
#lvltext2{
    font-weight:bold;
    margin-top: 300px;
    margin-left: 180px;
    font-size: 14px;
}
#level2leftside{
     position:absolute;
    z-index: 10;
    color: #FFFFFF;
    height:;
    width: 600px;
    height: 700px;
   
    margin-left: -690px;
    margin-top: 0px;
    background-color: #FF0000;
    background:url(Images/tentacleleft.png);
    background-repeat:no-repeat;
    background-size:600px 625px;
}
#randomlvl3{
    position:absolute;
    z-index: 10;
    color: #FFFFFF;
    width: 450px;
    height: 450px;
    margin-left: 800px;
    margin-top: -455px;
    background:url(Images/asteroid.png);
    background-repeat:no-repeat;
    background-size:450px 450px;
   
    
}
#lvltext3{
    margin-left: 75px;
    margin-top: 190px;
    color: red;
    font-weight: bold;
}
#scoreboard{
    position:absolute;
    z-index: 1000000;
    margin-top: -617px;
    margin-left: 375px;
    display:none;
    color:#FFF;
}
#playerinfo{
    color:#fff;
 
    margin-top: -20px;


}


</style>


</head>
<body>
<form id="form1" runat="server">
    <div id ="explosion">
        <img id="Burst" src="Images/slime.png" width="50"  />
   
</div>       
<div id="randomlvl1">
    <p id="lvltext1"></p>
</div>
<div id="randomlvl2">
    <p id="lvltext2"></p>
</div>
<div id="randomlvl3">
    <p id="lvltext3"></p>
</div>
<div id="level2leftside">
    <p> </p>
</div>


    <!-- Include jQuery >= 1.5.1: [http://paulirish.com/2010/the-protocol-relative-url/](http://paulirish.com/2010/the-protocol-relative-url/) -->
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>
    <!-- non google fallback -->
    <script>!window.jQuery && document.write(unescape('%3Cscript src="jquery.min.js"%3E%3C/script%3E'))</script>
    
    <!-- include jquery.ui -only needed if you are using the explode effect at the end -->
    <script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js"></script>
    <!-- non google fallback -->
    <script>!window.jQuery.ui && document.write(unescape('%3Cscript src="jquery-ui.min.js"%3E%3C/script%3E'))</script>
    
    <!-- Include *at least* the core style and default theme -->
    <!--link href="http://alexgorbatchev.com/pub/sh/current/styles/shCore.css" rel="stylesheet" type="text/css" />
    <link href="http://alexgorbatchev.com/pub/sh/current/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
    <script src="http://alexgorbatchev.com/pub/sh/current/scripts/shCore.js" type="text/javascript"></script>
    <script src="http://alexgorbatchev.com/pub/sh/current/scripts/shBrushJScript.js" type="text/javascript"></script-->
    
    <script src="jquery.imgexplosion.js"></script>
    <!-- call the plugin -->
  


    <center><div id="supercontainer">
    
     <img id="colors" src="Images/trip.png" width="1183px" height="600px"> </img>

 <canvas id="canvas"  style="border:1px solid #000"></canvas></center>
 </div>
<script>
(function () {
    var requestAnimationFrame = window.requestAnimationFrame || window.mozRequestAnimationFrame || window.webkitRequestAnimationFrame || window.msRequestAnimationFrame;
    window.requestAnimationFrame = requestAnimationFrame;
})();

var lives = 3;
var score = 0;
var bossHP = 2000;
var level = 0;
var lvl1 = 0;
var lvl2 = 0;
var lvl3 = 0;
var Lvl1array = new Array(10);
var Lvl2array = new Array(10);
var Lvl3array = new Array(10);
var image = new Image();
image.src="Images/robot.png";
var platform = new Image();
platform.src="Images/platformsteel.png";
var laser = new Image();
laser.src="Images/laser.png";
var enemyimg = new Image();
enemyimg.src="Images/smallenemy.png";
var easteregg = new Image();
easteregg.src="Images/easteregg.png";
var platform2 = new Image();
platform2.src="Images/platform2.png";
var platform3 = new Image();
platform3.src="Images/platform.png";
var platform4 = new Image();
platform4.src="Images/platform4.png";
var coin = new Image();
coin.src="Images/coin.png";
var bossimg = new Image();
bossimg.src="Images/bossMan.png";
var bossfire = new Image();
bossfire.src="Images/bossfire.png";
var bosshealthbar = new Image();
bosshealthbar.src="Images/bosshp.png";

var canvas = document.getElementById("canvas");

var imageObj = new Image();
    ctx = canvas.getContext("2d"),
    



	width = 6000,
    height = 600,
    player = {
        x: 610,
        y: 560,
        width: 15,
        height: 15,
        speed: 3,
        velX: 0,
        velY: 0,
        jumping: false,
        grounded: false
	
		
    },	

    keys = [],
    friction = 0.8,
    gravity = 0.3;




var enemies = [];

enemies.push({
    x:530,
    y:120,
    width: 30,
    height: 30
});
enemies.push({
    x:1020,
    y:player.y,
    width: 30,
    height: 30
});
enemies.push({
    x:1550,
    y:545,
    width: 30,
    height: 30
});
enemies.push({
    x:2045,
    y:420,
    width: 30,
    height: 30
});


var boss = [];
boss.push({
    x:4300,
    y:125,
    width: 400,
    height: 400
});
boss.push({
    x:3800,
    y:80,
    width: 000,
    height: 12.5
});


var eastereggs = [];

eastereggs.push({
    x:2200,
    y:300,
    width: 15,
    height: 15
});


var coins = [];

coins.push({
    x:381,
    y:530,
    width: 15,
    height: 15
});
coins.push({
    x:181,
    y:430,
    width: 15,
    height: 15
});

coins.push({
    x:381,
    y:330,
    width: 15,
    height: 15
});

coins.push({
    x:181,
    y:230,
    width: 15,
    height: 15
});

coins.push({
    x:381,
    y:130,
    width: 15,
    height: 15
});

coins.push({
    x:717,
    y:130,
    width: 15,
    height: 15
});

coins.push({
    x:1130,
    y:130,
    width: 15,
    height: 15
});
coins.push({
    x:1275,
    y:85,
    width: 15,
    height: 15
});
coins.push({
    x:1594,
    y:400,
    width: 15,
    height: 15
});
coins.push({
    x:1594,
    y:300,
    width: 15,
    height: 15
});
coins.push({
    x:1594,
    y:200,
    width: 15,
    height: 15
});
coins.push({
    x:1594,
    y:100,
    width: 15,
    height: 15
});
coins.push({
    x:1750,
    y:100,
    width: 15,
    height: 15
});
coins.push({
    x:2023,
    y:430,
    width: 15,
    height: 15
});
coins.push({
    x:2150,
    y:400,
    width: 15,
    height: 15
});
coins.push({
    x:2570,
    y:505,
    width: 15,
    height: 15
});
coins.push({
    x:2570,
    y:405,
    width: 15,
    height: 15
});
coins.push({
    x:2570,
    y:305,
    width: 15,
    height: 15
});
coins.push({
    x:2570,
    y:205,
    width: 15,
    height: 15
});
coins.push({
    x:2570,
    y:105,
    width: 15,
    height: 15
});
coins.push({
    x:3020,
    y:505,
    width: 15,
    height: 15
});
coins.push({
    x:3020,
    y:405,
    width: 15,
    height: 15
});
coins.push({
    x:3020,
    y:305,
    width: 15,
    height: 15
});
coins.push({
    x:3020,
    y:205,
    width: 15,
    height: 15
});
coins.push({
    x:3020,
    y:105,
    width: 15,
    height: 15
});
coins.push({
    x:3345,
    y:455,
    width: 15,
    height: 15
});
coins.push({
    x:3505,
    y:430,
    width: 15,
    height: 15
});

var boxes = [];

// dimensions

boxes.push({
    x: 350,
    y: 575,
    width: 300,
    height: 100
});



boxes.push({
    x: 1075,
    y: 150,
    width: 125,
    height: 25
});

boxes.push({
    x: 870,
    y: 150,
    width: 100,
    height: 25
	
		
	
});
boxes.push({
    x: 675,
    y: 150,
    width: 100,
    height: 25
});
boxes.push({
    x: 500,
    y: 150,
    width: 75,
    height: 25
});
boxes.push({
    x: 350,
    y: 150,
    width: 75,
    height: 25
});
boxes.push({
    x: 250,
    y: 200,
    width: 75,
    height: 25
});
boxes.push({
    x: 150,
    y: 250,
    width: 75,
    height: 25
});
boxes.push({
    x: 250,
    y: 300,
    width: 75,
    height: 25
});
boxes.push({
    x: 350,
    y: 350,
    width: 75,
    height: 25
});


boxes.push({
    x: 250,
    y: 400,
    width: 75,
    height: 25
});
boxes.push({
    x: 150,
    y: 450,
    width: 75,
    height: 25
});
boxes.push({
    x: 250,
    y: 500,
    width: 75,
    height: 25
});
boxes.push({
    x: 350,
    y: 550,
    width: 75,
    height: 25
	
	
});
boxes.push({
    x: 1400,
    y: 575,
    width: 75,
    height: 25
    
    
});
boxes.push({
    x: 1550,
    y: 575,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: player.x - 20,
    y: player.y -50,
    width: 0,
    height: 0
    
    
});
boxes.push({
    x: 1800,
    y: 325,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 1975,
    y: 450,
    width: 110,
    height: 25
    
    
});
boxes.push({
    x: 2200,
    y: 550,
    width: 195,
    height: 50
    
    
});
boxes.push({
    x: 2400,
    y: 575,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2525,
    y: 525,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2650,
    y: 475,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2525,
    y: 425,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2400,
    y: 375,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2525,
    y: 325,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2650,
    y: 275,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2525,
    y: 225,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2400,
    y: 175,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2525,
    y: 125,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2650,
    y: 75,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2800,
    y: 125,
    width: 10,
    height: 480
    
    
});

boxes.push({
    x: 2850,
    y: 75,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2975,
    y: 125,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 3100,
    y: 175,
    width: 100,
    height: 25
    
    
});

boxes.push({
    x: 2975,
    y: 225,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2850,
    y: 275,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2975,
    y: 325,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 3100,
    y: 375,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2975,
    y: 425,
    width: 100,
    height: 25
    
    
});
boxes.push({
    x: 2850,
    y: 475,
    width: 100,
    height: 25   
});
boxes.push({
    x: 2975,
    y: 525,
    width: 100,
    height: 25   
});
boxes.push({
    x: 3100,
    y: 575,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3250,
    y: 0,
    width: 10,
    height: 480    
});
boxes.push({
    x: 3300,
    y: 575,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3425,
    y: 525,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3300,
    y: 475,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3475,
    y: 450,
    width: 125,
    height: 25  
});

boxes.push({
    x: 3600,
    y: 450,
    width: 100,
    height: 25  
});
boxes.push({
    x: boss[0].x - 50,
    y: boss[0].y + 100,
    width: 50,
    height: 5
    
    
});
boxes.push({
    x: 3700,
    y: 400,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3825,
    y: 350,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3700,
    y: 300,
    width: 100,
    height: 25  
});
boxes.push({
    x: 3600,
    y: 250,
    width: 100,
    height: 25  
});
boxes.push({
    x: 1200,
    y: 150,
    width: 75,
    height: 25
});
boxes.push({
    x: 3594,
    y: 435,
    width: 25,
    height: 25  
});

canvas.width = width;
canvas.height = height;
function update() {




    


if (player.x < 1300 && player.y < 140){
if (player.x >=1200 && player.y <= 150)
{	
$("#supercontainer").scrollLeft(1200); 
level = 2;


}
}

if (player.x >= 2400 && player.y > 550)
{    
$("#supercontainer").scrollLeft(2400); 
level = 3;

}
if (player.x > 3600 && player.y < 460){
{    
$("#supercontainer").scrollLeft(3600);
level = 4;

}    


}




if (player.y >= 590 && player.x < 1200){
    lives = lives - 1;
    document.getElementById("life").value = "Lives: "+ lives;
    score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;
    player.x = 490;
    player.y = height - 2;
     if (player.x > 1200){
     player.x = 1250;
     player.y = 134;
     }

}
if (player.x < 2400 && player.y >= 590){
    if (player.y >= 590 && player.x > 1150){
    lives = lives - 1;
    document.getElementById("life").value = "Lives: "+ lives;
    score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;
    player.x = 1250;
    player.y = 134;
    boxes[15].y = 580;
}

}
if (player.x < 3600 && player.y >= 590){
    if (player.y >= 590 && player.x > 1150){
    lives = lives - 1;
    document.getElementById("life").value = "Lives: "+ lives;
     score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;
    player.x = 2425;
    player.y = 560;

}
}
   if (player.y >= 590 && player.x > 3600){
    lives = lives - 1;
    document.getElementById("life").value = "Lives: "+ lives;
     score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;
    player.x = 3625;
    player.y = 435;

}


  function bossfight(){
      boss[1].width = bossHP;
      boxes[49].width = 50;
      boxes[49].height = 5;
      if(eastereggs[0].width == 0){
    boxes[49].width = 50;
    boxes[49].height = 50;
      }
      if (boxes[49].x < 3470){
      boxes[49].x = boss[0].x - 50;
       boxes[49].y = player.y;
       }
    for (var l = 0; l < 100; l++){
        boxes[49].x = boxes[49].x - .10;
        ctx.beginPath();

    }
     

}
if (player.x > 3590 && bossHP > 0){
  bossfight();
}


if (player.x < 550 && player.y >= 536){
    appear1();

   
   
}

function appear1(){
    $("#randomlvl1").animate({left:'1160px'},2000);
    dissappear1();
    
}
function dissappear1(){
    $("#randomlvl1").delay(2000);
    $("#randomlvl1").animate({left:'2160px'},2000, dissappear1);
    $("#randomlvl1").fadeOut();
}

if (player.x < 1800){
    if(player.x > 1645 && player.y < 95){
        tentacleAppear();
    }
}
if (player.x < 1700){
    if (player.x > 1590 && player.y < 120){
        lefttentacleAppear();
    }
}
function lefttentacleAppear(){
    $("#level2leftside").animate({left:'600px'},2000);
    lefttentacleDissappear();
}
function lefttentacleDissappear(){
    $("#level2leftside").delay(2000);
    $("#level2leftside").animate({left:'-600px'},2000);
    $("#level2leftside").fadeOut();
}

function tentacleAppear(){
    $("#randomlvl2").animate({left:'-1500px'}, 3000);
    tentacleDissappear();
    
}
function tentacleDissappear(){
    $("#randomlvl2").delay(2000);
    $("#randomlvl2").animate({left:'1500px'},3000);
    $("#randomlvl2").fadeOut();
    
}

function asteroidDown(){
    $("#randomlvl3").animate({top:'550px'},2000);
    asteroidDissappear();
}
function asteroidDissappear(){
    $("#randomlvl3").delay(2000);
    $("#randomlvl3").animate({top:'1500px'},2000, asteroidDissappear);
    $("#randomlvl3").fadeOut();
}



var tick = 0;

if (player.x > 2515 && player.y > 500){
    if (player.x < 2610){
        asteroidDown();
    }
}


if (player.x < 2638){
if(player.x >= 2637 && player.y < 70){
 tick = 1;
 player.x = 2639;
 
}
}
if (tick == 1){
$.fn.imgExplosion({
                    img:'Images/asteroid.png',
                    start:'top'
                });
tick = 0;

}



if (player.x >= 1580){
if (player.x <= 1620 && player.y >= 100){ 
BlockGoesUp();
}
}
function BlockGoesUp(){
    if (boxes[15].y >=100){
for (var i = 0; i < 100; i++){
    boxes[15].y = boxes[15].y - 1;
            ctx.beginPath();
            if(i = 100){
            BlockGoesDown();
            }
}
}
}
function BlockGoesDown(){
if (boxes[15].y == 100){
for (var i = 0; i < 100; i++){
    boxes[15].y = boxes[15].y + 1;
            ctx.beginPath();
            if(i = 100){
            BlockGoesUp();
            }
}
}
}



for (var i = 0; i < 2; i++){
if (player.x < enemies[i].x + enemies[i].width  && player.x + enemies[i].width  > enemies[i].x &&
        player.y < enemies[i].y + enemies[i].height && player.y + player.height > enemies[i].y){
    lives = lives - 1;
    document.getElementById("life").value = "Lives: "+ lives;

    player.x = 530;
    player.y = 560;
     score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;


}
}
for (var i = 2; i < 4; i++){
if (player.x < enemies[i].x + enemies[i].width  && player.x + enemies[i].width  > enemies[i].x &&
        player.y < enemies[i].y + enemies[i].height && player.y + player.height > enemies[i].y){
    lives = lives - 1;
    document.getElementById("life").value = "Lives: "+ lives;

    player.x = 1225;
    player.y = 134;
    score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;
    boxes[15].y = 580;

}
}




for (var i = 0; i < enemies.length; i++){
if (boxes[16].x < enemies[i].x + enemies[i].width  && boxes[16].x + enemies[i].width  > enemies[i].x &&
        boxes[16].y < enemies[i].y + enemies[i].height && boxes[16].y + boxes[16].height > enemies[i].y){
    enemies[i].width = 0;
    enemies[i].height = 0;
    boxes[16].x = player.x - 20;
     score = score + 100;
    document.getElementById("Score").value = "Score: "+ score;
}
}
if (boxes[16].x < eastereggs[0].x + eastereggs[0].width  && boxes[16].x + eastereggs[0].width  > eastereggs[0].x &&
        boxes[16].y < eastereggs[0].y + eastereggs[0].height && boxes[16].y + boxes[16].height > eastereggs[0].y){
    
    eastereggs[0].width = 0;
    eastereggs[0].height = 0;
    document.getElementById("Burst").src = "Images/fingerlessgloves.png";
    bossimg.src = "Images/caterpillar.png"
    bossfire.src = "Images/fingerlessgloves.png";
    ctx.beginPath();
    document.getElementById("bgm").src = 'Sound/comfortablynumb.mp3';
    
    $('#colors').css('visibility','visible');

}





for (var i = 0; i < coins.length; i++){
if (player.x < coins[i].x + coins[i].width  && player.x + coins[i].width  > coins[i].x &&
        player.y < coins[i].y + coins[i].height && player.y + player.height > coins[i].y){
    coins[i].width = 0;
    coins[i].height = 0;
    new Audio('Sound/coin.mp3').play();

     score = score + 100;
    document.getElementById("Score").value = "Score: "+ score;

}
}
if (boxes[16].x < boss[0].x + boss[0].width  && boxes[16].x + boss[0].width  > boss[0].x &&
        boxes[16].y < boss[0].y + boss[0].height && boxes[16].y + boxes[16].height > boss[0].y){
    
    bossHP = bossHP - 10;
    if (bossHP == 0){
         $('#Burst').imgExplosion({

                    angle:true,

                    centerOn: explosion,

                    interval:2,

                    minThrow:500,

                    maxThrow:1300,

                    angle:true,

                    num:60,

                    explode: false,

                    extraWidth:500,

                    rotateSpeed:30

                });
        
        score = score + 5000;
        document.getElementById("Score").value = "Score: "+ score;
        boss[0].width = 0;
        boss[0].height = 0;
        boss[1].width = 0;
        boss[1].height = 0;
       boxes[49].height = 0;
       boxes[49].width = 0;
       boxes[49].y = 0;
       $("#Score2").val(score);
       $("#Score2").val(score);
    $("#canvas").fadeOut();
   $("#playerinfo").fadeOut();
   $("#scoreboard").fadeIn(2000);
       //window.location=window.location
    }
}
if (player.x < boxes[49].x + boxes[49].width  && player.x + boxes[49].width  > boxes[49].x &&
        player.y < boxes[49].y + boxes[49].height && player.y + player.height > boxes[49].y){
    lives = lives - .20;
    document.getElementById("life").value = "Lives: "+ lives;

    player.x = 3650;
    player.y = 435;
     score = score - 100;
    document.getElementById("Score").value = "Score: "+ score;


}
if (player.x < boxes[55].x + boxes[55].width  && player.x + boxes[55].width  > boxes[55].x &&
        player.y < boxes[55].y + boxes[55].height && player.y + player.height > boxes[55].y){
    if(eastereggs[0].width > 0){
        document.getElementById("bgm").src = 'Sound/boss.mp3';  
    boxes[55].width = 0;
    boxes[55].width = 0;
    boxes[55].y = 500;
}
boxes[55].width = 0;
    boxes[55].width = 0;
    boxes[55].y = 500;

}



    
    


if (lives <= 0){
    $("#Score2").val(score);
    $("#canvas").fadeOut();
   $("#playerinfo").fadeOut();
   $("#scoreboard").fadeIn(2000);
}
	    // check keys
    if (keys[38] || keys[32] || keys[87]) {
        // up arrow or space
        if (!player.jumping && player.grounded) {
            player.jumping = true;
            player.grounded = false;
            player.velY = -player.speed * 2;
            enemies[1].y = player.y;
            ctx.beginPath();

        }
    }
    if (keys[39] || keys[68]) {
        // right arrow
        if (player.velX < player.speed) {
            player.velX++;
        }
        image.src="Images/robot.png";
        boxes[16].x = player.x + 25;
        boxes[16].y = player.y - 50;
        boxes[16].width = 0;
        boxes[16].height = 0;
        
        enemies[1].y = player.y;
        ctx.beginPath();
    

    }
    if (keys[37] || keys[65]) {
        // left arrow
        if (player.velX > -player.speed) {
            player.velX--;
            boxes[16].x = player.x + 25;
            boxes[16].y = player.y - 50;
            boxes[16].width = 0;
            boxes[16].height = 0;
        
            enemies[1].y = player.y;
            ctx.beginPath();   

        }
        image.src="Images/robot_flipped.png";
        ctx.beginPath();
    

    }
    if (keys[84]) {
      transform(); 
        }
        if (keys[70]) {
      if (player.x < 3470){
      firelaser();
      }
      if (player.x >= 3470){
      firelaserBB();
      }

       new Audio('Sound/laserblast.mp3').play(); 
        }

    


    player.velX *= friction;
    player.velY += gravity;


    var offsetX = 0;
    var offsetY = 0;
    ctx.translate(offsetX, offsetY);
    
    ctx.clearRect(0, 0, width, height);
        ctx.beginPath();
    
    player.grounded = false;
    for (var i = 0; i < boxes.length; i++) {
        ctx.rect(boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
        
        var dir = colCheck(player, boxes[i]);

        if (dir === "l" || dir === "r") {
            player.velX = 0;
            player.jumping = false;
        } else if (dir === "b") {
            player.grounded = true;
            player.jumping = false;
        } else if (dir === "t") {
            player.velY *= -1;
        }

  
	}
    if(player.grounded){
         player.velY = 0;
    }
    
    player.x += player.velX;
    player.y += player.velY;

    ctx.drawImage(image, player.x, player.y, player.width, player.height);
    ctx.drawImage(laser, boxes[16].x, boxes[16].y, boxes[16].width, boxes[16].height);
    ctx.drawImage(bossfire, boxes[49].x, boxes[49].y, boxes[49].width, boxes[49].height);

for (var i = 0; i < enemies.length; i++) {
    ctx.drawImage(enemyimg, enemies[i].x, enemies[i].y, enemies[i].width, enemies[i].height);
   }
   for (var i = 0; i < 1; i++) {
    ctx.drawImage(bossimg, boss[i].x, boss[i].y, boss[i].width, boss[i].height);
   }
    for (var i = 1; i < 2; i++) {
    ctx.drawImage(bosshealthbar, boss[i].x, boss[i].y, boss[i].width, boss[i].height);
   }
for (var i = 0; i < coins.length; i++) {
    ctx.drawImage(coin, coins[i].x, coins[i].y, coins[i].width, coins[i].height);
   }
   for (var i = 0; i < 1; i++) {
    ctx.drawImage(easteregg, eastereggs[i].x, eastereggs[i].y, eastereggs[i].width, eastereggs[i].height);
   }
for (var i = 0; i < 14; i++) {
    ctx.drawImage(platform, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
   for (var i = 14; i < 16; i++) {
    ctx.drawImage(platform2, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
   for (var i = 17; i < 20; i++) {
    ctx.drawImage(platform2, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
    for (var i = 20; i < 48; i++) {
    ctx.drawImage(platform3, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
   for (var i = 50; i < 54; i++) {
    ctx.drawImage(platform4, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
   for (var i = 48; i < 49; i++) {
    ctx.drawImage(platform4, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
   for (var i = 54; i < 55; i++) {
    ctx.drawImage(platform2, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
   for (var i = 55; i < 56; i++) {
    ctx.drawImage(platform3, boxes[i].x, boxes[i].y, boxes[i].width, boxes[i].height);
   }
    requestAnimationFrame(update);
    
}



function colCheck(shapeA, shapeB) {
    // get the vectors to check against
    var vX = (shapeA.x + (shapeA.width / 2)) - (shapeB.x + (shapeB.width / 2)),
        vY = (shapeA.y + (shapeA.height / 2)) - (shapeB.y + (shapeB.height / 2)),
        // add the half widths and half heights of the objects
        hWidths = (shapeA.width / 2) + (shapeB.width / 2),
        hHeights = (shapeA.height / 2) + (shapeB.height / 2),
        colDir = null;

    // if the x and y vector are less than the half width or half height, they we must be inside the object, causing a collision
    if (Math.abs(vX) < hWidths && Math.abs(vY) < hHeights) {
        // figures out on which side we are colliding (top, bottom, left, or right)
        var oX = hWidths - Math.abs(vX),
            oY = hHeights - Math.abs(vY);
        if (oX >= oY) {
            if (vY > 0) {
                colDir = "t";
                shapeA.y += oY;
            } else {
                colDir = "b";
                shapeA.y -= oY;
            }
        } else {
            if (vX > 0) {
                colDir = "l";
                shapeA.x += oX;
            } else {
                colDir = "r";
                shapeA.x -= oX;
            }
        }
    }
    return colDir;
}



document.body.addEventListener("keydown", function (e) {
    keys[e.keyCode] = true;
     
});

document.body.addEventListener("keyup", function (e) {
    keys[e.keyCode] = false;
    if (keys[70] == false){
    boxes[16].width = 0;
    boxes[16].height = 0;
    boxes[16].x = player.x - 10;
    }
  
});











window.addEventListener("load", function () {
    update();
});
function transform(){

  if (player.width >= 29){
   player.width=15;
   player.height=15;
   noise2();
}
 else if (player.width <= 15){
   player.width=30;
   player.height=40;
   noise1();
}
}




function noise1(){


       new Audio('Sound/powerup.mp3').play();

}
function noise2(){

       new Audio('Sound/powerdown.mp3').play();

}



function firelaser(){
  boxes[16].y = player.y;
  boxes[16].width = 40;
  boxes[16].height = 5;
    for (var l = 0; l < 100; l++){
        boxes[16].x = boxes[16].x + .50;
        ctx.beginPath();

    }
    if (boxes[16].x > (player.x + 500)){
    boxes[16].x = player.x + 15;
    }




}
function firelaserBB(){
  boxes[16].y = player.y;
  boxes[16].width = 40;
  boxes[16].height = 5;
    for (var l = 0; l < 100; l++){
        boxes[16].x = boxes[16].x + .50;
        ctx.beginPath();

    }

}
(function($) {
    
    var resetProgress,
        cheatProgress = 0,
        // An array of the keycodes for the code
        code = [
            // up up down down left right left right b a
            38, 38, 40, 40, 37, 39, 37, 39, 66, 65
        ],
        code2 = [
            // up up down down left right left right b a
            40, 38, 40, 38, 39, 37, 39, 37, 65, 66
        ],
        // How much time to allow between keypresses
        time = 500;
    
    $( document ).bind( 'keydown.konami', function( event ) {
        
        if ( event.keyCode === code[ cheatProgress ] ) {
            clearTimeout( resetProgress );
            
            if ( cheatProgress === code.length - 1 ) {
                
                $( document ).trigger( 'cheat.konami' );
                
                cheatProgress = 0;
                
            } else {
                
                resetProgress = setTimeout( function() {
                    console.log( 'Progress reset.' );
                    cheatProgress = 0;
                }, time );
                
                cheatProgress += 1;
            }
            
            console.log( event.keyCode );
        }
    });
    
    $( document ).bind( 'cheat.konami', function() {
        document.getElementById("bgm").src = 'Sound/nowayout.mp3';
        lives = 30;
        document.getElementById("life").value = "Lives: "+ lives;
        
    });
   
})( jQuery );





$( document ).ready(function() {
    lives = 3;
    level = 1;
    if (score >= 8100){
        score = 8100;
    }
   $("#Score2").val(score);
    

                

        });


</script>
     <div id="playerinfo"> 
<center>
<input type="button" id="Start" value="Transform" onClick="transform()"  height="500" width="500"></input>
<input type="text" class="life" id="life" value="Lives: 3" readonly > </input>
<!--<input type="text" class="life" id="Level" value="Level: 0" readonly > </input>-->
<input type="text" class="life" id="Score" value="Score: 0" readonly > </input>
<!--<input type="text" class="life" id="px" value="Player x: " readonly > </input>
<input type="text" class="life" id="py" value="Player y: " readonly > </input>-->
Move: A,S,D. Jump: W.  Laser: F. 
</center>
 <audio id="bgm" controls autoplay loop>
  <source src="Sound/EnigmaTMG.mp3" type="audio/mpeg">
  Your browser does not support the audio element.
</audio> 

</div>

   
 
<center>
  <div id="scoreboard" background-image="Images/leaderboard.jpg" height="500px" width="800px">
<script runat="server">
    Private Sub submit(ByVal Source As Object, ByVal e As EventArgs)
        SqlDataSource4.Insert()
        FName.Text = " "
        LTName.Text = " "
        Score2.Text = " "
        
    
    End Sub
</script>

<div id="divone" style="width:400px;">
<h2 id="FN">First Name</h2>
<asp:TextBox id="FName" runat="server" /><br>
<h2 id="LN">Last Name</h2>
<asp:TextBox id="LTName" runat="server" /><br>
<br>
<h2 id="Score">Score</h2>
<asp:TextBox id="Score2" runat="server" readonly/><br><br>

<asp:Button OnClick="submit" Text="Submit Your Score" runat="server" /><br>
</div>
<h1>HiScores</h1>
<div id="container">

<asp:SqlDataSource ID="SqlDataSource4" runat="server"
        ConnectionString="<%$ ConnectionStrings:SQLwww %>"
        SelectCommand="SELECT TOP 7 * from Users order by Score DESC "
        UpdateCommand="UPDATE Users
                SET First_Name = @FirstName, Last_Name = @LastName, Score = @Score Where id = @id"
        InsertCommand="INSERT INTO [Users]
                ([FirstName], [LastName], [Score])
                VALUES (@FirstName, @LastName, @Score)"
        DeleteCommand="DELETE From Users Where id = @id">
       
        <InsertParameters>
            <asp:formparameter  Name="FirstName" formfield="FName" Type="String" />
            <asp:formparameter  Name="LastName" formfield="LTName" Type="String" />
            <asp:formparameter  Name="Score" formfield="Score2" Type="String" />
        </InsertParameters>
        <DeleteParameters>
            <asp:Parameter Name="id"/>
        </DeleteParameters>
 
    </asp:SqlDataSource>
    <br>
<asp:GridView Font-Size="Small" ID="GridView1" runat="server" DataSourceID="SqlDataSource4"
            DataKeyNames="id" EmptyDataText="There are no data records to display." AllowPaging="True" AllowSorting="True" CellPadding="4" AutoGenerateColumns="False" AutoGenerateEditButton="False" Width="600px" BackColor="Black" BorderStyle="Solid" BorderWidth="1px" CellSpacing="2" HorizontalAlign="Left" EnableViewState="True">

            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" />
         
            

            </Columns>

            <RowStyle BackColor="#000000" Font-Bold="True" ForeColor="#148400" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="Black" />
            <PagerStyle BackColor="#284775" ForeColor="#148400" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#148400" Font-Bold="True" ForeColor="#148400" />
            <HeaderStyle BackColor="#148400" Font-Bold="True" ForeColor="Black" />
            <AlternatingRowStyle BackColor="Black" Font-Bold="True" ForeColor="#148400" />
        </asp:GridView> 


</div>
</center>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SQLwww %>" 
            SelectCommand="select Fact FROM Questions where LVL LIKE 1">
    </asp:SqlDataSource>

        
        <asp:Repeater ID="Repeater1"  runat="server"  DataSourceID="SqlDataSource1" >
                <ItemTemplate>
               
                   
<script>            



Lvl1array[lvl1] = "<%# DataBinder.Eval (Container.DataItem, "Fact")%>";
lvl1++;


</script>
                   
                </ItemTemplate>
            </asp:Repeater>





<asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SQLwww %>" 
            SelectCommand="select Fact FROM Questions where LVL LIKE 2">
    </asp:SqlDataSource>

        
        <asp:Repeater ID="Repeater2"  runat="server"  DataSourceID="SqlDataSource2" >
                <ItemTemplate>
               
                   
<script>            



Lvl2array[lvl2] = "<%# DataBinder.Eval (Container.DataItem, "Fact")%>";
lvl2++;


</script>
                   
                </ItemTemplate>
            </asp:Repeater>




<asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:SQLwww %>" 
            SelectCommand="select Fact FROM Questions where LVL LIKE 3">
    </asp:SqlDataSource>

        
        <asp:Repeater ID="Repeater3"  runat="server"  DataSourceID="SqlDataSource3" >
                <ItemTemplate>
               
                   
<script>            



Lvl3array[lvl3] = "<%# DataBinder.Eval (Container.DataItem, "Fact")%>";
lvl3++;

</script>
                   
                </ItemTemplate>
            </asp:Repeater>
<script>

var random1 = Lvl1array[Math.floor(Math.random()*Lvl1array.length)];
var random2 = Lvl2array[Math.floor(Math.random()*Lvl2array.length)];
var random3 = Lvl3array[Math.floor(Math.random()*Lvl3array.length)];
document.getElementById("lvltext1").innerHTML = random1;
document.getElementById("lvltext2").innerHTML = random2;
document.getElementById("lvltext3").innerHTML = random3;
</script>




 
 
 
</form>
</body>