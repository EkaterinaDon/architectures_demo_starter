//
//  AppDetailScreenShotsCollectionViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailScreenShotsCollectionViewCell: UICollectionViewCell {
    
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageSetUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func imageSetUp() {
        self.contentView.addSubview(imageView)
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            self.imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            self.imageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            self.imageView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            self.imageView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
            
        ])
    }
}
