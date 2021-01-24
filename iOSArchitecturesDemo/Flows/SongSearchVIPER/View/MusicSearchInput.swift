//
//  MusicSearchInput.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

protocol MusicSearchViewInput: class {
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func reloadView()
}
