//
//  DismissFadeAnimator.swift
//  Googolplex
//
//  Created by Adrian Evensen on 08/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class DismissFadeAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    let duration = 0.2
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        containerView.insertSubview(toView, belowSubview: fromView)
        
        UIView.animateWithDuration(duration, delay: 0.0, options: [], animations: {
            
           fromView.alpha = 0
            
            }, completion: { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
       
       }
}
