package minigames.pare ;

import flixel.FlxSprite;

/**
 * ...
 * @author ...
 */
class Stop extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0, ?SimpleGraphic:Dynamic) 
	{
		super(X, Y);
		
		loadGraphic("assets/limit.png", false, 80, 102, false);	
	}
	
}