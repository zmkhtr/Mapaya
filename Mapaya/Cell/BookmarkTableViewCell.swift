//
//  BookmarkTableViewCell.swift
//  Mapaya
//
//  Created by Adrian Renaldi on 08/04/20.
//  Copyright © 2020 Azam Mukhtar. All rights reserved.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initImageViewGradient()
    }
    
    func initImageViewGradient() {
        // Add corner radius
        recipeImage.layer.cornerRadius = 25
        
        // Add gradient to an image view
        let gradient = CAGradientLayer()
        gradient.frame = recipeImage.bounds
        let startColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor
        let endColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        gradient.colors = [startColor, endColor]
        recipeImage.layer.insertSublayer(gradient, at: 0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
