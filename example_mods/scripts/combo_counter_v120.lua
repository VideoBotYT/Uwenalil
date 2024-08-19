-- COMBO COUNTER PLUS V1.2.0
-- by SilverSpringing

-- Please, PLEASE credit me if you intend on using this for a mod.
-- You wouldn't like it if I didn't credit you for something you made, right? It's only fair.

-- PhantomMuff font by Cracsthor on Gamebanana: https://gamebanana.com/tools/7763
-- Psych Engine by Shadow Mario: https://github.com/ShadowMario/FNF-PsychEngine

--- CUSTOMIZATION ----------------------------------------------------------------------------

--Combo Counter Plus Text
text_size = 42
border_thickness = 3

-- Colored Text
colored_text = "Week Themes"
-- Changes the color of the rating text.
-- Setting this value to "Kade Engine" changes the color of each rating to look like the Kade Engine score popups.
-- Setting this value to "Week Themes" changes the color of each rating depending on the week you're on.
-- Setting this value to anything else will set the color of the text to white.

-- Unqiue Rating Animations
unique_rating_animations = false
-- If set to true, each rating will have its own unique animation that plays when it pops up.

--- ACTUAL CODE ------------------------------------------------------------------------------ 

ratingColor = "FFFFFF"

weekThemes = {
	{"86BCFF", "91C53C", "C7463F", "919191"}, -- Week Discord
	{"86BCFF", "91C53C", "C7463F", "919191"}, -- Week Nothing?
	{"86BCFF", "91C53C", "C7463F", "919191"}, -- Week FantaMadeOfGlass
}
function onCreate()
	setPropertyFromClass('backend.ClientPrefs', 'data.comboOffset[0]', 9999)
	setProperty('showComboNum', false)
end

function onCreatePost()

	comboTextY = getProperty('botplayTxt.y')
	
	if botPlay then
		if downscroll then
			comboTextY = getProperty('scoreTxt.y') + 50
		else
			if middlescroll then
				comboTextY = getProperty('botplayTxt.y') + 120
			else
				comboTextY = getProperty('botplayTxt.y') + 60
			end
		end
	else
		if downscroll then
			comboTextY = getProperty('scoreTxt.y') + 50
		else
			if middlescroll then
				comboTextY = getProperty('botplayTxt.y') - 120
			else
				comboTextY = getProperty('botplayTxt.y')
			end
		end
	end
	setProperty('comboSpr.visible', false)
	
	makeLuaText('comboTxt', '', 400, getProperty('scoreTxt.x'), comboTextY)
	setTextSize('comboTxt', text_size)
	setTextBorder('comboTxt', border_thickness, '000000')
	setTextAlignment('comboTxt', 'center')
	addLuaText('comboTxt')
	screenCenter('comboTxt', 'x')
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	
	local rawNoteRating = getPropertyFromGroup('notes', id, 'rating')
	local noteRating = rawNoteRating
	
	if not isSustainNote then
		--SICK
		if rawNoteRating == 'sick' then
			noteRating = "Sick!!"
			
			if colored_text == "Kade Engine" then
				ratingColor = "ABFFFF"
			elseif colored_text == "Week Themes" then
				ratingColor = weekThemes[weekRaw][1]
			end
		--GOOD
		elseif rawNoteRating == 'good' then
			noteRating = "Good!"
			
			if colored_text == "Kade Engine" then
				ratingColor = "A4FFAB"
			elseif colored_text == "Week Themes" then
				ratingColor = weekThemes[weekRaw][2]
			end
				
		--BAD
		elseif rawNoteRating == 'bad' then
			noteRating = "Bad"

			if colored_text == "Kade Engine" then
				ratingColor = "CC7484"
			elseif colored_text == "Week Themes" then
				ratingColor = weekThemes[weekRaw][3]
			end
			
		--SHIT
		elseif rawNoteRating == 'shit' then
			noteRating = "Shit"

			if colored_text == "Kade Engine" then
				ratingColor = "A9263F"
			elseif colored_text == "Week Themes" then
				ratingColor = weekThemes[weekRaw][4]
			end
		end
	end
	
	if not isSustainNote then
		--cancel tweens
		cancelTween('comboTxtAlphaTween')
		cancelTween('ratingScaleTweenAngle')
		cancelTween('ratingScaleTweenX')
		cancelTween('ratingPosTweenY')
		cancelTween('ratingScaleTweenY')
		-- reset all properties
		setProperty('comboTxt.y', comboTextY)
		setProperty('comboTxt.alpha', 1)
		setProperty('comboTxt.angle', 0)
		setProperty('comboTxt.scale.x', 1)
		setProperty('comboTxt.scale.y', 1)	
		-- set string
		setTextString('comboTxt', noteRating .. "\n" .. getProperty('combo'))
		setTextColor('comboTxt', ratingColor)

		if unique_rating_animations or noteType == 'Unique Animation Trigger (CC+)' then
			--SICK ANIMATION
			if noteRating == "Sick!!" then
				setProperty('comboTxt.angle', -5)
				setProperty('comboTxt.scale.x', 1.8)
				setProperty('comboTxt.scale.y', 1.8)	
				doTweenX('ratingScaleTweenX', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenY('ratingScaleTweenY', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenAngle('ratingScaleTweenAngle', 'comboTxt', 5, 0.7, 'linear')
			--GOOD ANIMATION
			elseif noteRating == "Good!" then
				setProperty('comboTxt.scale.x', 1.6)
				setProperty('comboTxt.scale.y', 1.6)	
				doTweenX('ratingScaleTweenX', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenY('ratingScaleTweenY', 'comboTxt.scale', 1, 0.7, 'expoOut');
			--BAD ANIMATION
			elseif noteRating == "Bad" then
				setProperty('comboTxt.scale.x', 1.3)
				setProperty('comboTxt.scale.y', 1.3)	
				doTweenX('ratingScaleTweenX', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenY('ratingScaleTweenY', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenAngle('ratingScaleTweenAngle', 'comboTxt', -10, 0.7, 'linear')
			--SHIT ANIMATION
			elseif noteRating == "Shit" then
				setProperty('comboTxt.scale.x', 1.0)
				setProperty('comboTxt.scale.y', 1.0)	
				doTweenX('ratingScaleTweenX', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenY('ratingScaleTweenY', 'comboTxt.scale', 1, 0.7, 'expoOut');
				doTweenY('ratingPosTweenY', 'comboTxt', comboTextY + 25, 0.7, 'linear');
				doTweenAngle('ratingScaleTweenAngle', 'comboTxt', -20, 0.7, 'linear')
			end
		else
			setProperty('comboTxt.scale.x', 1.6)
			setProperty('comboTxt.scale.y', 1.6)	
			doTweenX('scaleTweenX', 'comboTxt.scale', 1, 0.7, 'expoOut');
			doTweenY('scaleTweenY', 'comboTxt.scale', 1, 0.7, 'expoOut');
		end	
		doTweenAlpha('comboTxtAlphaTween', 'comboTxt', 0, 0.5, 'linear')
	end
end

function onTweenCompleted(tag)
	if tag == 'comboTxtAlphaTween' then
		comboTxt.alpha = 0
	end
end