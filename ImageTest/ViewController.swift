//
//  ViewController.swift
//  ImageTest
//
//  Created by Yiyi Liu on 2017/8/20.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate var collectionView:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
//        setup()
        
        let image1 = UIImageView()
        image1.image = UIImage(named: "737c2fe45cd0e2a1afbee54daef39895")
        image1.contentMode = .scaleAspectFit
        view.addSubview(image1)
        image1.clipsToBounds = true
        image1.layer.contentsRect = CGRect(x: 00, y: 00, width: 0.8, height: 0.8)
        image1.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
        
        
        let image2 = UIImageView()
        image2.image = UIImage(named: "737c2fe45cd0e2a1afbee54daef39895")
        image2.contentMode = .scaleAspectFit
        view.addSubview(image2)
        image2.clipsToBounds = true
        image2.frame = CGRect(x: 0, y: 100, width: 100, height: 80)
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .green
        return cell
    }

//    //返回自定义的cell
//    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath as IndexPath)
//        return cell
//    }
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
        collectionView?.register(UICollectionViewCell.self , forCellWithReuseIdentifier: "cell")
    }
}


