//
//  AboutMeViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 12/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit
import MXSegmentedPager

class AboutMeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,MXPageProtocol {

    //MARK: View Outlets and Variables
    
    @IBOutlet weak var yearLabel                : UILabel!
    @IBOutlet weak var countryView              : UIView!
    @IBOutlet weak var countryNameLabel         : UILabel!
    @IBOutlet weak var boyImageView             : UIImageView!
    @IBOutlet weak var tableView                : UITableView!
    
    var aboutMeVC:AboutMeViewController!        = nil
    var myPhotosVC:MyPhotosViewController!      = nil
    
    var viewControllers                         = [UIViewController]()
    var tabLabels                               = [String]()
    
    //MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInitialization()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews()
    {
        boyImageView.layer.cornerRadius = boyImageView.layer.frame.size.width / 2
        boyImageView.clipsToBounds = true
        boyImageView.layer.borderWidth = 2
        boyImageView.layer.borderColor = UIColor(red: (16.0/255.0), green: (86.0/255.0), blue: (165.0/255.0), alpha: 1.0).cgColor
        
        countryView.layer.cornerRadius = countryView.layer.frame.size.width / 2
        countryView.clipsToBounds = true
        
        yearLabel.layer.cornerRadius = yearLabel.layer.frame.size.width / 2
        yearLabel.clipsToBounds = true
    }
    
    //MARK: - Custom Methods
    
    func commonInitialization()
    {
        self.tableView.register(UINib(nibName: "MyLifeTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.countryNameLabel.text = "Dominican \nRepublic"
        
    }
    
    //MARK: MXPager Method
    
    

    
    //MARK: - TableView Delegate and Datasource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyLifeTableViewCell
        
        if indexPath.row == 0
        {
            cell.imageview.image = UIImage(named: "guardians")
            cell.headLabel.text = "GUARDIANS:"
            cell.subLabel1.text = "\u{2022} Mother"
            cell.subLabel2.text = "\u{2022} Father"
            
        }
        if indexPath.row == 1
        {
            cell.imageview.image = UIImage(named: "hobbies")
            cell.headLabel.text = "HOBBIES:"
            cell.subLabel1.text = "\u{2022} Hide and Seak"
            cell.subLabel2.text = "\u{2022} Toy Cars"
            
        }
        if indexPath.row == 2
        {
            cell.imageview.image = UIImage(named: "dad")
            cell.headLabel.text = "FATHER/MALE GUARDIAN OCCUPATION:"
            cell.subLabel1.text = "\u{2022} Day Labour / Different Jobs"
            cell.subLabel2.text = ""
            
        }
        if indexPath.row == 3
        {
            cell.imageview.image = UIImage(named: "mom")
            cell.headLabel.text = "MOTHER/FEMALE GUARDIAN OCCUPATION:"
            cell.subLabel1.text = "\u{2022} Unemployed"
            cell.subLabel2.text = "\u{2022} No Children in the Family"
            
        }
        return cell
    }
    
    //MARK: Button Actions
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
