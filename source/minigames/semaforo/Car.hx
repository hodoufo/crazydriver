package minigames.semaforo ;


import flixel.addons.nape.FlxNapeSprite;
import flixel.FlxG;
import flixel.FlxSprite;
import openfl.Assets;


class Car extends FlxNapeSprite
{
	
	public function new ()
	{
		super(FlxG.width / 2, FlxG.height / 2, Assets.getBitmapData("assets/Car.png"));
		createCircularBody(36);
		body.allowRotation = false;
	}
	
	override public function update():Void 
	{
		super.update();
		
		if (FlxG.camera.target != null && FlxG.camera.followLead.x == 0) // target check is used for debug purposes.
		{
			x = Math.round(x); // Smooths camera and car shadow following. Does not work well with camera lead.
			y = Math.round(y); // Smooths camera and car shadow following. Does not work well with camera lead.
		}
		
	}
}