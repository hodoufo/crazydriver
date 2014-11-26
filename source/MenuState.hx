package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		add(new FlxText(200, 20, 200, "Crazy Traffic!", 20, true));
		add(new FlxText(100, 100, 100, "Swipe left to be a bad guy", 20, true));
		add(new FlxText(400, 100, 100, "And right to be the good one", 20, true));
	}
	

	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		for (swipe in FlxG.swipes){
		    if (swipe.angle > 90 || swipe.angle < -90) {
		    	swipe_left();
		    } else if ( swipe.angle < 90 && swipe.angle > -90) {
		    	swipe_right();
		    }
		}
	}

	private function swipe_left():Void {
		FlxG.switchState(new MinigameGameSwitcherState(true, 0, false, 5));	
	}
	
	private function swipe_right():Void {
		FlxG.switchState(new MinigameGameSwitcherState(false, 0, false, 5));
	}	
}