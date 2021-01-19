//
//  SongsSearchPreenter.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongsSearchPresenter {
    
    private let model: SongSearchModel
    var viewController: SongsSearchViewController?
    
    init(model: SongSearchModel) {
        self.model = model
    }
    
    func viewDidSearch(with query: String) {
        model.refreshData(with: query) { [weak self] error in
            guard let self = self else { return }
            
            self.viewController?.tableView.reloadData()
            
            if self.cellsCount() == 0 {
                self.viewController?.showNoResults()
            } else {
                self.viewController?.hideNoResults()
            }
        }
    }
    
    func cellsCount() -> Int {
        return model.dataSourse.count
    }
    
    func viewDidSelectCell(at indexPath: IndexPath) {
        let song = model.dataSourse[indexPath.row]
        debugPrint("song selected \(song.trackName)")
    }
    
    func configureCell(_ cell: SongTableViewCell, at indexPath: IndexPath) {
        let song = model.dataSourse[indexPath.row]
        cell.artistNameLabel.text = song.artistName
        cell.collectionNameLabel.text = song.collectionName
        cell.songNameLabel.text = song.trackName
    }
}
