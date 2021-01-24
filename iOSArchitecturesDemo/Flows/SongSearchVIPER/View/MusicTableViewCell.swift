//
//  MusicTableViewCell.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class MusicTableViewCell: UITableViewCell {
    private(set) lazy var artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var collectionNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14.0)
        return label
    }()
    
    private(set) lazy var songNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        [self.artistNameLabel, self.collectionNameLabel, self.songNameLabel].forEach { $0.text = nil }
    }

    private func configure() {
        self.addArtistNameLabel()
        self.addCollectionNameLabel()
        self.addSongNameLabel()
    }
    
    private func addArtistNameLabel() {
        self.contentView.addSubview(self.artistNameLabel)
        NSLayoutConstraint.activate([
        
            artistNameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            artistNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            artistNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            
        ])
    }
    
    private func addCollectionNameLabel() {
        self.contentView.addSubview(self.collectionNameLabel)
        NSLayoutConstraint.activate([
        
            collectionNameLabel.topAnchor.constraint(equalTo: self.artistNameLabel.bottomAnchor, constant: 4.0),
            collectionNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            collectionNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            
        ])
    }
    
    private func addSongNameLabel() {
        self.contentView.addSubview(self.songNameLabel)
        NSLayoutConstraint.activate([
        
            songNameLabel.topAnchor.constraint(equalTo: self.collectionNameLabel.bottomAnchor, constant: 4.0),
            songNameLabel.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            songNameLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            
        ])
    }
    
}
