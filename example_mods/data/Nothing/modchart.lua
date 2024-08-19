local v0 = false;
local v1 = true;
local v2 = true;
local curAngle = 0;

function onCreatePost()
    startMod('angle', 'ConfusionModifier', '', -1)
    getPropertyFromClass("ClientPrefs", "shaders");
end
function onStepHit()

    if curStep >= 1168 and curStep < 1440 then
        if curStep % 8 == 0 then
            doTweenY("camHUD", "camHUD", (downscroll and 20 or -20), crochet / 1000, "quadOut")
        end
        if curStep % 8 == 4 then
            doTweenY("camHUD", "camHUD", 0, crochet / 1000, "quadIn")
        end
    end
    if curStep == 1420 then
        setMod('angle', 0)
    end
    if curStep == 1440 then
        setProperty("noteKillOffset", 350 / scrollSpeed)
        noteTweenY("noteAngle4", 4, downPosition[downscroll and 2 or 1], crochet / 1000 * 4, "bounceOut")
        for i = 4, 7 do
            noteTweenDirection("noteDir" .. i, i, -90, crochet / 1000 * 4, "bounceOut")
        end
        doTweenY("camHUD", "camHUD", 0, crochet / 1000, "quadIn")
    end
end

function onBeatHit()
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
