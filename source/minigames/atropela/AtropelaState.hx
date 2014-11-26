package minigames.atropela ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;
import flixel.input.touch.FlxTouch;
import Std;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class AtropelaState extends FlxState
{
    var road1:FlxSprite;
    var road2:FlxSprite;
    var road3:FlxSprite;
    var windShield:FlxSprite;
    var steerWheel:FlxSprite;
    var steerWheelRight:FlxSprite;
    var steerWheelLeft:FlxSprite;
    var timer:FlxTimer = new FlxTimer();
    var ball:Ball;
    var cycle = 0;
    var speed = 0;
    var relogio:FlxText;
    var gameState:Bool;
    var ganhou:Bool;

    var points:Int;
    var lifes:Int;

    var evil:Bool;
    public function new(evil_choice:Bool, points:Int, lifes:Int) {
        super();
        evil = evil_choice;
        this.points = points;
        this.lifes = lifes;
    }
	
	override public function create():Void {
		road1 = new FlxSprite(0,0);
        road2 = new FlxSprite(0,0);
        road3 = new FlxSprite(0,0);
        windShield = new FlxSprite(0,0);
        ball = new Ball(280, 100);
        steerWheel = new FlxSprite(0,0);
        steerWheelRight = new FlxSprite(640,0);
        steerWheelLeft = new FlxSprite(640,0);
        relogio = new FlxText(150, 100, 500, "Tempo: ", 15);
        road1.loadGraphic("assets/road1 - Copia.png", false, 640, 360, false);
        road2.loadGraphic("assets/road2 - Copia.png", false, 640, 360, false);
        road3.loadGraphic("assets/road3 - Copia.png", false, 640, 360, false);
        windShield.loadGraphic("assets/windshield.png", false, 640, 360, false);
        steerWheel.loadGraphic("assets/steering wheel.png", false, 640, 360, false);
        steerWheelRight.loadGraphic("assets/steering wheelright.png", false, 640, 360, false);
        steerWheelLeft.loadGraphic("assets/steering wheelleft.png", false, 640, 360, false);
		add(road3);
        add(road2);
        add(road1);
        add(ball);
        add(relogio);
        add(windShield);
        add(steerWheel);
        add(steerWheelRight);
        add(steerWheelLeft);
        gameState = !evil;
        timer.start(5, endGame);
        if (gameState == true)
            ganhou = false;
        else 
            ganhou = true;
        
	
	}
	/**
	 * Function that is called once every frame.
	 **/
	
		 
	override public function update():Void
	{
		super.update();
        cycle++;
        cycleroad(cycle);
        
        if (cycle == 60){
            cycle = 0;
        }
        if (ball.y > 150 + Std.int(timer.elapsedTime*20)){
            ball.velocity.y = -(200 + Std.int(timer.elapsedTime*10)) ;
        }
        
        if (FlxG.mouse.justPressed) {
            if (FlxG.mouse.x > 320){    
                speed = speed - 2;
                ball.velocity.x = speed;
                steerright();
            }
            else{
                speed = speed + 2;
                ball.velocity.x = speed;
                steerleft();
            }
        }
        relogio.text = "Tempo: " + floatToString( timer.elapsedTime, 2, "," );
        if (timer.elapsedTime > 1){
            ball.scale.set(0.5 + timer.elapsedTime/2,0.5 + timer.elapsedTime/2);
        }
        ball.angle = cycle*3;
        
        if ((ball.x < 30 || ball.x > 610) && gameState == true){
            ganhou = true;
        }
        if ((ball.x < 30 || ball.x > 610) && gameState == false){
            ganhou = false;
        }
            
            
        
            
        
    }
    
    function cycleroad(cycle): Void {
        if (cycle == 20){
            road1.x = 640;
            road2.x = 0;
        }
        if (cycle == 40){
            road2.x = 640;
            road3.x = 0;
	    }	
        if (cycle == 60){
            road3.x = 640;
            road1.x = 0;
        }
        
        
        
    }
    
    function steerright():Void {
        steerWheel.x = 640;
        steerWheelLeft.x = 640;
        steerWheelRight.x = 0;
        
    }
    
    function steerleft():Void{
        steerWheel.x = 640;
        steerWheelRight.x = 640;
        steerWheelLeft.x = 0;
    }
    
    function floatToString( num:Float, precisao:Int, separador:String="," ):String {
		var str:String = Std.string( Std.int( num * Math.pow(10, precisao) ) );
		var str1 = str.substr(0, str.length - precisao);
		if ( str1 == "" )
			str1 = "0";
		str = str1 + separador + str.substring(str.length - precisao );
		return str;
	}
    
	override public function destroy():Void {
		super.destroy();
	} 
    
   function endGame(t:FlxTimer): Void{
       //if (!ganhou){
       //     add(new FlxText(420, 250, 100, "Perdeu", 20, true));
       // } else {
       //     add(new FlxText(420, 250, 100, "Ganhou", 20, true));
       // }
        if (ganhou == true) {
           FlxG.switchState(new MinigameGameSwitcherState(!gameState, points + 100, false, lifes));
        }
        else {
           FlxG.switchState(new MinigameGameSwitcherState(!gameState, points + 10, true, lifes - 1));
        }
    }
	
	
    
}