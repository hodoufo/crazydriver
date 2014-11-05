package ;

import flixel.FlxState;
import flixel.text.FlxText;

/**
 * ...
 * @author ...
 */
class EndState extends FlxState
{
	public function new(Tempo:Float, Ganhou:Bool)
	{
		super();
		var Logo:FlxText;
		var Extra:FlxText;
		
		if (Ganhou == true) {
	   	   Logo = new FlxText(200, 30, 200, "Voce ganhou! :)", 20, true);
		   add(Logo);
		}
		else {
			Logo = new FlxText(200, 30, 200, "Voce Perdeu :(", 20, true);
			Extra = new FlxText(150, 100, 500, "Você sobreviveu " + floatToString(Tempo,2,",") + " segundos!!!", 15, true);
			add(Logo);
			add(Extra);
		
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