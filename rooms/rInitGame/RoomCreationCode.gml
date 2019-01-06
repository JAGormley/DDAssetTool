//randomise() // comment to debug random gen- related issues

///// Constructor arg placeholders ///
//global.argZero = noone
//global.argOne = noone
//global.argTwo = noone
//global.argThree = noone
//global.argFour = noone
//global.argFive = noone

//// grids
//global.charGrid = noone
//global.spawnGrid = noone

//////////////
//// CONFIG //
//////////////

//global.wc = wc.totalGems // win condition
//draw_set_font(fJustice) // global font

//// default global properties
//global.numPlayers = 0 // this gets overridden by oCharSelect, kinda weird
//global.playerDepth = 300
//global.currentVolume = 0 // NORMAL FLOAT!
//audio_master_gain(global.currentVolume)
////global.prefinalCountdown = 10800
//global.prefinalCountdown = 100800
//global.finalCountdown = 3600
//global.upgrMeteorDelay = 420 // the time between announce and create


//// def game settings
//global.totalBattles = 4
//global.fullMetre = 24
//global.killsToWin = 10
//global.gemsToWin = 1 // @TODO: this is coupled to hud currently
//global.totalLives = 10
//global.spawnTime = 150
//global.boxSpawnPollTime = 15
//global.gemsPerLevel = 3
//global.gemDropRate = 0 // %odds
//global.heartDropRate = 0
//global.powDropRate = 35
//global.deathGemPenalty = 0
//global.boxes = true
//global.preLvlThresh = 2
//global.geodeSpawnTime = 50
//global.meteorNumber = 0 // this also gets overridden by oCharSelect, also kinda weird
//global.respawnInvulTime = 150
//global.gemCollectInvulTime = 100
//global.meteorFlightTime = 100

//// effects 
//global.effectFadeTime = 20
//global.enableLighting = true
//global.enableFluid = true

//// general mechanics
//global.fallGrace = 2 // number of character pixels allowed to be over edge and not trigger preFall
//global.wallStickiness = 0 // pixels/2 of "dead space" on a wall block wrt triggering rotation around it
//global.airIsWall = true
//global.suppressionVel = .5
//global.defPushedDur = 20
//global.bombKickPause = 12
//global.parryTime = 5
//global.parryEnabled = true
//global.stunRecoveryTime = 25
//global.suppresedTimer = 45
//global.stunnedTimer = 80
//global.trappedTimer = 150
//global.slimeSpeed = 0.5 // on slime
//global.boostSpeedMult = 1.5
//global.boostMetreSpeed = .02 // cost

////////////
//// LOAD //
////////////

//// Scripts per state
//var statesToScripts = ds_map_create()
//ds_map_add(statesToScripts, states.idle, scIdle)
//ds_map_add(statesToScripts, states.walking, scWalking)
//ds_map_add(statesToScripts, states.dashing, scDashing)
//ds_map_add(statesToScripts, states.preDashing, scPreDashing)
//ds_map_add(statesToScripts, states.primaryAction, scPrimaryAction)
//ds_map_add(statesToScripts, states.secondaryAction, scSecondaryAction)
//ds_map_add(statesToScripts, states.dying, scDying)
//ds_map_add(statesToScripts, states.pushed, scPushed)
//ds_map_add(statesToScripts, states.falling, scFalling)
//ds_map_add(statesToScripts, states.preFalling, scPreFalling)
//ds_map_add(statesToScripts, states.flying, scFlying)
//ds_map_add(statesToScripts, states.suppressed, scSuppressed)
//ds_map_add(statesToScripts, states.stunned, scStunned)
//ds_map_add(statesToScripts, states.trapped, scTrapped)
//ds_map_add(statesToScripts, states.paused, scPaused) 

//// char-specific
//ds_map_add(statesToScripts, states.soaring, scSoaring)
//ds_map_add(statesToScripts, states.ascending, scAscending)
//ds_map_add(statesToScripts, states.swooping, scSwooping)
//ds_map_add(statesToScripts, states.plummeting, scPlummeting)
//ds_map_add(statesToScripts, states.bounced, scBounced)
//ds_map_add(statesToScripts, states.laying, scLaying)
//ds_map_add(statesToScripts, states.calling, scCalling)
//ds_map_add(statesToScripts, states.preFlight, scPreFlight)
//ds_map_add(statesToScripts, states.assassinate, scAssassinate)
//ds_map_add(statesToScripts, states.whiffed, scWhiffed)
//ds_map_add(statesToScripts, states.charging, scAcidCharging)
//ds_map_add(statesToScripts, states.swinging, scSwinging)
//ds_map_add(statesToScripts, states.conduit, scConduit)
//ds_map_add(statesToScripts, states.propelled, scPropelled)



//// @TODO use shader palette swapping here
//var playerNumToCoil = ds_map_create()
//playerNumToCoil[?1] = sprCoilP1
//playerNumToCoil[?2] = sprCoilP1
//playerNumToCoil[?3] = sprCoilP1
//playerNumToCoil[?4] = sprCoilP1
//// @TODO use shader palette swapping here
//var playerNumToBody = ds_map_create()
//playerNumToBody[?1] = spBody
//playerNumToBody[?2] = spBody
//playerNumToBody[?3] = spBody
//playerNumToBody[?4] = spBody

//var playerPadCoordinates = ds_map_create()
//playerPadCoordinates[?1] = [56,  40]
//playerPadCoordinates[?2] = [424, 200]
//playerPadCoordinates[?3] = [424, 40]
//playerPadCoordinates[?4] = [56,  200]


//// TODO: this is stupid, ALL the upgrade properties should be tied together in some central place
//var characterAbilities = ds_map_create()
//ds_map_add(characterAbilities, character.ninja, [ability.netgun, ability.decoy, ability.detector])
//ds_map_add(characterAbilities, character.bird, [ability.stunPeck, ability.egg, ability.terrorBird])
//ds_map_add(characterAbilities, character.alien, [ability.creepBomb, ability.acidBlood, ability.neurotoxin])
//ds_map_add(characterAbilities, character.electro, [ability.kickBomb, ability.bombThrow, ability.conduit])

////@TODO: finish this
////var layerNamesMap = ds_map_create()
////ds_map_add(layerNamesMap)
////ds_map_add(layerNamesMap)
////ds_map_add(layerNamesMap)
////ds_map_add(layerNamesMap)
////global.LayerNamesMap = layerNamesMap
////global.load32button
//global.CharacterAbilityMap = characterAbilities
//global.PlayerNumToBody = playerNumToBody
//global.PlayerNumToCoil = playerNumToCoil
//global.StatesToScripts = statesToScripts
global.StageTypeToResources = scLoadStageRes()
//global.PlayerPadCoordinates = playerPadCoordinates
//global.gemsPerLevel = 3
//global.gemDropRate = 0 // %odds per box
//global.deathGemPenalty = 0
//global.preLvlThresh = 2
		
//// WHEN NOT USING CHAR SELECT:
////scInitTestPlayers()
//room_goto(rTemplate)
		
room_goto(rTemplate)