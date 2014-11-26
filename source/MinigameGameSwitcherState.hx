package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxTimer;

import minigames.faixadeonibus.FaixaDeOnibusState;
import minigames.semaforo.SemaforoState;
import minigames.atropela.AtropelaState;
import minigames.pare.PareState;

import Math.random;
/**
 * A FlxState which can be used for the actual gameplay.
 */
class MinigameGameSwitcherState extends FlxState
{	

	var evil:Bool;
	var timer:FlxTimer;
	var points:Int;
	var perdeu:Bool;
	var lifes:Int;

	public function new(evil_choice:Bool, points_choice:Int, perdeu_choice:Bool, lifes:Int) {
		super();
		evil = evil_choice;
		points = points_choice;
		perdeu = perdeu_choice;
		this.lifes = lifes;
	}

	override public function create():Void
	{
		super.create();
		timer = new FlxTimer();
		timer.start(1, switchToRandomState);
	}
		 
	override public function update():Void {
		super.update();
		
		if (this.lifes <= 0) {
			FlxG.switchState(new EndState(points));
		}

		if (evil) {
			add(new FlxText(100, 100, 100, "So you're a bad guy, huh?", 20, true));
			add(new FlxText(400, 100, 100, "" + points + " points", 20, true));
			add(new FlxText(400, 50, 100, lifes + " lifes left", 15, true));
			
		} else {
			add(new FlxText(400, 100, 100, "So good to be Mr. Nice Guy", 20, true));
			add(new FlxText(100, 100, 100, "" + points + " points", 20, true));
			add(new FlxText(100, 50, 100, lifes + " lifes left", 15, true));
			
		}
	}	
    
	override public function destroy():Void {
		super.destroy();
	}
	
	private function switchToRandomState(Timer:FlxTimer):Void {
		

		var chosen:Int = Std.int(random()*3+1);
		
		add(new FlxText(0, 0, 100, floatToString(chosen, 2)));
		switch(chosen) {
			case 1:
				FlxG.switchState(new PareState(evil, points, lifes));
			case 2:
				FlxG.switchState(new PareState(evil, points, lifes));
			case 3:
				FlxG.switchState(new PareState(evil, points, lifes));
			//case 4:
			//	FlxG.switchState(new SemaforoState(evil));
		}
	}

	private function floatToString( num:Float, precisao:Int, separador:String="," ):String {
		var str:String = Std.string( Std.int( num * Math.pow(10, precisao) ) );
		var str1 = str.substr(0, str.length - precisao);
		if ( str1 == "" )
			str1 = "0";
		str = str1 + separador + str.substring(str.length - precisao );
		return str;
	}
}