package;

import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;

class DiscordMenu extends MusicBeatState
{
	var bg:FlxSprite;
	var menuItems:FlxTypedGroup<FlxSprite>;
	var shit:Array<String> = ['Discordo!', 'nothing', 'fanta'];

	var tex = Paths.getSparrowAtlas("discordMenu/weeks/items");

	var curSelected:Int = 0;

	var diffi:Int = 0;
	var difNames:Array<String> = ['Normal'];

	var songs:Array<Array<String>> = [
		['discord-annoyer', 'note nova', 'shut up', 'rudeance'],
		['nothing'],
		['fantamadeofglass']
	];

	override function create()
	{
		bg = new FlxSprite(0, 0).loadGraphic(Paths.image("discordMenu/menuBG"));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...shit.length)
		{
			var offset:Float = 108 - (Math.max(shit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, 0);
			menuItem.frames = tex;
			menuItem.animation.addByPrefix('idle', shit[i] + " idle", 24);
			menuItem.animation.addByPrefix('selected', shit[i] + " sel", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.updateHitbox();

			switch (i)
			{
				case 0:
					menuItem.setPosition(130, (i * 140) + offset);
					menuItem.screenCenter(X);
				case 1:
					menuItem.setPosition(130, (i * 140) + offset);
					menuItem.screenCenter(X);
				case 2:
					menuItem.setPosition(130, (i * 140) + offset);
					menuItem.screenCenter(X);
			}

			menuItems.add(menuItem);
			menuItem.scrollFactor.set(0, 0.25);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;

			changeItem();
		}

		super.create();
	}

	override function update(elapsed:Float)
	{
		FlxG.sound.music.volume = 0.2;

		if (controls.BACK)
		{
			MusicBeatState.switchState(new MainMenuState());
		}
		if (controls.UI_UP_P)
		{
			changeItem(-1);
		}
		if (controls.UI_DOWN_P)
		{
			changeItem(1);
		}
		if (controls.ACCEPT)
		{
			doShit();
		}

		super.update(elapsed);
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if (menuItems.length > 4)
				{
					add = menuItems.length * 8;
				}
				spr.centerOffsets();
			}
		});
	}

	function doShit()
	{
		PlayState.storyPlaylist = songs[curSelected];
		PlayState.isStoryMode = true;

		var diffic = "";

		PlayState.storyDifficulty = diffi;
		PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
		PlayState.storyWeek = curSelected;

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState(), true);
			FreeplayState.destroyFreeplayVocals();
		});
	}
}
