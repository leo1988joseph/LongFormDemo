//
//  SearchTableCell.swift
//  LongFormTest
//
//  
//

import Foundation
import UIKit

class SearchTableCell : UITableViewCell {
    @IBOutlet weak var lblOccurances: UILabel!
    @IBOutlet weak var lblLongform: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
