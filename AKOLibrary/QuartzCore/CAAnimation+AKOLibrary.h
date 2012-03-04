//
//  CAAnimation+AKOLibrary.h
//  AKOLibrary
//
//  Created by Adrian on 4/15/11.
//  Copyright (c) 2009, 2010, 2011, Adrian Kosmaczewski & akosma software
//  All rights reserved.
//  
//  Use in source and/or binary forms without modification is permitted following the
//  instructions in the LICENSE file.
//  
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
//  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
//  IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
//  INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, 
//  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
//  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF 
//  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
//  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED 
//  OF THE POSSIBILITY OF SUCH DAMAGE.
//

/**
 @file CAAnimation+AKOLibrary.h
 Includes extensions for the CAAnimation class.
 */

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>


/**
 Extensions for the CAAnimation class.
 */
@interface CAAnimation (AKOLibrary)

/**
 Creates a pulsating animation with a specified duration.
 A pulsating animation creates the effect of a pulsating object, which 
 grows and shrinks continuously. This animation repeats forever.
 @param duration The time in seconds for the whole animation.
 @return An instance of CAAnimation.
 */
+ (CAAnimation *)ako_pulsatingAnimationWithDuration:(CFTimeInterval)duration;

/**
 Creates an animation that changes opacity and size of a view.
 This animation does not repeat forever, and when it's finished, it's
 automatically removed from the view where it has been applied.
 @param duration The time in seconds for the whole animation.
 @return An instance of CAAnimation.
 */
+ (CAAnimation *)ako_opacityAndTranformAnimationWithDuration:(CFTimeInterval)duration;

@end
