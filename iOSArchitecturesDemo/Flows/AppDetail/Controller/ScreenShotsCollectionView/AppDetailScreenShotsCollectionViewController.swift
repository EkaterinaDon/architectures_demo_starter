//
//  AppDetailScreenShotsCollectionViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 17.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

private let reuseIdentifier = "AppDetailScreenShotsCollectionViewCell"

class AppDetailScreenShotsCollectionViewController: UICollectionViewController {

    let app: ITunesApp
    private let imageDownLoader = ImageDownloader()
    var views: [UIImage] = []
    
    init(app: ITunesApp) {
        self.app = app
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        collectionLayout.itemSize = CGSize(width: 150, height: 200)
        collectionLayout.scrollDirection = .horizontal
        super.init(collectionViewLayout: collectionLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView!.register(AppDetailScreenShotsCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard !app.screenshotUrls.isEmpty else { return 0 }
        return app.screenshotUrls.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        guard let cell = myCell as? AppDetailScreenShotsCollectionViewCell else { return myCell }
        
        let imageUrl = app.screenshotUrls[indexPath.row]
        
        imageDownLoader.getImage(fromUrl: imageUrl) { (image, _) in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
            
                cell.imageView.image = image!
                self.views.append(image!)
            }
        }
            
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fullScreenVC = FullScreenShotsViewController()
        fullScreenVC.views = views
        fullScreenVC.modalPresentationStyle = .fullScreen
        present(fullScreenVC, animated: true, completion: nil)
    }

}
