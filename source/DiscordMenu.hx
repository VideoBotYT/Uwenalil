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
	var shit:Array<String> = ['discordo', 'nothing', 'fanta'];

	var curSelected:Int = 0;
	var curDifficulty:Int = 0;

	var diffi:Int = 0;
	var difNames:Array<String> = ['Normal'];

	var songs:Array<Array<String>> = [['discord-annoyer', 'note nova', 'shut up', 'rudeance'], ['nothing'], ['fantamadeofglass']];

	override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();	

		bg = new FlxSprite(0, 0).loadGraphic(Paths.image("discordMenu/menuBG"));
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		for (i in 0...shit.length)
		{
			var menuItem = new FlxSprite(0, 150 + (140 * i)).loadGraphic(Paths.image('discordMenu/weeks/' + shit[i]));
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItem.updateHitbox();
			menuItems.add(menuItem);
			menuItem.scrollFactor.set(0, 0.25);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
		}

		menuItems.forEach(function(spr:FlxSprite) {
			if (spr.ID != curSelected) {
					spr.scale.set(1, 1);
			} else {
					spr.scale.set(1.25, 1.25);
			}
		});

		changeItem();

		super.create();
	}

	override function update(elapsed:Float)
	{
		FlxG.sound.music.volume = 0.2;

		menuItems.forEach(function(spr:FlxSprite) {
			if (spr.ID != curSelected) {
					spr.scale.set(1, 1);
			} else {
					spr.scale.set(1.25, 1.25);
			}
		});

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
	}

	function doShit()
	{
		PlayState.storyPlaylist = songs[curSelected];
		PlayState.isStoryMode = true;

		var diffic = "";

		switch(curDifficulty)
		{
			case 0:
				diffic = '';
		}

		@:privateAccess
		WeekData.sexList = CoolUtil.coolTextFile(Paths.getPreloadPath('weeks/weekList.txt'));
		PlayState.storyDifficulty = curDifficulty;
		PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
		PlayState.storyWeek = curSelected;
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState(), true);
		});
	}
}
