//
//  BlowUpAnimator.swift
//  ImageTest
//
//  Created by Yiyi Liu on 2017/8/22.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class BlowUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    var fromRect = CGRect()
    
    var clipsView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.7
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        let toView = transitionContext.view(forKey: .to)
        
        self.clipsView.frame = fromRect
        toView?.frame = CGRect(x: -(UIScreen.main.bounds.width - fromRect.width) / 2, y: 0, width: UIScreen.main.bounds.width, height: fromRect.height)
        
        clipsView.addSubview(toView!)
        containerView.addSubview(clipsView)
        
        let transitionDuration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            self.clipsView.frame = transitionContext.finalFrame(for: toViewController!)
            toView?.frame = transitionContext.finalFrame(for: toViewController!)
            
        }) { (finished: Bool) in
            transitionContext.completeTransition(true)
        }
    }
    
}
