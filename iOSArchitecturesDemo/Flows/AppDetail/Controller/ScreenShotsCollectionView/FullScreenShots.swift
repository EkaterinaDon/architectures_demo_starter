//
//  FullScreenShots.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 18.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class FullScreenShotsViewController: UIViewController {
    
    private(set) lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("X", for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let imageDownLoader = ImageDownloader()
    var views: [UIImage] = []
    lazy var frame = CGRect.zero
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(views.count), height: view.frame.height)
     
        for i in 0..<views.count {
            frame.origin.x = scrollView.frame.size.width * CGFloat(i)
            frame.size = scrollView.frame.size
            
            let imgView = UIImageView(frame: frame)
            imgView.translatesAutoresizingMaskIntoConstraints = false
            imgView.image = views[i]
            scrollView.addSubview(imgView)
            
        }
        
        scrollView.delegate = self
        
        return scrollView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = views.count
        pageControl.currentPage = 0
        pageControl.addTarget(self, action: #selector(pageControlTapHandler(sender:)), for: .touchUpInside)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    @objc
    func pageControlTapHandler(sender: UIPageControl) {
        scrollView.scrollTo(horizontalPage: sender.currentPage, animated: true)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(self.scrollView)
        view.addSubview(self.pageControl)
        view.addSubview(self.dismissButton)
        
        NSLayoutConstraint.activate([
            
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        
            self.pageControl.heightAnchor.constraint(equalToConstant: 50),
            self.pageControl.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.pageControl.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.pageControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -12),
            
            self.dismissButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50.0),
            self.dismissButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20.0),
            self.dismissButton.widthAnchor.constraint(equalToConstant: 10.0),
            self.dismissButton.heightAnchor.constraint(equalToConstant: 10.0)
        
        ])
    }
    
    @objc
    func dismissButtonTapped(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension UIScrollView {
    func scrollTo(horizontalPage: Int? = 0, verticalPage: Int? = 0, animated: Bool? = true) {
        var frame: CGRect = self.frame
        frame.origin.x = frame.size.width * CGFloat(horizontalPage ?? 0)
        frame.origin.y = frame.size.width * CGFloat(verticalPage ?? 0)
        self.scrollRectToVisible(frame, animated: animated ?? true)
    }
}

extension FullScreenShotsViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

