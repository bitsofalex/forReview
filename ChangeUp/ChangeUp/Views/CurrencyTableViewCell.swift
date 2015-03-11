//
//  CurrencyTableViewCell.swift
//  ChangeUp
//
//  Created by Alex on 7/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var currencyFlag: UIImageView!
    
    @IBOutlet weak var currencyDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
