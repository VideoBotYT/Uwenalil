function onCreatePost()
    -- icon
    setProperty("dad.healthIcon", "pixelated")
    setProperty("boyfriend.healthIcon", "annoyer")
    runHaxeCode([[
        game.iconP2.changeIcon("icon-pixelated");
        game.iconP1.changeIcon("icon-annoyer");
      ]])
      
    setHealthBarColors("FFE99F", "ffc400")

    membersSprites = getProperty("membersSprites")
end

pbr = 1
function onStepHit()
  -- light and dark mode and camera flash
  --light mode
  if curStep == 192 then 
    callScript("stages/discordStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 288 then 
    callScript("stages/discordStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
    --light mode
  if curStep == 416 then 
    callScript("stages/discordStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 608 then 
    callScript("stages/discordStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --fade black at the end of the song :p
  if curStep == 804 then 
    doTweenAlpha("fadeBlack", "blackFade", 1, 0.5/pbr, "linear")
  end
end