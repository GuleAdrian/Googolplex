//
//  SlideFromLeftAnimator.swift
//  Googolplex
//
//  Created by Adrian Evensen on 08/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class SlideFromLeftAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.2
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
       toView.center.x = -containerView.frame.size.width*0.5
       toView.center.y = containerView.center.y
        
        containerView.addSubview(toView)
        
        UIView.animateWithDuration(duration, delay: 0.0, options: [], animations: {
            
            fromView.center.x += containerView.frame.size.width
            toView.center = containerView.center
            
            
            
            
            }, completion: {_ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        })
        
    }
}
