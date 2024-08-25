local v0 = false;
local v1 = true;
local v2 = true;
local curAngle = 0;
local colorSingMode = false

function onCreatePost()
    getPropertyFromClass("ClientPrefs", "shaders");
    precacheImage("light/left");
    precacheImage("light/down");
    precacheImage("light/up");
    precacheImage("light/right")

    makeLuaSprite("colorSing", "light/left", 0, 0)
    addLuaSprite("colorSing")
    screenCenter("colorSing")
    setObjectCamera("colorSing", "other")
    setProperty('colorSing.alpha', 0);
    setBlendMode("colorSing", "add")
end
function onStepHit()
    if modchart == true then
        if curStep == 63 then
            colorSingMode = true
            setBlendMode("colorSing", "normal")
        end
        if curStep == 128 then
            colorSingMode = false
        end
        if curStep == 191 then
            colorSingMode = true
        end
        if curStep == 256 then
            colorSingMode = false
        end
        if curStep == 463 then
            colorSingMode = true
        end
        if curStep == 526 then
            colorSingMode = false
        end
        if curStep == 592 then
            colorSingMode = true
        end
        if curStep == 655 then
            colorSingMode = false
        end
        if curStep == 720 then
            colorSingMode = true
        end
        if curStep == 1040 then
            colorSingMode = false
            setBlendMode("colorSing", "add")
        end
        if curStep >= 1168 and curStep < 1440 then
            if curStep % 8 == 0 then
                doTweenY("camHUD", "camHUD", (downscroll and 20 or -20), crochet / 1000, "quadOut")
            end
            if curStep % 8 == 4 then
                doTweenY("camHUD", "camHUD", 0, crochet / 1000, "quadIn")
            end
        end
        if curStep == 1440 then
            doTweenY("camHUD", "camHUD", 0, crochet / 1000, "quadIn")
        end
        if curStep == 1504 then
            colorSingMode = true
        end
        if curStep == 1565 then
            colorSingMode = false
        end
        if curStep == 1631 then
            colorSingMode = true
        end
        if curStep == 1693 then
            colorSingMode = false
        end
        if curStep == 1760 then
            colorSingMode = true
        end
        if curStep == 1951 then
            colorSingMode = false
        end
    end
end

function onBeatHit()
    if modchart == true then
        if (curBeat == 292) then
            doTweenX("scroll", "scrollShader", 8, (crochet / 1000) * 4 * 17, "linear");
            cameraFlash("camHUD", "ffffff", 2, true);
            setProperty("cameraSpeed", 1.1);
            setProperty("defaultCamZoom", 0.9);
            if v2 then
                setShaderFloat("colorShader", "saturation", 0.05);
                runHaxeCode([[
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("colorShader").shader)]);
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("colorShader").shader), new ShaderFilter(game.getLuaObject("scrollShader").shader)]);
]]);
            else
                runHaxeCode([[
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("scrollShader").shader)]);
]]);
            end
        end
        if (curBeat == 360) then
            if v2 then
                runHaxeCode([[
    game.camGame.setFilters([new ShaderFilter(game.getLuaObject("colorShader").shader)]);
    game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("colorShader").shader)]);
 ]]);
            end
        end
    end
end

local dirName = {"left", "down", "up", "right"}
function goodNoteHit(id, dir)
    if colorSingMode then
        loadGraphic("colorSing", "light/" .. dirName[dir + 1])
        setProperty("colorSing.alpha", 1)
        doTweenAlpha("colorSingfade", "colorSing", 0, 1 / pbr)
    end
    if not colorSingMode then
        setProperty("colorSing.alpha", 0)
        doTweenAlpha("colorSingfade", "colorSing", 0, 1 / pbr)
    end
end
