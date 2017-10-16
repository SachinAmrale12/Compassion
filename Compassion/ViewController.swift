//
//  ViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 11/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: View Outlets
    
    @IBOutlet weak var compassionSponserView                : UIView!
    @IBOutlet weak var compassionSponserButton              : UIButton!
    @IBOutlet weak var compassionNewView                    : UIView!
    @IBOutlet weak var compassionNewButton                  : UIButton!
    
    //MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInitialization()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func commonInitialization()
    {
        self.compassionSponserButton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        self.compassionNewButton?.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping;
        
        self.compassionSponserButton.titleLabel?.textAlignment = NSTextAlignment.center
        self.compassionNewButton.titleLabel?.textAlignment = NSTextAlignment.center
        
        self.compassionSponserView.layer.cornerRadius = 20
        self.compassionSponserView.layer.masksToBounds = true
        
        self.compassionNewView.layer.cornerRadius = 20
        self.compassionNewView.layer.masksToBounds = true
        
        //self.compassionSponserButton.round(corners: [.topLeft,.bottomLeft], radius: 20)
        //self.compassionNewButton.round(corners: [.topLeft,.bottomLeft], radius: 20)
    }
    
    //MARK: Button Action Methods
    
    @IBAction func compassionSponserButtonClicked(_ sender: Any)
    {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func compassionNewButtonClicked(_ sender: Any)
    {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

