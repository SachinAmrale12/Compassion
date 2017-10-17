//
//  TestView.swift
//  Compassion
//
//  Created by Sachin Amrale on 17/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit
import MXSegmentedPager

class TestView: UIView,UITableViewDelegate,UITableViewDataSource,MXPageProtocol
{
    var tableView   :UITableView!
    override func awakeFromNib() {
        
        self.tableView = UITableView(frame: self.bounds)
        self.tableView.register(UINib(nibName: "MyLifeTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.register(UINib(nibName: "MyLifeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "headerCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.addSubview(self.tableView)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        if indexPath.row == 0
        {
            return 135.0
        }
        else
        {
            return 60.0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if indexPath.row == 0
        {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "headerCell") as! MyLifeHeaderTableViewCell
            return cell
        }
        else
        {
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyLifeTableViewCell
            if indexPath.row == 1
            {
                cell.imageview.image = UIImage(named: "guardians")
                cell.headLabel.text = "GUARDIANS:"
                cell.subLabel1.text = "\u{2022} Mother"
                cell.subLabel2.text = "\u{2022} Father"
                
            }
            if indexPath.row == 2
            {
                cell.imageview.image = UIImage(named: "hobbies")
                cell.headLabel.text = "HOBBIES:"
                cell.subLabel1.text = "\u{2022} Hide and Seak"
                cell.subLabel2.text = "\u{2022} Toy Cars"
                
            }
            if indexPath.row == 3
            {
                cell.imageview.image = UIImage(named: "dad")
                cell.headLabel.text = "FATHER/MALE GUARDIAN OCCUPATION:"
                cell.subLabel1.text = "\u{2022} Day Labour / Different Jobs"
                cell.subLabel2.text = ""
                
            }
            if indexPath.row == 4
            {
                cell.imageview.image = UIImage(named: "mom")
                cell.headLabel.text = "MOTHER/FEMALE GUARDIAN OCCUPATION:"
                cell.subLabel1.text = "\u{2022} Unemployed"
                cell.subLabel2.text = "\u{2022} No Children in the Family"
                
            }
            return cell
        }
    }
    
    func segmentedPager(_ segmentedPager: MXSegmentedPager, shouldScrollWith view: UIView) -> Bool {
        
        if view == self.tableView
        {
            return false
        }
        return true
    }
}
