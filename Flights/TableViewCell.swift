//
//  TableViewCell.swift
//  Flights
//
//  Created by Jan Vrzal on 29.02.16.
//  Copyright © 2016 OhYeahSoft. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var flightsFromLabel: UILabel!
    @IBOutlet weak var flightsToLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
