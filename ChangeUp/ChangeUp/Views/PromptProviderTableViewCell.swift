//
//  PromptProviderTableViewCell.swift
//  ChangeUp
//
//  Created by Alex on 9/03/2015.
//  Copyright (c) 2015 Beesappz. All rights reserved.
//

import UIKit

class PromptProviderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var providerNameLabel: UILabel!
    
    @IBOutlet weak var providerContactLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
