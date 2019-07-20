//
//  ToDoMainVC.swift
//  MorePractice
//
//  Created by Hisham Abi Ammar on 7/11/19.
//  Copyright © 2019 Hisham Abi Ammar. All rights reserved.
//

import UIKit

class ToDoMainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var toDoItems: [[ToDoItem]] = []
    let sections = ["Project 1", "Project 2"]
    var selectedCell: IndexPath = IndexPath()
    var sectionCollapsed: Int = -1
    var sectionsCollapsed: [Int] = []
    var toDoCellExpanded: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createPlusButton()
        tableView.delegate = self
        tableView.dataSource = self
        toDoItems = CreateTodoList()
        
        // For removing the extra empty spaces of TableView below
        tableView.tableFooterView = UIView()
        
        
        
        
        
        
        
        
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return toDoItems.count
    }

    

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItems[section].count
    }
    
    
 func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let sectionHeader = tableView.dequeueReusableCell(withIdentifier: "SectionHeader") as! ToDoSectionHeader
        sectionHeader.sectionHeaderLabel.text = sections[section]
        sectionHeader.contentView.backgroundColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0)
        sectionHeader.sectionCollapseArrow.addTarget(self, action: #selector(HandleCollapse), for: .touchUpInside)
        sectionHeader.sectionCollapseArrow.tag = section
        return sectionHeader.contentView
        
    }
    
    
    @objc func HandleCollapse(sender: UIButton) {
        sectionCollapsed = sender.tag
        print("Collapse at section: \(sectionCollapsed)")
        
        if sectionsCollapsed.contains(sender.tag) {
         
            let index = sectionsCollapsed.firstIndex(of: sender.tag)
            sectionsCollapsed.remove(at: index!)
            sender.setImage(UIImage(named: "arrow"), for: .normal)
        }
        
        else {
            
            sectionsCollapsed.append(sender.tag)
               sender.setImage(UIImage(cgImage: (UIImage(named: "arrow")?.cgImage)!, scale: 1.0, orientation: .downMirrored), for: .normal)
        }
        
        
    
            self.tableView.beginUpdates()
            self.tableView.endUpdates()
        
        
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       
   return 60.0
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        var collapse = false
        
        for item in sectionsCollapsed {
            
            if indexPath.section == item {
                
                collapse = true
                break
        }
        }

            
            if collapse {
                collapse = false
                return 0
            }
                
            else if indexPath == selectedCell {
                
                return 200
            }
            
            else { return 50}
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
        
        cell.toDoDescription.text  = toDoItems[indexPath.section][indexPath.row].description
        
        cell.expandToDoButton.addTarget(self, action: #selector(handleToDoCellExpand), for: .touchUpInside)
        
        
        cell.expandToDoButton.row = indexPath.row
        cell.expandToDoButton.section = indexPath.section
        
        print ("Cell for at called Section:\(indexPath.section) Row: \(indexPath.row)")
        
        
        if selectedCell == indexPath {
                cell.testLabel.isHidden = false
                }
        
                else {

                    cell.testLabel.isHidden = true
        

                }
        
        return cell
    }
    
    
    

    
    
    
    @objc func handleToDoCellExpand(sender: ToDoExpandButton) {
       
        
    var selection:IndexPath = IndexPath()
        
    selection=IndexPath(row: sender.row, section: sender.section)
        
       // if !sender.expanded
        
        if !toDoCellExpanded {
        
//            self.tableView.beginUpdates()
//            self.tableView.endUpdates()
            selectedCell = selection
        


       

           
        }
        
        
        else {
            
          //  self.tableView.beginUpdates()
            //self.tableView.endUpdates()
            selectedCell = IndexPath() //initialize to empty index path
            
        }

        
        tableView.reloadRows(at: [selection], with: UITableView.RowAnimation.fade)

        sender.setImage(sender.image(for: .normal)?.rotate(radians: .pi), for: .normal)
        
        //sender.expanded = !sender.expanded
        toDoCellExpanded = !toDoCellExpanded

    }
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
//        let action1 = UIContextualAction(style: .normal, title: "Done", handler: #selector(handleSwipe))
        
        let action1 = UIContextualAction(style: .normal, title: "Done") { (action, view, completionHandler) in
            view.backgroundColor = UIColor.red
            completionHandler(true)
        }
        
        let actions = [action1]
        
        let config = UISwipeActionsConfiguration(actions: actions)
        
        //config.performSelector(#selector(handleSwipe))
        return config
    }
    
   @objc func handleSwipe(){
        
        print("Swipe has been regiestered.")
    }

    
 
    
    
    
func CreateTodoList() -> [[ToDoItem]]
    {
        
        var project1: [ToDoItem] = []
        var project2: [ToDoItem] = []
        
        var projectToDos: [[ToDoItem]] = []
        
        //Project 1
        let td1 = ToDoItem(description: "Submit Report", dueDate: Date())
        let td2 = ToDoItem(description: "Scheule Team Meeting", dueDate: Date())
        let td3 = ToDoItem (description: "Work on Presentation", dueDate: Date())
        
        //Project 2
        let td4 = ToDoItem(description: "Perform UAT", dueDate: Date())
        let td5 = ToDoItem(description: "Meet with End-users", dueDate: Date())
        let td6 = ToDoItem (description: "Generate Testing Data and Scenarios", dueDate: Date())
        
        project1.append(td1)
        project1.append(td2)
        project1.append(td3)
        
        project2.append(td4)
        project2.append(td5)
        project2.append(td6)
        
        projectToDos.append(project1)
        projectToDos.append(project2)
        
        return projectToDos
        
        
    }
    


}
