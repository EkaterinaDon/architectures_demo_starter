//
//  MusicSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicSearchPresenter {
    
    let interactor: MusicSearchInteractor
    let router: MusicSearchRouter
    
    weak var viewController: (UIViewController & MusicSearchViewInput)?
    
    private(set) var searchResults: [ITunesSong] = [] {
        didSet {
            viewController?.reloadView()
        }
    }
    
    init(interactor: MusicSearchInteractor, router: MusicSearchRouter) {
        self.interactor = interactor
        self.router = router
    }
    
    private func requestApps(with query: String) {
        self.interactor.requestSongs(with: query) { [weak self] result in
            guard let self = self else { return }
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.searchResults = []
                        self.viewController?.showNoResults()
                        return
                    }
                    self.viewController?.hideNoResults()
                    self.searchResults = songs
                }
                .withError {
                    self.viewController?.showError(error: $0)
                }
        }
    }
    
    func viewDidSearch(with query: String) {
        self.requestApps(with: query)
    }
    
    func configureCell(_ cell: MusicTableViewCell, at indexPath: IndexPath) {
        let song = searchResults[indexPath.row]
        cell.artistNameLabel.text = song.artistName
        cell.collectionNameLabel.text = song.collectionName
        cell.songNameLabel.text = song.trackName
    }
    
    func viewDidSelectCell(at indexPath: IndexPath) {
        self.router.openPlayer(for: searchResults[indexPath.row])
    }
}
