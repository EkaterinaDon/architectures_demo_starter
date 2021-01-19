//
//  SongSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongSearchBuilder {
    static func build() -> UIViewController {
        let songsSearchModel = SongSearchModel()
        let songsSearchPresenter = SongsSearchPresenter(model: songsSearchModel)
        let songsSearchViewController = SongsSearchViewController(presenter: songsSearchPresenter)
        songsSearchPresenter.viewController = songsSearchViewController
        
        return songsSearchViewController
    }
}
