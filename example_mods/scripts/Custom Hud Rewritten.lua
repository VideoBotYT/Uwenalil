local Nps = 0
local NoteHit = false;
function onStepHit()
    if NoteHit == true then
        Nps = Nps - 2 * 4 -- math is funny
    end
end

local Hudtype = 'uwenhud'

function onCreatePost()
    if Hudtype == 'uwenhud' then
        setProperty('scoreTxt.visible', false)
        setProperty('timeBarBG.visible', false)
        setProperty('timeBar.visible', false)
        setProperty('timeTxt.visible', false)

        makeLuaText('score', 'Score: 0', 0, 10, 620)
        setTextSize('score', 21)
        addLuaText('score')

        makeLuaText('miss', 'Misses: 0', 0, 10, 640)
        setTextSize('miss', 21)
        addLuaText('miss')

        makeLuaText('acc', 'Accuracy: 0%', 0, 10, 660)
        setTextSize('acc', 21)
        addLuaText('acc')

        makeLuaText('rating', 'Rating: N/A', 0, 10, 680)
        setTextSize('rating', 21)
        addLuaText('rating')

        if songName == 'nothing' then
            makeLuaText('miss', '...?', 0, 10, 620)
            setTextSize('miss', 21)
            addLuaText('miss')

            makeLuaText('score', 'Score: 0', 0, 10, 640)
            setTextSize('score', 21)
            addLuaText('score')
        end
    end
end

function onRecalculateRating()
    setTextString('score', 'Score: ' .. score)
    setTextString('miss', 'Misses: ' .. misses)
    setTextString('acc', 'Accuracy: ' .. round(rating * 100, 2) .. '%')
    setTextString('rating', 'Rating: (' .. ratingFC .. ') ' .. ratingName)
end

function round(x, n) -- https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then
        x = math.floor(x + 0.5)
    else
        x = math.ceil(x - 0.5)
    end
    return x / n
end
