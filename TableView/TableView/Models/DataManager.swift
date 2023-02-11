//
//  DataManager.swift
//  TableView
//
//  Created by moonkey on 2023/02/11.
//

import UIKit

class DataManager {
    var moviesArray: [Movie] = []
    
    func makeMovieData(){
        //보통 서버 통신으로 받아서
        moviesArray = [
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
    }
    
    func getMovieData() -> [Movie] {
        return moviesArray
    }
}
