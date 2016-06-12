//
//  PrestigeGameModeController.swift
//  Googolplex
//
//  Created by Adrian Evensen on 08/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class PrestigeGameModeController: UIViewController {

    @IBOutlet weak var challangeTopImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func prestigeSwipeLeft(sender: UISwipeGestureRecognizer) {
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
        /* if let viewController = storyboard!.instantiateViewControllerWithIdentifier("ViewController") as? ViewController {
            viewController.transitioningDelegate = viewController
            
            presentViewController(viewController, animated: true, completion: nil)
        } */
        
    }

    @IBAction func prestigeTapRecognized(sender: UITapGestureRecognizer) {
        
        if let calculator = storyboard!.instantiateViewControllerWithIdentifier("CalculatorController") as? CalculatorController {
            calculator.transitioningDelegate = self
            presentViewController(calculator, animated: true, completion: nil)
        }
        
    }
   
}







extension PrestigeGameModeController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissFadeAnimator()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentFadeAnimator()
    }
}