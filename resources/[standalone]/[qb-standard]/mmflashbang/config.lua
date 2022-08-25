Config = {
	WeaponLabel = "Flashbang",
	ExplodeTime = 2500,             			-- msec
	
	ExplosionEffectVisibilityRange = 50.0,

	CanCutOutMumble = true,
	MumbleCutOutDuration = 20000, 				-- msec

	WeakEffectDuration = 10000,					-- msec
	FlashEffectDuration = 30000,				-- msec
	WeakEffectSoundDuration = 19000,			-- msec
	FlashEffectWhiteScreenDuration = 5000, 		-- msec
	FlashEffectWhiteScreenFadeOutTempo = 1.0,
	AfterExplosionCameraReturnDuration = 3000, 	-- msec

	WeakEffectSoundVolume = 0.8,
	FlashEffectSoundVolume = 1.2,

	UpdateEffectVolumeOnWeakEffect = true,

	WeakEffectRange = { farthest = 6.0, nearest = 4.0 },
	FlashEffectBehindPlayerRange = 6.0,
	FlashEffectInFrontOfPlayerRange = 4.0,
	PedAnimationOnEffect = true,
	MakePlayerUnarmedOnEffect = true,
	DisablePlayerFiringOnEffect = true,
	RagdollOnEffect = true
}