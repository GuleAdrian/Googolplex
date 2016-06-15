//
//  LogoInfoController.swift
//  Googolplex
//
//  Created by Adrian Evensen on 08/06/16.
//  Copyright © 2016 Adrian. All rights reserved.
//

import UIKit

class LogoInfoController: UIViewController {

    var highlightedImage: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        blurBackgroundShowLogoInfo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

        func blurBackgroundShowLogoInfo() {
        // Blur Effect
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.center = view.center
        blurEffectView.alpha = 1.0
        view.addSubview(blurEffectView)
        

        let infoImage = UIImage(named: "GoogolplexGalaxyV2")
        highlightedImage = UIImageView(image: infoImage)
        highlightedImage?.frame = self.view.bounds
            
        self.view.addSubview(highlightedImage!)
        self.view.bringSubviewToFront(highlightedImage!)
       
    }
    
    
    @IBAction func logoInfoHomescreenWasTapped(sender: UITapGestureRecognizer) {
        
        presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        removeFromParentViewController()
    }
}






extension LogoInfoController: UIViewControllerTransitioningDelegate {
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissFadeAnimator()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentFadeAnimator()
    }
}


