package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/seta2.png", "assets/seta2.png");
			type.set ("assets/seta2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/bloodstain.png", "assets/bloodstain.png");
			type.set ("assets/bloodstain.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/road3.png", "assets/road3.png");
			type.set ("assets/road3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/road3 - Copia.png", "assets/road3 - Copia.png");
			type.set ("assets/road3 - Copia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/fundo.png", "assets/fundo.png");
			type.set ("assets/fundo.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/vel.png", "assets/vel.png");
			type.set ("assets/vel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/road1.png", "assets/road1.png");
			type.set ("assets/road1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/FloorTexture.png", "assets/FloorTexture.png");
			type.set ("assets/FloorTexture.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Car.png", "assets/Car.png");
			type.set ("assets/Car.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/stop.png", "assets/stop.png");
			type.set ("assets/stop.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/limit.png", "assets/limit.png");
			type.set ("assets/limit.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/steering wheelright.png", "assets/steering wheelright.png");
			type.set ("assets/steering wheelright.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/data-goes-here.txt", "assets/data/data-goes-here.txt");
			type.set ("assets/data/data-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/road2.png", "assets/road2.png");
			type.set ("assets/road2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/road1 - Copia.png", "assets/road1 - Copia.png");
			type.set ("assets/road1 - Copia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/Ball.png", "assets/Ball.png");
			type.set ("assets/Ball.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/seta.png", "assets/seta.png");
			type.set ("assets/seta.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/images-go-here.txt", "assets/images/images-go-here.txt");
			type.set ("assets/images/images-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/car2.png", "assets/car2.png");
			type.set ("assets/car2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/windshield.png", "assets/windshield.png");
			type.set ("assets/windshield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/Orb.png", "assets/Orb.png");
			type.set ("assets/Orb.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/steering wheelleft.png", "assets/steering wheelleft.png");
			type.set ("assets/steering wheelleft.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/car.png", "assets/car.png");
			type.set ("assets/car.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/steering wheel.png", "assets/steering wheel.png");
			type.set ("assets/steering wheel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/road2 - Copia.png", "assets/road2 - Copia.png");
			type.set ("assets/road2 - Copia.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/sounds/beep.ogg", "assets/sounds/beep.ogg");
			type.set ("assets/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/flixel.ogg", "assets/sounds/flixel.ogg");
			type.set ("assets/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
