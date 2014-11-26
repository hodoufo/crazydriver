package minigames.semaforo ;



import flixel.addons.nape.FlxNapeSprite;
import flixel.addons.nape.FlxNapeState;
import flixel.util.FlxSpriteUtil;
import nape.Config;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.phys.Material;
import nape.shape.Polygon;
import flash.display.BitmapData;
import flash.display.BlendMode;
import flash.Lib;
import flixel.FlxCamera;
import flixel.FlxG;
import flixel.util.FlxPoint;
import flixel.FlxSprite;
import openfl.Assets;
import flixel.util.FlxTimer;
import flixel.text.FlxText;


class SemaforoState extends FlxNapeState
{
	static var LEVEL_MIN_X;
	static var LEVEL_MAX_X;
	static var LEVEL_MIN_Y;
	static var LEVEL_MAX_Y;



	 var car:Car;
     var floorTexture:FlxSprite;
	 var hudCam:FlxCamera;
     var angleLimit = 30;
	 var angle = 0.0;
     var speed = 240;
     var timer:FlxTimer = new FlxTimer();
     var ganhou:Bool;
     var gameState:Bool = true;
	
	var evil:Bool;
	public function new(evil_choice:Bool) {
		super();
		evil = evil_choice;
	}


	override public function create():Void
	{
		LEVEL_MIN_X = -Lib.current.stage.stageWidth / 2;
		LEVEL_MAX_X = Lib.current.stage.stageWidth * 1.5;
		LEVEL_MIN_Y = -Lib.current.stage.stageHeight / 2;
		LEVEL_MAX_Y = Lib.current.stage.stageHeight * 1.5;


		super.create();

		FlxG.mouse.visible = true;
             timer.start(5, endGame);


		velocityIterations = 5;
		positionIterations = 5;
        
        if (gameState = true)
            ganhou = true;
        else 
            ganhou = false;

		createFloor();
		createWalls(LEVEL_MIN_X, LEVEL_MIN_Y, LEVEL_MAX_X, LEVEL_MAX_Y);

		// Player car

		car = new Car();
        car.body.position.setxy(320, 640);
        car.body.velocity.setxy(0, -speed);


		add(car);



		FlxG.camera.setBounds(LEVEL_MIN_X , LEVEL_MIN_Y , LEVEL_MAX_X + Math.abs(LEVEL_MIN_X), LEVEL_MAX_Y + Math.abs(LEVEL_MIN_Y), true);
		FlxG.camera.follow(car, 0, null, 0);


	}





	private function createFloor()
	{
		// CREATE FLOOR TILES
		floorTexture = new FlxSprite(-300,-450);
        floorTexture.loadGraphic("assets/FloorTexture.png", false, 1280, 1294, false);
        add(floorTexture);

	}

	override public function update():Void
	{
		var limite = new FlxPoint(320, 400);

		super.update();


        for (swipe in FlxG.swipes){
		    angle = swipe.angle;
		    if (angle > 180-angleLimit || angle < -180 + angleLimit) {
		    	speedDown();
		    } else if ( angle < angleLimit && angle > -angleLimit) {
		    	speedUp();
		    }
		}
        if(gameState == true && car.body.position.y < 85){
          ganhou = false;
          endGame(timer);
        }
        if(gameState == false && car.body.position.y < 85){
          ganhou = true;
          endGame(timer);
        }




        car.body.velocity.setxy(0, -speed);

	}
    private function speedUp():Void{
        speed +=15;
    }
    private function speedDown():Void{
        if (speed > 0){
        speed -=15;
        }
    }
    private function endGame(t:FlxTimer): Void {
        if (ganhou)
            add(new FlxText(420 , 100, 100, "Ganhou", 20, true));
        else
            add(new FlxText(420 , 100, 100, "Perdeu", 20, true));
            


  }


}