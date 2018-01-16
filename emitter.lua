--
-- For more information on emitter properties, see the EmitterObject documentation at:
-- https://docs.coronalabs.com/api/type/EmitterObject/index.html
--

local emitterParams = {

	-- General emitter properties
	textureFileName = "particle.png",
	maxParticles = 100,
	angleVariance = 20,
	duration = -1,
	speedVariance = 10,

	maxRadiusVariance = 25.00,
	-- General particle properties
	particleLifespan = 1.8,
	particleLifespanVariance = 0,
	startParticleSize = 25,
	startParticleSizeVariance = 5,
	finishParticleSize = 5,
	finishParticleSizeVariance = 10,
	rotationStart = 0,
	rotationStartVariance = 0,
	rotationEnd = 0,
	rotationEndVariance = 0,
	
	-- Color/alpha particle properties
	startColorRed = 0.8,
	startColorGreen = 0.2,
	startColorBlue = 0.1,
	startColorAlpha = 0.8,
	startColorVarianceRed = 0,
	startColorVarianceGreen = 0,
	startColorVarianceBlue = 0,
	startColorVarianceAlpha = 0,
	finishColorRed = 0.8,
	finishColorGreen = 0.2,
	finishColorBlue = 0.1,
	finishColorAlpha = 0,
	finishColorVarianceRed = 0,
	finishColorVarianceGreen = 0,
	finishColorVarianceBlue = 0,
	finishColorVarianceAlpha = 0,
	
	-- Blend mode properties
	blendFuncSource = 770,
	blendFuncDestination = 1,

}

return emitterParams
