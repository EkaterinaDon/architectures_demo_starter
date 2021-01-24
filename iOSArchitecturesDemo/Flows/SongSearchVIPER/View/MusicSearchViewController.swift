//
//  MusicSearchViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Ekaterina on 24.01.21.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class MusicSearchViewController: UIViewController {
   
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
    private let emptyResultView = UIView()
    private let emptyResultLabel = UILabel()
    static let reuseIdentifire = "reuseIdentifire"
    
    let presenter: MusicSearchPresenter
    
    init(presenter: MusicSearchPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configure()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    private func configure() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.addSearchBar()
        self.addTableView()
        self.addEmptyResultView()
        self.setupConstraints()
    }

    private func addSearchBar() {
        self.searchBar.translatesAutoresizingMaskIntoConstraints = false
        self.searchBar.delegate = self
        self.searchBar.searchBarStyle = .minimal
        self.view.addSubview(self.searchBar)
    }
    
    private func addTableView() {
        self.tableView.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicSearchViewController.reuseIdentifire)
        self.tableView.rowHeight = 72.0
        self.tableView.separatorInset = UIEdgeInsets(top: 0.0, left: 12.0, bottom: 0.0, right: 0.0)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.isHidden = true
        self.tableView.tableFooterView = UIView()
        self.view.addSubview(self.tableView)
    }

    private func addEmptyResultView() {
        self.emptyResultView.translatesAutoresizingMaskIntoConstraints = false
        self.emptyResultView.backgroundColor = .white
        self.emptyResultView.isHidden = true
        
        self.emptyResultLabel.translatesAutoresizingMaskIntoConstraints = false
        self.emptyResultLabel.text = "Nothing was found"
        self.emptyResultLabel.textColor = .darkGray
        self.emptyResultLabel.textAlignment = .center
        self.emptyResultLabel.font = UIFont.systemFont(ofSize: 12.0)
        
        self.view.addSubview(self.emptyResultView)
        self.emptyResultView.addSubview(self.emptyResultLabel)
    }
    
    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
        
            self.searchBar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8.0),
            self.searchBar.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            self.searchBar.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            
            self.tableView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.tableView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            self.emptyResultView.topAnchor.constraint(equalTo: self.searchBar.bottomAnchor),
            self.emptyResultView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            self.emptyResultView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            self.emptyResultView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            self.emptyResultLabel.topAnchor.constraint(equalTo: self.emptyResultView.topAnchor, constant: 12.0),
            self.emptyResultLabel.leftAnchor.constraint(equalTo: self.emptyResultView.leftAnchor),
            self.emptyResultLabel.rightAnchor.constraint(equalTo: self.emptyResultView.rightAnchor),
        
        ])
    }
    
}

extension MusicSearchViewController: MusicSearchViewInput {
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.emptyResultView.isHidden = false
        self.tableView.isHidden = true
    }
    
    func hideNoResults() {
        self.emptyResultView.isHidden = true
        self.tableView.isHidden = false
    }
    
    func reloadView() {
        self.tableView.reloadData()
        self.searchBar.resignFirstResponder()
    }
    
    
}

extension MusicSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        self.presenter.viewDidSearch(with: query)
    }
}

extension MusicSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: MusicSearchViewController.reuseIdentifire, for: indexPath)
        guard let cell = myCell as? MusicTableViewCell else { return myCell }
        self.presenter.configureCell(cell, at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.viewDidSelectCell(at: indexPath)
    }
}
