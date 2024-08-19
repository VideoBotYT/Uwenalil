function onCreate()

makeLuaSprite('iconP1obj', 'iconobj', 0, 0)

makeLuaSprite('iconP2obj', 'iconobj', 0, 0)
 
addLuaSprite('iconP1obj')
addLuaSprire('iconP2obj')
 
close(true) 
 
end

function onUpdatePost(elapsed)
setProperty('iconP1.scale.x', getProperty('iconP1obj.scale.x'))
setProperty('iconP2.scale.x', getProperty('iconP2obj.scale.x'))
setProperty('iconP1.scale.y', getProperty('iconP1obj.scale.y'))
setProperty('iconP2.scale.y', getProperty('iconP2obj.scale.y'))
setProperty('iconP1.y', (getProperty('healthBar.y') - 149) - getProperty('iconP1.scale.y') / -0.013)
setProperty('iconP2.y', (getProperty('healthBar.y') - 149) - getProperty('iconP2.scale.y') / -0.013)
end

function onBeatHit()

if curBeat % 2 == 0 then

scaleObject('iconP1obj', 1.1, 0.8)
scaleObject('iconP2obj', 1.1, 1.3)

setProperty('iconP1.angle', -15)
setProperty('iconP2.angle', 15)

else

scaleObject('iconP1obj', 1.1, 1.3)
scaleObject('iconP2obj', 1.1, 0.8)
 
setProperty('iconP1.angle', 15)
setProperty('iconP2.angle', -15)
 
end

doTweenAngle('icon1tween', 'iconP1', 0, crochet / 1300, 'quadOut')
doTweenAngle('icon2tween', 'iconP2', 0, crochet / 1300, 'quadOut')
doTweenX('icon1objx', 'iconP1obj.scale', 1, crochet / 1300, 'quadOut')
doTweenX('icon2objx', 'iconP2obj.scale', 1, crochet / 1300, 'quadOut')
doTweenY('icon1objy', 'iconP1obj.scale', 1, crochet / 1300, 'quadOut')
doTweenY('icon2objy', 'iconP2obj.scale', 1, crochet / 1300, 'quadOut')

end