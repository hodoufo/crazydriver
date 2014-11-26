package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * ...
 * @author ...
 */
class EndState extends FlxState
{
	public function new(Points:Int)
	{
		super();
		add(new FlxText(200, 20, 200, "Crazy Traffic!", 20, true));
		add(new FlxText(200, 120, 200, "GAME OVER", 20, true));	
		add(new FlxText(200, 20, 200, "" + " points", 20, true));			
	}
	
}