//
//  MusicSearchRouter.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicSearchRouter {
    
    weak var viewController: UIViewController?
    
    func openPlayer(for song: ITunesSong) {
        
        let songPlayerViewController = SongPlayerViewController()
        self.viewController?.navigationController?.pushViewController(songPlayerViewController, animated: true)
    }
}
