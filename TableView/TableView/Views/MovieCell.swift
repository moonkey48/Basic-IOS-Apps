//
//  MovieCell.swift
//  TableView
//
//  Created by moonkey on 2023/02/09.
//

import UIKit

class MovieCell: UITableViewCell {

    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
