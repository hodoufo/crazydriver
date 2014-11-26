package minigames.pare ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxPoint;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PareState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */

	var car:Car;
	var street:FlxSprite;
	var strip:FlxSprite;
	var radarStrip:FlxSprite;
	var gameState:Bool;
	var stop:Stop;
	var radar:FlxText;
	var radarBck:FlxSprite;
	var radarLines:FlxSprite;
	var velocimeter:FlxSprite;
	var marker:FlxSprite;

	
	
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
			
		
		gameState = false;
		
		car = new Car(500, 70,gameState, points, lifes);
		stop = new Stop(110, 0);
		
		street = new FlxSprite(0, 50);
		strip = new FlxSprite(0, 177);
		radarStrip = new FlxSprite(150, 0);
		marker = new FlxSprite(260,30);
		radarBck = new FlxSprite(0, 10);
		radarLines = new FlxSprite(5, 15);
		radar = new FlxText(10, 20, 200, "", 20, true);
		velocimeter = new FlxSprite(240, 20);
		
		velocimeter.loadGraphic("assets/vel.png",false,200,34,false);
		
		street.makeGraphic(640, 260, 0xFFAAAAAA);
		strip.makeGraphic(640, 5, 0xFFCCFF33);
		radarStrip.makeGraphic(5, 360, 0xFFFFFFFF);
		marker.makeGraphic(8, 20, 0xFF000000);
		radarBck.makeGraphic(100, 50, 0xFFFF3300);
		radarLines.makeGraphic(90, 40, 0xFF000000);
		
		add(street);
		add(strip);
		
		add(radarStrip);
		add(stop);
		
		add(radarBck);
		add(radarLines);
		add(radar); 
		add(velocimeter);
		add(marker);
		
		add(car);
		
	}
	
	private function speed( num:Float, precisao:Int, separador:String="," ):String {
		var str:String = Std.string( Std.int( num * Math.pow(10, precisao) ) );
		var str1 = str.substr(0, str.length - precisao);
		if ( str1 == "" )
			str1 = "0";
		str = str1 + separador + str.substring(str.length - precisao );
		return str;
	}
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		if (car.pixelsOverlapPoint(new FlxPoint(150, 100), 0xFF) == true) {
			radar.text = speed(car.velocity.x*-0.5, 1, ",");
		}
		
		marker.x = 250 - car.velocity.x*0.8;
		super.update();
	}	
}