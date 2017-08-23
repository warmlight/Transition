//
//  TestCollectionViewCell.swift
//  ImageTest
//
//  Created by liuyiyi on 2017/8/23.
//  Copyright © 2017年 Yiyi Liu. All rights reserved.
//

import UIKit

class TestCollectionViewCell: UICollectionViewCell {
    fileprivate let image = UIImageView()
    fileprivate let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TestCollectionViewCell {
    fileprivate func setup() {
        self.backgroundColor = .blue
        self.addSubviews()
        self.setupImage()
        self.setupLabel()
    }
    
    private func addSubviews() {
        addSubview(image)
        addSubview(label)
    }
    
    private func setupImage() {
        image.image = UIImage.init(named: "737c2fe45cd0e2a1afbee54daef39895")
        image.frame = CGRect(x: -(UIScreen.main.bounds.width - 300) / 2, y: 0, width: UIScreen.main.bounds.width, height: 300)
        self.clipsToBounds = true
        self.backgroundColor = .green
    }
    
    private func setupLabel() {
        label.frame = CGRect(x: 15, y: 50, width: 200, height: 30)
        label.font = .systemFont(ofSize: 30)
        label.textColor = .white
        label.text = "New Merge "
    }
}
