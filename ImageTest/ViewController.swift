//
//  ViewController.swift
//  ImageTest
//
//  Created by Yiyi Liu on 2017/8/20.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {
    
    fileprivate var collectionView:UICollectionView?
    fileprivate let targetVC = TargetViewController()
    fileprivate let animator = BlowUpAnimator()
    fileprivate let dismissAnimator = ReduceAnimator()
    fileprivate var selectedCell = TestCollectionViewCell()


    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        targetVC.transitioningDelegate = self
        targetVC.modalPresentationStyle = .custom
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeCellHidden), name: NSNotification.Name(rawValue: "HiddenCell"), object: nil)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    @objc fileprivate func changeCellHidden() {
        if selectedCell.isHidden {
            selectedCell.isHidden = false
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TestCollectionViewCell
        let frame = collectionView.convert(cell.frame, to: self.view)
        
        selectedCell = cell
        selectedCell.isHidden = true
        animator.fromRect = frame
        dismissAnimator.fromRect = frame
        navigationController?.present(targetVC, animated: true, completion: nil)
    }
}

extension ViewController {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return animator
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissAnimator
    }
}

extension ViewController {
    fileprivate func setup() {
        setupCollectionView()
        addSubviews()
    }
    
    private func addSubviews() {
        view.addSubview(collectionView!)
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 50
        layout.itemSize = CGSize(width: 300, height: 300)
        
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.backgroundColor = .red
        collectionView?.register(TestCollectionViewCell.self , forCellWithReuseIdentifier: "cell")
    }
}


