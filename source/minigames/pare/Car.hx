package minigames.pare ;

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
	var ganhou:Bool;
	var timer:FlxTimer = new FlxTimer();
	var points: Int;
	var lifes:Int;
	
	public function new(X:Float=0, Y:Float=0, Type:Bool=true, points:Int, lifes:Int) 
	{
		super(X, Y);
		loadGraphic("assets/car2.png", false, 143, 80, false);	
		gameState = Type;
		ganhou = true;

		this.points = points;
		this.lifes = lifes;

	    timer.start(10, endGame);
		if (gameState == true) {
			velocity.x = -120;
		}
		else velocity.x = -60;
		
			
	}
		
	override public function update():Void 
	{
		var limite:FlxPoint;
		super.update();
		
		limite = new FlxPoint(100, 100);

		for (swipe in FlxG.swipes){
		    if (swipe.angle > 0) {
		    	swipe_right();
		    } else if (swipe.angle < 0) {
		    	swipe_left();
		    }
		}
		
		
		if (pixelsOverlapPoint(limite, 0xFF) == true) {
			if (gameState == true){
				if (velocity.x < -100){
					ganhou = false;
					this.endGame(timer);
				}
				else {
					ganhou = true;
					this.endGame(timer);
				}
			}
			else {
				if (velocity.x > -100){
					ganhou = false;
					this.endGame(timer);
				}
				else {
					ganhou = true;
					this.endGame(timer);
				}
			}
		}
	}
	private function swipe_left():Void {
		velocity.x = velocity.x*10/9;
		
	}
	
	private function swipe_right():Void {
		velocity.x = velocity.x*0.9;
		
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