//
//  MusicSearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation
import Alamofire

final class MusicSearchInteractor {
    
    private let searchService: ITunesSearchService
    
    init(searchService: ITunesSearchService) {
        self.searchService = searchService
    }
    
    func requestSongs(with query: String, complition: @escaping (Result<[ITunesSong]>) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.searchService.getSongs(forQuery: query) { result in
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            complition(result)
        }
    }
}
