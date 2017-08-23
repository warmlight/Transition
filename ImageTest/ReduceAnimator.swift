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
    
    var clipsView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.clipsToBounds = true
        return view
    }()
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let containerView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)
        
        clipsView.frame = transitionContext.finalFrame(for: fromViewController!)
        fromView?.frame = transitionContext.finalFrame(for: fromViewController!)
        
        clipsView.addSubview(fromView!)
        containerView.addSubview(clipsView)

        let transitionDuration = self.transitionDuration(using: transitionContext)

        UIView.animate(withDuration: transitionDuration, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0, options: .curveLinear, animations: {
            self.clipsView.frame = self.fromRect
            fromView?.frame = CGRect(x: -(UIScreen.main.bounds.width - self.fromRect.width) / 2, y: 0, width: UIScreen.main.bounds.width, height: self.fromRect.height)
        }) { (finished: Bool) in
            transitionContext.completeTransition(true)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "HiddenCell"), object: nil)
        }
    }
}
