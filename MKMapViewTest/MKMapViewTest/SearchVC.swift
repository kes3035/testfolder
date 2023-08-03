//
//  SearchVC.swift
//  MKMapViewTest
//
//  Created by 김은상 on 2023/08/03.
//

import UIKit

class SearchVC: UIViewController {

//    private let searchBar: UISearchBar = {
//        let searchBar = UISearchBar()
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        return searchBar
//    }()
//
    let searchBar = UISearchBar()
    
    lazy var tableView = UITableView(frame: self.view.frame)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingSearchBar()
        configureUI()
        settingTableView()
        view.backgroundColor = .white
        
        
    }
    
    func configureUI() {
        view.addSubview(tableView)
    }
    
    func settingSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "지역 검색하기"
        self.navigationItem.titleView = searchBar
        
    }
    
    func settingTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
    }
    

}


extension SearchVC: UISearchBarDelegate {
    
}
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
