//
//  RepTableViewCell.swift
//  Rep API
//
//  Created by David Granger on 4/26/23.
//

import UIKit

class RepTableViewCell: UITableViewCell {

    @IBOutlet weak var linkLBL: UILabel!
    @IBOutlet weak var officeLBL: UILabel!
    @IBOutlet weak var phoneLBL: UILabel!
    @IBOutlet weak var partyLBL: UILabel!
    @IBOutlet weak var nameLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
