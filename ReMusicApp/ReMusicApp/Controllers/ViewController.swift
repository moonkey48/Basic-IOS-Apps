//
//  ViewController.swift
//  ReMusicApp
//
//  Created by moonkey on 2023/02/26.
//

import UIKit

class ViewController: UIViewController {

//    let searchController = UISearchController(searchResultsController: UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultViewController") as! SearchResultViewController)
    
    @IBOutlet weak var musicTableView: UITableView!
    
    var networkManager = NetworkManager.shared
    
    var musicArray: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager.fetchMusic(searchTerm: "hello") { result in
            print(result)
        }
    }
    
    func setupSearchBar(){
        self.title = "Music Search"
//        navigationItem.searchController = searchController
//        searchController.searchResultsUpdater = self
        
    }


}

