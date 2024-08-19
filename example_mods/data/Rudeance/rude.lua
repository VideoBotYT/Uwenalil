function onCreatePost()
    -- icon
    setProperty("dad.healthIcon", "pixelatedammar")
    setProperty("boyfriend.healthIcon", "uwenalilspooki")
    runHaxeCode([[
        game.iconP2.changeIcon("icon-pixelatedammar");
        game.iconP1.changeIcon("icon-uwenalilspooki");
      ]])
      
    setHealthBarColors("FFE99F", "00FF00")

    membersSprites = getProperty("membersSprites")

    --Flash warning                               length  x    y
    makeLuaText('flashwarning', 'FLASH WARNING!!!', 800, 275, 350)
    setTextColor('flashwarning', 'FF0000')
    setTextSize('flashwarning', 75)
    setTextAlignment('flashwarning', 'alignment' == 'center');
end

pbr = 1
function onStepHit()
  -- light and dark mode and camera flash
  --light mode
  if curStep == 272 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 400 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 656 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 784 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 896 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 899 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 902 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 905 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 912 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 968 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 972 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --Camera flash thing idfk
  if curStep == 976 then 
    cameraFlash("camOther", "FFFFFF", 1/pbr, true)
  end
  --dark mode
  if curStep == 1168 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 1192 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --dark mode
  if curStep == 1224 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)
  
    setBlendMode("colorSing", "normal")
  end
  --light mode
  if curStep == 1256 then 
    callScript("stages/RudeanceDStage", "lightingMode", {true})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end 
  --dark mode
  if curStep == 1312 then 
    callScript("stages/RudeanceDStage", "lightingMode", {false})
    cameraFlash("camOther", "FFFFFF", 1/pbr, false)

    setProperty("defaultCamZoom", 0.9)

    setBlendMode("colorSing", "normal")
  end
  --AAAAAAAAA at the end
  if curStep == 1310 then 
    setTextString("playerText", "")
    setGlobalFromScript("stages/RudeanceDStage", "disableBfTextRemove", true)
    setGlobalFromScript("stages/RudeanceDStage", "disableBfTextTyping", true)
  end
  if curStep >= 1312 and curStep < 1327 then 
    setTextString("playerText", getTextString("playerText")..(getRandomBool(100) and "A"))
  end
  if curStep == 1330 then 
    setTextString("playerText", "Spooki: oops")
  end
  if curStep == 1341 then 
    setTextString("playerText", "uwenalil: what the fu-")
  end
  -- Flash Warning
  if curStep == 1 then
    addLuaText('flashwarning') 
  end
  if curStep == 20 then
    doTweenAlpha('dissapear', 'flashwarning', 0, 2, 'linear')
  end
end