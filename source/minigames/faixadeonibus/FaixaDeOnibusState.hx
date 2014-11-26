package minigames.faixadeonibus ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class FaixaDeOnibusState extends FlxState
{
	var car:Car;
	var street:FlxSprite;
	var strip:FlxSprite;
	var gameState:Bool;
	var grass:FlxSprite;
	var points:Int;
	var lifes:Int;

	var evil:Bool;
	public function new(evil_choice:Bool, points_choice:Int, lifes:Int) {
		super();
		evil = evil_choice;
		points = points_choice;
		this.lifes = lifes;
	}
	
	override public function create():Void {
		gameState = ! evil;
		if (gameState == true) {
			car = new Car(300, 200,true,points, lifes);
		}
		else {
			car = new Car(450, 200,false,points, lifes);
		}
		
		grass = new FlxSprite(0, 0);
		street = new FlxSprite(0, 0);
		strip = new FlxSprite(400, 0);
		grass.loadGraphic("assets/fundo.png", false, 640, 360, false);
		street.makeGraphic(640, 360, 0xFFAAAAAA);
		strip.makeGraphic(5, 360, 0xFFCCFF33);
		
		add(street);
		add(grass);
		add(strip);
		add(car);
	
	}
		 
	override public function update():Void
	{
		super.update();
	}	
    
	override public function destroy():Void {
		super.destroy();
	}
	
	
}