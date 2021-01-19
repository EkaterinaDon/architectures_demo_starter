//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 20.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    public var app: ITunesApp
    
    lazy var headerViewController = AppDetailHeaderViewController(app: app)
    lazy var versionViewController = AppDetailVersionViewController(app: app)
    lazy var screenShotsViewController = AppDetailScreenShotsCollectionViewController(app: app)
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        addScrollView()
        
        addChildViewController()
        addDescriptionViewController()
        addScreenShotsViewController()
        
    }
    
    private func addChildViewController() {
        
        self.addChild(headerViewController)
        self.view.addSubview(headerViewController.view)
        self.headerViewController.didMove(toParent: self)
        
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: self.scrollView.topAnchor), //view.safeAreaLayoutGuide
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    private func addDescriptionViewController() {
        // Дз: Добавить дочерний вью контроллер
        self.addChild(versionViewController)
        self.view.addSubview(versionViewController.view)
        self.versionViewController.didMove(toParent: self)
        
        versionViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            versionViewController.view.topAnchor.constraint(equalTo: self.headerViewController.view.bottomAnchor),
            versionViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            versionViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            //versionViewController.view.heightAnchor.constraint(equalToConstant: 250.0)
        ])
    }
    
    private func addScreenShotsViewController() {
        self.addChild(screenShotsViewController)
        self.view.addSubview(screenShotsViewController.view)
        self.screenShotsViewController.didMove(toParent: self)
        
        screenShotsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenShotsViewController.view.topAnchor.constraint(equalTo: self.versionViewController.view.bottomAnchor),
            screenShotsViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            screenShotsViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            screenShotsViewController.view.heightAnchor.constraint(equalToConstant: 200.0),
            screenShotsViewController.view.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor)
        ])
    }
    
    private func addScrollView() {
        self.view.addSubview(scrollView)
        
        self.scrollView.addSubview(headerViewController.view)
        self.scrollView.addSubview(versionViewController.view) 
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor)
        ])
    }
}
