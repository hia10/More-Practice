//
//  ToDoCell.swift
//  MorePractice
//
//  Created by Hisham Abi Ammar on 7/11/19.
//  Copyright © 2019 Hisham Abi Ammar. All rights reserved.
//

import UIKit
import M13Checkbox


class ToDoCell: UITableViewCell {

    @IBOutlet weak var toDoDescription: UILabel!
    
    @IBOutlet weak var expandToDoButton: ToDoExpandButton!
    
    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var checkbox1: M13Checkbox!
    
    
    var expanded: Bool = false
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
      //  checkbox1.stateChangeAnimation = .expand(.fill)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    
    
}
