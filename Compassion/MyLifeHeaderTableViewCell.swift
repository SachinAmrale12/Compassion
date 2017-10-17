//
//  MyLifeHeaderTableViewCell.swift
//  Compassion
//
//  Created by Sachin Amrale on 17/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class MyLifeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var boyImageview     : UIImageView!
    @IBOutlet weak var ageLabel         : UILabel!
    @IBOutlet weak var countryView      : UIView!
    @IBOutlet weak var countryNameLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        boyImageview.layer.cornerRadius = boyImageview.layer.frame.size.width / 2
        boyImageview.clipsToBounds = true
        boyImageview.layer.borderWidth = 2
        boyImageview.layer.borderColor = UIColor(red: (16.0/255.0), green: (86.0/255.0), blue: (165.0/255.0), alpha: 1.0).cgColor
        
        countryView.layer.cornerRadius = countryView.layer.frame.size.width / 2
        countryView.clipsToBounds = true
        
        ageLabel.layer.cornerRadius = ageLabel.layer.frame.size.width / 2
        ageLabel.clipsToBounds = true
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
