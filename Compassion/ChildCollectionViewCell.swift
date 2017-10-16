//
//  ChildCollectionViewCell.swift
//  Compassion
//
//  Created by Sachin Amrale on 12/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class ChildCollectionViewCell: UICollectionViewCell
{
    @IBOutlet weak var childImageView       : UIImageView!
    @IBOutlet weak var childNameLabel       : UILabel!
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        self.layoutIfNeeded()
        childImageView.layer.cornerRadius = childImageView.layer.frame.size.width / 2
        childImageView.layer.masksToBounds = true
        
    }
}
