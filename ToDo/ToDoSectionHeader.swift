//
//  ToDoSectionHeader.swift
//  MorePractice
//
//  Created by Hisham Abi Ammar on 7/11/19.
//  Copyright © 2019 Hisham Abi Ammar. All rights reserved.
//

import UIKit

class ToDoSectionHeader: UITableViewCell {

    
    @IBOutlet weak var sectionHeaderLabel: UILabel!
    
    @IBOutlet weak var sectionCollapseArrow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
