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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapMe.transform = CGAffineTransformMakeRotation(0.3)
        tapMe.hidden = true
        
        let oneInTenChance = Int(arc4random_uniform(9))
        print(oneInTenChance)
        if oneInTenChance == 2 {
            tapMe.hidden = false
            
        }
        
}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func logoIsPressed(sender: UIButton) {
        
        if let logoInfoController = storyboard!.instantiateViewControllerWithIdentifier("LogoInfoController") as? LogoInfoController {
            logoInfoController.transitioningDelegate = logoInfoController
            presentViewController(logoInfoController, animated: true, completion: nil)
            
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


