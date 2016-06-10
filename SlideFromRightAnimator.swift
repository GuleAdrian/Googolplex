//
//  SlideFromRightAnimator.swift
//  Googolplex
//
//  Created by Adrian Evensen on 09/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class SlideFromRightAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.2
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        containerView.addSubview(toView)
        
        UIView.animateWithDuration(duration, delay: 0.0, options: [], animations: {
            
            fromView.center.x += -containerView.frame.size.width
            toView.center.x += -containerView.frame.size.width
            
            }, completion: {_ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
    }
}