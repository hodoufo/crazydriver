package minigames.pare ;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxPoint;

/**
 * ...
 * @author ...
 */
class Seta extends FlxSprite
{
	var gameState:Bool;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		loadGraphic("assets/seta2.png", false, 120, 120, false);	
	
	
			
	}
	
	
	override public function update():Void 
	{
		var limite:FlxPoint;
		super.update();
		
		if (gameState == true) limite = new FlxPoint(400, 300);
		else limite = new FlxPoint(400, 305);
		
		if (pixelsOverlapPoint(limite, 0xFF) == true) {
			loadGraphic("assets/bloodstain.png", false, 150, 116, false);	
		}
		if ( FlxG.keys.justPressed.check( FlxKey.ENTER ) ) {
		}
	}
}