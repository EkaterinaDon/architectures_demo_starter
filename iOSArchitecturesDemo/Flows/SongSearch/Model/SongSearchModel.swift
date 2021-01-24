//
//  SongSearchModel.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongSearchModel {
    
    var dataSourse: [ITunesSong] = []
    
    private let searchService = ITunesSearchService()
    
    private func requestSongs(with query: String, complition: @escaping (Error?) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            result
                .withValue { songs in
                    self.dataSourse = songs
                    complition(nil)
                    return
                }
                .withError {
                    self.dataSourse = []
                    complition($0)
                }
        }
    }
    
    func refreshData(with query: String, complition: @escaping (Error?) -> Void) {
        self.requestSongs(with: query, complition: complition)
    }
    
}
