//
//  MovieCell.swift
//  TheMovie
//
//  Created by Osvin-Mob-MAc on 30/04/22.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
//MARK: - IBOutlets
    
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var nameLb: UILabel!
    @IBOutlet weak var originCountry: UILabel!
    
//MARK: - Override methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
