//
//  UIViewControllerExt.swift
//  MorePractice
//
//  Created by Hisham Abi Ammar on 7/11/19.
//  Copyright © 2019 Hisham Abi Ammar. All rights reserved.
//


import UIKit
import KYMenu

extension UIViewController {
    
    func createPlusButton()
    {
        //rgba(82, 184, 181, 1)
        
        let plusButton = UIButton(frame: CGRect(x: 0, y: 0, width: 70 , height: 70))
        
        plusButton.setImage(UIImage(named: "AddButton"), for: .normal)
        plusButton.setImage(UIImage(named: "AddButton"), for: .focused)
        plusButton.setImage(UIImage(named: "AddButton"), for: .highlighted)
        plusButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(plusButton)
        
        plusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: (self.view.safeAreaLayoutGuide.bottomAnchor), constant: 0).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
    }
    
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        
        
        
        let imageView1 = UIImageView(frame: CGRect(x: 0, y: 0, width: 70, height: 70))
        imageView1.contentMode = .scaleAspectFit
        imageView1.image = UIImage(named: "caldendar")
        
        
        
        let menuArray = [
            KYMenuItem.init("Add Reminder", image: UIImage(named: "right_menu_addFri"), target: self, action: #selector(self.selectItem)),
            KYMenuItem.init("Add Announcement", image: UIImage(named: "right_menu_facetoface"), target: self, action: #selector(self.selectItem)),
            KYMenuItem.init("Add Meeting", image: UIImage(named: "right_menu_multichat"), target: self, action: #selector(self.selectItem)),
            KYMenuItem.init("Add Todo Task", image: UIImage(named: "right_menu_payMoney"), target: self, action: #selector(self.selectItem))]
        
        
        let options = OptionalConfiguration(
            arrowSize: 10,
            marginXSpacing: 5.0,
            marginYSpacing: 7.0,
            intervalSpacing: 15.0,
            menuCornerRadius: 6.5,
            maskToBackground: true,
            shadowOfMenu: true,
            shadowOfMenuOutside: true,
            hasSeperatorLine: true,
            seperatorLineHasInsets: true,
            notContainsSubview: false,
            textColor: Color(R: 44, G: 62, B: 80),
            menuBackgroundColor: Color(R: 236, G: 240, B: 241))
        
        KYMenu.setTitleFont(UIFont(name: "Avenir Next", size: 16  ))
        KYMenu.setTitleTextColor(UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0))
        
        KYMenu.show(in: self.view, from: sender.frame, menuItems: menuArray, withOptions: options)
        
        
        
        
        
    }
    
    @objc func selectItem(){
        
        print("Button popup menu item selected")
        
    }
    

    
}
