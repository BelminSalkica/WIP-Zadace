//
//  SpendingTableViewCell.swift
//  SpendingTracker
//
//  Created by Belmin Salkica on 9/7/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class SpendingTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
