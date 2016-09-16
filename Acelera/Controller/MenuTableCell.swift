//
//  MenuTableCell.swift
//  Acelera
//
//  Created by mac on 5/11/16.
//  Copyright © 2016 mac. All rights reserved.
//

import UIKit

class MenuTableCell: UITableViewCell {
    
    @IBOutlet var img: UIImageView!
    @IBOutlet var lbl: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
