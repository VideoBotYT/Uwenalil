function onCreatePost()
    setProperty("dad.healthIcon", "uwenalil")
    setProperty("boyfriend.healthIcon", "pixelated")
    runHaxeCode([[
        game.iconP2.changeIcon("icon-uwenalil");
        game.iconP1.changeIcon("icon-pixelated");
      ]])

    setHealthBarColors("00ff00", "ffc400")

    membersSprites = getProperty("membersSprites")
end

pbr = 1
function onStepHit()
    if curStep == 270 then
        setGlobalFromScript("stages/NothingDStage", "disableDadTextRemove", true)
        setGlobalFromScript("stages/NothingDStage", "disableDadTextTyping", true)
    end
    if curStep == 272 then
        setTextString("opponentText", "let me break the 4th wall rq")
    end
    if curStep == 336 then
        setTextString("opponentText", "so i was gonna add modcharts but uhh")
    end
    if curStep == 367 then
        setTextString("opponentText", ".")
    end
    if curStep == 377 then
        setTextString("opponentText", "..")
    end
    if curStep == 387 then
        setTextString("opponentText", "...")
    end
    if curStep == 390 then
        if modchart == true then
            setTextString("opponentText", "here it is :p")
        end
        if modchart == false then
            setTextString("opponentText", "im lazy :p")
        end
    end
    if curStep == 399 then
        setGlobalFromScript("stages/NothingDStage", "disableDadTextRemove", false)
        setGlobalFromScript("stages/NothingDStage", "disableDadTextTyping", false)
    end
    if curStep == 1102 then
        setGlobalFromScript("stages/NothingDStage", "disableDadTextRemove", true)
        setGlobalFromScript("stages/NothingDStage", "disableDadTextTyping", true)
    end
    if curStep == 1104 then
        setTextString("opponentText", "this is boring")
    end
    if curStep == 1136 then
        setTextString("opponentText", "...")
    end
    if curStep == 1139 then
        setGlobalFromScript("stages/NothingDStage", "disableDadTextRemove", false)
        setGlobalFromScript("stages/NothingDStage", "disableDadTextTyping", false)
    end
    -- light mode and dark mode
    -- light mode
    if curStep == 272 then
        callScript("stages/NothingDStage", "lightingMode", {true})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- dark mode
    if curStep == 784 then
        callScript("stages/NothingDStage", "lightingMode", {false})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- light mode
    if curStep == 912 then
        callScript("stages/NothingDStage", "lightingMode", {true})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- dark mode
    if curStep == 1040 then
        callScript("stages/NothingDStage", "lightingMode", {false})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- light mode
    if curStep == 1440 then
        callScript("stages/NothingDStage", "lightingMode", {true})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- dark mode
    if curStep == 1696 then -- no way 69?!?!?
        callScript("stages/NothingDStage", "lightingMode", {false})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- light mode
    if curStep == 1824 then
        callScript("stages/NothingDStage", "lightingMode", {true})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- dark mode
    if curStep == 1888 then
        callScript("stages/NothingDStage", "lightingMode", {false})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- light mode
    if curStep == 1952 then
        callScript("stages/NothingDStage", "lightingMode", {true})
        cameraFlash("camOther", "FFFFFF", 1 / pbr, false)

        setProperty("defaultCamZoom", 0.9)

        setBlendMode("colorSing", "normal")
    end
    -- Hides health bar and icon
    if curStep == 288 then
        setProperty('healthBar.alpha', 0)
    end

    if curStep == 304 then
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
    end
end

-- die if no fc
-- if you delete this, you are bad :p
local allowedmisses = 0

-- function noteMiss()
--  if misses > allowedmisses then
--    setProperty('health', 0)
--  end
-- end

-- Middle scroll
-- code from vs imposter v4 defeat :o
local positioned = nil

function onCountdownTick(count)
    if count >= 0 and positioned == nil then
        positioned = false
    end
end

-- cutscene at end of song
function onEndSong()
    if not allowEnd and isStoryMode then
        startVideo('secretsong');
        allowEnd = true;
        return Function_Stop;
    end
    return Function_Continue;
end
