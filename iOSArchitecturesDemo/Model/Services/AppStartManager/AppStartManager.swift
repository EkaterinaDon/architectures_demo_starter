//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        
        let tabBarController = UITabBarController(nibName: nil, bundle: nil)
        
        let rootVC = SearchBuilder.build()
        rootVC.navigationItem.title = "Search via iTunes"
        
        let navVC = self.configuredNavigationController()
        navVC.viewControllers = [rootVC]
        navVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let songsSearchVC = SongSearchBuilder.build()
        songsSearchVC.navigationItem.title = "Songs Search"
        
        let navSongsVC = self.configuredNavigationController()
        navSongsVC.viewControllers = [songsSearchVC]
        navSongsVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        
        tabBarController.viewControllers = [navVC, navSongsVC]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
    
//    private lazy var configuredNavigationController: UINavigationController = {
//        let navVC = UINavigationController()
//        navVC.navigationBar.barTintColor = UIColor.varna
//        navVC.navigationBar.isTranslucent = false
//        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//        return navVC
//    }()
    
    private func configuredNavigationController() -> UINavigationController {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }
}
