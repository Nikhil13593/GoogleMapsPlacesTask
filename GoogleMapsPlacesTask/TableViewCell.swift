//
//  TableViewCell.swift
//  GoogleMapsPlacesTask
//
//  Created by Nikhil Patil on 30/03/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var placeNameLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    @IBOutlet weak var latitudeLbl: UILabel!
    @IBOutlet weak var longitudeLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
