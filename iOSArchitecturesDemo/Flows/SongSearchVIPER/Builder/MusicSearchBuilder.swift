//
//  MusicSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicSearchBuilder {
    static func build() -> UIViewController {
        let router = MusicSearchRouter()
        let searchService = ITunesSearchService()
        let interactor = MusicSearchInteractor(searchService: searchService)
        let presenter = MusicSearchPresenter(interactor: interactor, router: router)
        let viewController = MusicSearchViewController(presenter: presenter)
        
        presenter.viewController = viewController
        router.viewController = viewController
        
        return viewController
    }
}
