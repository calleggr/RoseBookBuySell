//
//  ListingTableViewCell.swift
//  RoseBookBuySell
//
//  Created by CSSE Department on 8/4/15.
//  Copyright (c) 2015 Gregory Callegari. All rights reserved.
//

import UIKit

class ListingTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var courseLabel: UILabel!
    
    @IBOutlet weak var bookLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
