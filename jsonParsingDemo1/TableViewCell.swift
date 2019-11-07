//
//  TableViewCell.swift
//  jsonParsingDemo1
//
//  Created by Agstya Technologies on 07/10/19.
//  Copyright © 2019 Mayur. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    //MARK:- Outlets and Variables decleration
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var capitalLbl: UILabel!

    
    //MARK:- Cell LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
