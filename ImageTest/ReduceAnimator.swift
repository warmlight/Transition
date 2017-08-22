//
//  ReduceAnimator.swift
//  ImageTest
//
//  Created by liuyiyi on 2017/8/22.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class ReduceAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    var fromRect = CGRect()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let containerView = transitionContext.containerView
        
        let fromView = transitionContext.view(forKey: .from)
        containerView.frame = transitionContext.finalFrame(for: fromViewController!)
        fromView?.frame = transitionContext.finalFrame(for: fromViewController!)

        containerView.addSubview(fromView!)

        let transitionDuration = self.transitionDuration(using: transitionContext)

        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveLinear, animations: {
            containerView.frame = self.fromRect
            fromView?.frame = CGRect(x: -(UIScreen.main.bounds.width - self.fromRect.width) / 2, y: 0, width: UIScreen.main.bounds.width, height: self.fromRect.height)

        }) { (finished: Bool) in
            transitionContext.completeTransition(true)
        }
    }
}
