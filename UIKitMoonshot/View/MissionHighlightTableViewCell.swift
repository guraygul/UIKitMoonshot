//
//  MissionHighlightTableViewCell.swift
//  UIKitMoonshot
//
//  Created by Güray Gül on 12.02.2024.
//

import UIKit

class MissionHighlightTableViewCell: UITableViewCell {

    @IBOutlet weak var missionDetailDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
