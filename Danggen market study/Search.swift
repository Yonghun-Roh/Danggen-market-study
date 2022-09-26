//
//  Search.swift
//  Danggen market study
//
//  Created by Yonghun Roh on 2022/09/22.
//

import UIKit
class SearchViewController:UIViewController, UISearchResultsUpdating {
   let SearchController = UISearchController(searchResultsController: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
 title = "Search"
        SearchController.searchResultsUpdater = self
        navigationItem.searchController = SearchController
}
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
        return
            
        }
        print(text)
    }
}
