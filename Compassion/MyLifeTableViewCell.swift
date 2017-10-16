//
//  MyLifeTableViewCell.swift
//  Compassion
//
//  Created by Sachin Amrale on 13/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class MyLifeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var subLabel2: UILabel!
    @IBOutlet weak var subLabel1: UILabel!
    @IBOutlet weak var headLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
