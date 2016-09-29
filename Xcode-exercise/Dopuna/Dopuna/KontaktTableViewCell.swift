//
//  KontaktTableViewCell.swift
//  Dopuna
//
//  Created by Belmin Salkica on 9/20/16.
//  Copyright © 2016 WIP. All rights reserved.
//

import UIKit

class KontaktTableViewCell: UITableViewCell {
    // MARK: Properties
    
    @IBOutlet weak var imeKontakta: UILabel!
    @IBOutlet weak var brojKontakta: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
