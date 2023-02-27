//
//  MusicCell.swift
//  ReMusicApp
//
//  Created by moonkey on 2023/02/27.
//

import UIKit

class MusicCell: UITableViewCell {

    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func loadImage(){
        guard let urlString = self.imageUrl, let url = URL(string: urlString) else {return}
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else {return}
            
            DispatchQueue.main.async {
                self.mainImageView.image = UIImage(data: data)
            }
        }

    }

    
}
