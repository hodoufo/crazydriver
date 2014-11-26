package minigames.atropela ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxPoint;
import flixel.input.FlxSwipe;
import flixel.text.FlxText;

class Ball extends FlxSprite
{
	var gameState:Bool;
	var ganhou:Bool;
	
	public function new(X:Float=0, Y:Float=0) 
	{
        super(X, Y);
		loadGraphic("assets/Ball.png", false, 80, 80, false);
		acceleration.y = 150;
	}
	
	
	
	override public function update():Void 
	{
        super.update();
        
		}
		
}