//
//  BlowUpAnimator.swift
//  ImageTest
//
//  Created by Yiyi Liu on 2017/8/22.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class BlowUpAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: .from)
        let toViewController = transitionContext.viewController(forKey: .to)
        let containerView = transitionContext.containerView
        
        
    }
}
