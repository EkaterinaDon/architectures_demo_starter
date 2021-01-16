//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Veaceslav Chirita on 14.01.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SearchBuilder {
    static func build() -> (UIViewController & SearchViewInput) {
        let presenter = Presenter()
        let viewController = SearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
