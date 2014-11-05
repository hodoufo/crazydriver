package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var car:Car;
	var street:FlxSprite;
	var strip:FlxSprite;
	var gameState:Bool;

	
	override public function create():Void {
		gameState = true;
		if (gameState == true) {
			car = new Car(300, 200,true);
		}
		else {
			car = new Car(450, 200,false);
		}
		street = new FlxSprite(100, 0);
		strip = new FlxSprite(400, 0);
		street.makeGraphic(440, 360, 0xFFAAAAAA);
		strip.makeGraphic(5, 360, 0xFFCCFF33);
		
		add(street);
		add(strip);
		add(car);
	
	}
	/**
	 * Function that is called once every frame.
	 */
	
		 
	override public function update():Void
	{
		super.update();
	}	
    
	override public function destroy():Void {
		super.destroy();
	}
	
	
}