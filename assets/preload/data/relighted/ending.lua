local allowEnd = false

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onEndSong() if not allowEnd and isStoryMode and not seenCutscene then
  runTimer('done','1.5');
  makeLuaSprite('black','black',0,0)
  setObjectCamera('black','hud')
  setObjectCamera('end','other')
  makeAnimatedLuaSprite('gaster3','xgasterdefeat',280,-30)
  scaleObject('gaster3',0.8,0.8)
  addAnimationByPrefix('gaster3','start','xgaster defeat start',24,false)
  addAnimationByPrefix('gaster3','idle','xgaster defeat idle',24,true)
  objectPlayAnimation('gaster3','start',false)
  setObjectCamera('gaster3','other')
  setProperty('healthBar.visible',false)
  setProperty('healthBarBG.visible',false)
  setProperty('iconP1.visible',false)
  setProperty('iconP2.visible',false)
  setProperty('scoreTxt.visible',false)
  setProperty('botplayTxt.visible',false)
  addLuaSprite('black',true)
  addLuaSprite('gaster3',true)
  allowEnd = true; return Function_Stop; end return Function_Continue; end
function onTimerCompleted(tag)
  if tag == 'done' then
    setProperty('inCutscene',true)
    startDialogue('endDialogue')
    objectPlayAnimation('gaster3','idle',true)
  end
  if tag == 'endDialogue' then
    setProperty('inCutscene',false)
    endSong()
    end
end