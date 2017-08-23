//
//  TargetViewController.swift
//  ImageTest
//
//  Created by Yiyi Liu on 2017/8/21.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class TargetViewController: UIViewController {

    fileprivate let image = UIImageView()
    fileprivate let scrollview = UIScrollView()
    fileprivate let contentlabel = UILabel()
    fileprivate let label = UILabel()
    
    override func viewWillAppear(_ animated: Bool) {
        setup()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveLinear, animations: {
            self.label.frame = CGRect(x: 15, y: 15, width: 200, height: 30)

        }) { (finished: Bool) in
        }
    }
    
    override func viewDidLoad() {
        view.clipsToBounds = true
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let dismissGesture = UITapGestureRecognizer(target: self, action: #selector(dismissVC))
        view.addGestureRecognizer(dismissGesture)
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissVC() {
        dismissImageAnimate()
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: Animate
extension TargetViewController {
    private func needMoveImage() -> Bool {
        return scrollview.contentOffset.y > 0
    }
    
    private func moveImage() {
        let targetFrame = CGRect(x: 0, y: scrollview.contentOffset.y, width: image.frame.width, height: image.frame.height)
        if scrollview.contentOffset.y > image.frame.height {
            self.image.frame = CGRect(x: 0, y: scrollview.contentOffset.y - image.frame.height, width: image.frame.width, height: image.frame.height)
        }
        UIView.animate(withDuration: 0.5) {
            self.image.frame = targetFrame
        }
    }
    
    fileprivate func dismissImageAnimate() {
        if needMoveImage() {
            moveImage()
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveLinear, animations: {
            self.label.frame = CGRect(x: (self.view.frame.size.width - 300) / 2 + 15, y: 50, width: 200, height: 30)

        }) { (finished: Bool) in
        }
    }
}

extension TargetViewController {
    fileprivate func setup() {
        addSubviews()
        setupImageView()
        setupScrollView()
        setupContentLabel()
        setupLabel()
    }
    
    private func addSubviews() {
        view.addSubview(scrollview)
        scrollview.addSubview(contentlabel)
        scrollview.addSubview(image)
        image.addSubview(label)
    }
    
    private func setupScrollView() {
        scrollview.contentOffset = .zero
        scrollview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        scrollview.backgroundColor = .white
    }
    
    private func setupImageView() {
        image.image = UIImage(named: "737c2fe45cd0e2a1afbee54daef39895")
        image.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 300)
    }
    
    private func setupLabel() {
        label.frame = CGRect(x: (view.frame.size.width - 300) / 2 + 15, y: 50, width: 200, height: 30)
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.text = "New Merge"
    }
    
    private func setupContentLabel() {
        contentlabel.font = UIFont.systemFont(ofSize: 30)
        contentlabel.numberOfLines = 0
        contentlabel.text = "手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，\n现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，\n并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，\n现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，\n这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它手势过渡管理者就算完毕了，这个手势管理者可以用到其他任何的模态和导航控制器转场中，以后都不用在写了，现在把他用起来，在vc2和vc1中创建相应的手势过渡管理者，并放到相应的代理方法去返回它"
        contentlabel.frame = CGRect(x: 0, y: 300, width: view.frame.width, height: 1000)
        
        self.scrollview.contentSize = CGSize(width: view.frame.width, height: 1300)
    }
}
