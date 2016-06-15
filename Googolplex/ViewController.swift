//
//  ViewController.swift
//  Googolplex
//
//  Created by Adrian Evensen on 07/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tapMe: UILabel!
    @IBOutlet weak var blackOrWhiteSwitchOutlet: UISwitch!
    
    @IBOutlet weak var visualEffectView: UIVisualEffectView!
    @IBOutlet weak var visualEffectView2: UIVisualEffectView!
    @IBOutlet weak var logoInfoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapMe.transform = CGAffineTransformMakeRotation(0.3)
        tapMe.hidden = true
        
        let oneInTenChance = Int(arc4random_uniform(9))
        print(oneInTenChance)
        if oneInTenChance == 2 {
            tapMe.hidden = true
            
    }
        
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func logoIsPressed(sender: UIButton) {
        
        visualEffectView.hidden = false

        let presentAnimation = CABasicAnimation(keyPath: "opacity")
        presentAnimation.duration = 0.2
        presentAnimation.fromValue = 0
        presentAnimation.toValue = 1
        
        visualEffectView.layer.addAnimation(presentAnimation, forKey: "opacity")
        
        
       /* if let logoInfoController = storyboard!.instantiateViewControllerWithIdentifier("LogoInfoController") as? LogoInfoController {
            logoInfoController.transitioningDelegate = logoInfoController
            presentViewController(logoInfoController, animated: true, completion: nil)
        }*/
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    @IBAction func visualEffectViewTapped(sender: UITapGestureRecognizer) {
        
        let dismissAnimation = CABasicAnimation(keyPath: "opacity")
        dismissAnimation.duration = 0.2
        dismissAnimation.fromValue = 1
        dismissAnimation.toValue = 0

        logoInfoImageView.layer.addAnimation(dismissAnimation, forKey: "opacity")
        visualEffectView2.layer.addAnimation(dismissAnimation, forKey: "opacity")
        visualEffectView.layer.addAnimation(dismissAnimation, forKey: "opacity")
        
        delay(0.17) {
            self.visualEffectView.hidden = true
        }

    }
    
    
    @IBAction func homescreenSwipeRight(sender: UISwipeGestureRecognizer) {
       if let prestigeGameModeController = storyboard!.instantiateViewControllerWithIdentifier("PrestigeGameModeController") as? PrestigeGameModeController {
            prestigeGameModeController.transitioningDelegate = self
            presentViewController(prestigeGameModeController, animated: true, completion: nil)
        }
    }
    
       
    @IBAction func homescreenSwitchValueChange(sender: AnyObject) {
    
        
        if blackOrWhiteSwitchOutlet.on  {
            /*
            Red:    30
            Green:  32
            Blue:   40
            */
            
            self.view.backgroundColor = UIColor(red:0.12, green:0.13, blue:0.16, alpha:1.0)
            
        } else {
            
            self.view.backgroundColor = UIColor.whiteColor()
            
        }
        
    }
    
   



}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideFromRightAnimator()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return SlideFromLeftAnimator()
    }
}


