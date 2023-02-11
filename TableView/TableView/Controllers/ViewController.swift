//
//  ViewController.swift
//  TableView
//
//  Created by moonkey on 2023/02/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    var moviesArray: [Movie] = [
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
        Movie(movieImage: UIImage(named: "spiderman.png"), movieName: "Spider Man", movieDescription: "home coming"),
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        cell.mainImage.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        
        return cell
    }


}

