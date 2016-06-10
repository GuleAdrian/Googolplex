//
//  PresentFadeAnimator.swift
//  Googolplex
//
//  Created by Adrian Evensen on 08/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class PresentFadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.2
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		
        let containerView = transitionContext.containerView()!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
		toView.alpha = 0
        containerView.addSubview(toView)
		
		UIView.animateWithDuration(duration, delay: 0.0, options: [.CurveEaseInOut], animations: {
			
			toView.alpha = 1
			
			}, completion: {_ in
				transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
		})
		
    }
    
    
}
