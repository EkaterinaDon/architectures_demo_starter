//
//  SongPlayerViewModel.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol SongPlayerViewModelInput {
    func play()
    func pause()
    func stop()
}

protocol SongPlayerViewModelOutput {
    var onProgressViewChanged: ((Double) -> Void)? { get set }
}


final class SongPlayerViewModel {

    var onProgressViewChanged: ((Double) -> Void)?
    
    var timer: Timer?
    var progress: Double {
        didSet {
            onProgressViewChanged?(progress)
        }
    }
    
    init(progress: Double, onProgressViewChanged: ((Double) -> Void)?) {
        self.progress = progress
        self.onProgressViewChanged = onProgressViewChanged
        onProgressViewChanged?(progress)
    }
    
}

extension SongPlayerViewModel {
    func play() {
        print("play")
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] (timer) in
            guard let self = self else { return }
            
            let newProgress = self.progress + 0.05
            if self.progress == 1 {
                timer.invalidate()
            }
            
            print(newProgress)
            self.progress = min(newProgress, 1)
        }
    }
    
    func pause() {
        timer?.invalidate()
    }
    
    func stop() {
        print("stop")
        timer?.invalidate()
        progress = 0
    }
    
    
}
