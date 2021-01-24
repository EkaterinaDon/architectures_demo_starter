//
//  AppDetailVersionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppDetailVersionViewController: UIViewController {
    
    private(set) lazy var titleLabel: TitleLabel = {
        let label = TitleLabel()
        return label
    }()
    
    private(set) lazy var versionLabel: SubtitleLabel = {
        let label = SubtitleLabel()
        return label
    }()
    
    private(set) lazy var versionDataLabel: SubtitleLabel = {
        let label = SubtitleLabel()
        return label
    }()
    
    private(set) lazy var discriptionLabel: SimpleLabel = {
        let label = SimpleLabel()
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var versionHistoryButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("История версий", for: .normal)
        return button
    }()
    
    private var app: ITunesApp
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.fillData()
    }
    
    private func setupUI() {
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.versionLabel)
        self.view.addSubview(self.versionDataLabel)
        self.view.addSubview(self.discriptionLabel)
        self.view.addSubview(self.versionHistoryButton)
        
        NSLayoutConstraint.activate([
        
            self.titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0),
            
            self.versionHistoryButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12.0),
            self.versionHistoryButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0),
            self.versionHistoryButton.widthAnchor.constraint(equalToConstant: 130.0),
            self.versionHistoryButton.heightAnchor.constraint(equalToConstant: 30.0),
            
            self.versionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            self.versionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0),
            
            self.versionDataLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 12.0),
            self.versionDataLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0),
            
            self.discriptionLabel.topAnchor.constraint(equalTo: self.versionLabel.bottomAnchor, constant: 12.0),
            self.discriptionLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16.0),
            self.discriptionLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16.0),
            self.discriptionLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -16.0)
        
        ])
        
    }
    
    private func fillData() {
        self.titleLabel.text = "Новое"
        self.versionLabel.text = app.version
        self.versionDataLabel.text = app.currentVersionReleaseDate
        self.discriptionLabel.text = app.appDescription
    }
}
