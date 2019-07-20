//
//  ToDoItem.swift
//  MorePractice
//
//  Created by Hisham Abi Ammar on 7/11/19.
//  Copyright © 2019 Hisham Abi Ammar. All rights reserved.
//

import UIKit

class ToDoItem {
    
    var description: String
    var dateCreated: Date
    var dueDate: Date
    var personResponsible: String

    
    init(description: String, dueDate: Date) {
        self.description = description
        self.dueDate = dueDate
        personResponsible = "Me"
        dateCreated = Date()
    }
    
}
