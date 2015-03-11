//
//  FoundProvidersTableViewCell.swift
//  ChangeUp
//
//  Created by Alex on 10/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit

class FoundProvidersTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var distance: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
