/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */


#import "ccMacros.h"
#import "CCParticleSystemQuad.h"

<<<<<<< HEAD
// build each architecture with the optimal particle system

// ARMv7, Mac or Simulator use "Quad" particle
#if defined(__ARM_NEON__) || defined(__CC_PLATFORM_MAC) || TARGET_IPHONE_SIMULATOR
	#define ARCH_OPTIMAL_PARTICLE_SYSTEM CCParticleSystemQuad

// ARMv6 use "Point" particle
#elif __arm__
	#define ARCH_OPTIMAL_PARTICLE_SYSTEM CCParticleSystemPoint
#else
	#error(unknown architecture)
#endif


//! A fire particle system
@interface CCParticleFire: ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! A fireworks particle system
@interface CCParticleFireworks : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! A sun particle system
@interface CCParticleSun : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! A galaxy particle system
@interface CCParticleGalaxy : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! A flower particle system
@interface CCParticleFlower : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! A meteor particle system
@interface CCParticleMeteor : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! An spiral particle system
@interface CCParticleSpiral : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! An explosion particle system
@interface CCParticleExplosion : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! An smoke particle system
@interface CCParticleSmoke : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! An snow particle system
@interface CCParticleSnow : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
@end

//! A rain particle system
@interface CCParticleRain : ARCH_OPTIMAL_PARTICLE_SYSTEM
{
}
=======
//! A fire particle system
@interface CCParticleFire: CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! A fireworks particle system
@interface CCParticleFireworks : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! A sun particle system
@interface CCParticleSun : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! A galaxy particle system
@interface CCParticleGalaxy : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! A flower particle system
@interface CCParticleFlower : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! A meteor particle system
@interface CCParticleMeteor : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! An spiral particle system
@interface CCParticleSpiral : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! An explosion particle system
@interface CCParticleExplosion : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! An smoke particle system
@interface CCParticleSmoke : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! An snow particle system
@interface CCParticleSnow : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
@end

//! A rain particle system
@interface CCParticleRain : CCParticleSystemQuad
{
}
// needed for BridgeSupport
-(id) init;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end
