package;

import flixel.FlxSprite;

class Card extends FlxSprite
{
    override function new(x:Float, y:Float, dir:String)
    {
        super(x, y);

        loadGraphic(Paths.image(dir));

        antialiasing = FlxG.save.antialising;
    }
}