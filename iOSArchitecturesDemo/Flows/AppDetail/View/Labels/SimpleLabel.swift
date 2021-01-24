//
//  SimpleLabel.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SimpleLabel: UILabel {
    init() {
        super.init(frame: .zero)
        self.textColor = .black
        self.font = UIFont.boldSystemFont(ofSize: 14.0)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

