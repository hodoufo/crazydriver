package minigames.faixadeonibus ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxPoint;
import flixel.util.FlxTimer;
import flixel.input.FlxSwipe;



/**
 * ...
 * @author ...
 */
class Car extends FlxSprite
{
	var gameState:Bool;
	var timer:FlxTimer = new FlxTimer();
	var ganhou:Bool;
	var points:Int;
	var lifes:Int;
	
	public function new(X:Float=0, Y:Float=0, Type:Bool=true, points:Int, lifes:Int) 
	{
		super(X, Y);
		loadGraphic("assets/car.png", false, 80, 143, false);	
		gameState = Type;
		ganhou = true;
	    timer.start(10, endGame);

	    this.points = points;
	    this.lifes = lifes;
			
		if (Type == true) {
			acceleration.x = 200;
		}
		else {
			acceleration.x = -100;
		}
	}
	
	private function swipe_left():Void {
		velocity.x = -100;
		
	}
	
	private function swipe_right():Void {
		velocity.x = 80;
		
	}
	
	override public function update():Void 
	{
		var limite:FlxPoint;
		var limiteEsq:FlxPoint;
		var limiteDir:FlxPoint;
		super.update();
		
		if (gameState == true) {
			acceleration.x = acceleration.x + timer.elapsedTime*0.5;
		}
		else {
			acceleration.x = acceleration.x - timer.elapsedTime*0.4;
		}
		
		if (gameState == true) limite = new FlxPoint(400, 300);
		else limite = new FlxPoint(400, 300);
		limiteEsq = new FlxPoint(600, 300);
		limiteDir = new FlxPoint(50, 300);
		
		if (pixelsOverlapPoint(limite, 0xFF) == true || pixelsOverlapPoint(limiteEsq, 0xFF) == true || pixelsOverlapPoint(limiteDir, 0xFF) == true ) {
			ganhou = false;
			this.endGame(timer);
		}

		if (timer.elapsedTime > 5) {
			ganhou = true;
			this.endGame(timer);
		}
				
		for (swipe in FlxG.swipes){
		    if (swipe.angle > 0) {
		    	swipe_right();
		    } else if (swipe.angle < 0) {
		    	swipe_left();
		    }
		}
		
	/*	if ( FlxG.keys.justPressed.check( FlxKey.ENTER ) ) {
			if (gameState == true) {
				swipe_left();
			}
			else {
				swipe_right();
			}
		} */
	}
	
	private function endGame(t:FlxTimer):Void {

		// FlxG.switchState(new EndState(t.elapsedTime , ganhou));
		if (ganhou == true) {
	   	   FlxG.switchState(new MinigameGameSwitcherState(!gameState, points + 100, false, lifes));
		}
		else {
		   lifes = lifes - 1;
		   FlxG.switchState(new MinigameGameSwitcherState(!gameState, points + 10, true, lifes));
		}
	}
}