//
//  AstronautDetailTableViewCell.swift
//  UIKitMoonshot
//
//  Created by Güray Gül on 14.02.2024.
//

import UIKit

class AstronautDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var astroanutDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
