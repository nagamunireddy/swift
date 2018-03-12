//
//  TableTableviewCellTableViewCell.swift
//  DotaJson
//
//  Created by Adroitent INC on 06/03/18.
//  Copyright © 2018 Adroitent INC. All rights reserved.
//

import UIKit

class TableTableviewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var buttonName: UIButton!
    
    var name:String = ""
    var attribute:String = ""
    var attack:String = ""
    
    
    var delegate:loadingDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.loadingView(name: self.name, attack: self.attack, attribute: self.attribute)
        
    }
}
