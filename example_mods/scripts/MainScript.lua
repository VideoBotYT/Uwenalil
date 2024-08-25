-- Health Drain
function opponentNoteHit()
    if modchart == false then
        health = getProperty('health')
        if getProperty('health') > 0.05 then
            setProperty('health', health - 0.02);
        end
    end
end

-- Combo loss thing
function noteMiss()
    makeLuaText('comboloss', 'Combo loss!', 800, 530, 350)
    setTextSize('comboloss', 35)
    setTextAlignment('comboloss', 'alignment' == 'center');
    addLuaText('comboloss')
    runTimer('timer', 2, 1)
    onTimerCompleted('timer', 1, 0)
end

function onTimerCompleted(tag, loops, loopsLeft)
    doTweenAlpha('cldissapear', 'comboloss', 0, 2, 'linear')
end

function onCreatePost()
    -- Hides Rating and combo
    setProperty('showRating', false);
    setProperty('showComboNum', false);

    -- Moves health bar and icon
    -- setProperty('healthBar.y', getProperty('scoreTxt.y') + 500)
    setProperty('healthBar.x', getProperty('scoreTxt.x') + 200)
end
