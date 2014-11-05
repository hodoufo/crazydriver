package ;

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
	
	public function new(X:Float=0, Y:Float=0, Type:Bool=true) 
	{
		super(X, Y);
		loadGraphic("assets/car.png", false, 80, 143, false);	
		gameState = Type;
		ganhou = true;
	    timer.start(10, endGame);
		/* this.allowRotation = false; */
	
		if (Type == true) {
			acceleration.x = 50;
		}
		else {
			acceleration.x = -400;
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
		super.update();
		
		if (gameState == true) limite = new FlxPoint(400, 300);
		else limite = new FlxPoint(400, 305);
		
		if (pixelsOverlapPoint(limite, 0xFF) == true) {
			ganhou = false;
			this.endGame(timer);
		}
		
		for (swipe in FlxG.swipes){
		    angle = swipe.angle;
		    if (angle > 90 || angle < -90) {
		    	swipe_right();
		    } else if ( angle < 90 && angle > -90) {
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
		FlxG.switchState(new EndState(t.elapsedTime , ganhou));
	}
}