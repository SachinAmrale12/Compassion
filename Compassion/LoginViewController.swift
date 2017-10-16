//
//  LoginViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 11/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: View Outlets
    
    @IBOutlet weak var userNameView                     : UIView!
    @IBOutlet weak var passwordView                     : UIView!
    @IBOutlet weak var passwordShowHideButton           : UIButton!
    @IBOutlet weak var detailsCheckmarkButton           : UIButton!
    @IBOutlet weak var loginButtonView                  : UIView!
    @IBOutlet weak var facebookButtonView               : UIView!
    @IBOutlet weak var passwordTextfield                : UITextField!
    @IBOutlet weak var userNameTextfield                : UITextField!
    
    //MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInitialization()

        // Do any additional setup after loading the view.
    }

    func commonInitialization()
    {
        userNameView.backgroundColor = UIColor(red: (255.0/255.0), green: (255.0/255.0), blue: (255.0/255.0), alpha: 0.35)
        passwordView.backgroundColor = UIColor(red: (255.0/255.0), green: (255.0/255.0), blue: (255.0/255.0), alpha: 0.35)
        
        self.userNameView.layer.borderWidth = 1
        self.userNameView.layer.borderColor = UIColor.white.cgColor
        
        self.passwordView.layer.borderWidth = 1
        self.passwordView.layer.borderColor = UIColor.white.cgColor
        
        self.userNameTextfield.attributedPlaceholder = NSAttributedString(string: "Username",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
        self.passwordTextfield.attributedPlaceholder = NSAttributedString(string: "Password",
                                                               attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        self.userNameView.layer.cornerRadius = 20
        self.userNameView.layer.masksToBounds = true
        self.passwordView.layer.cornerRadius = 20
        self.passwordView.layer.masksToBounds = true
        self.loginButtonView.layer.cornerRadius = 20
        self.loginButtonView.layer.masksToBounds = true
        self.facebookButtonView.layer.cornerRadius = 20
        self.facebookButtonView.layer.masksToBounds = true
        self.passwordShowHideButton.setTitle("Show", for: .normal)
        self.detailsCheckmarkButton.setBackgroundImage(UIImage(named: "checkBoxNonSelect"), for: UIControlState.normal)
    }
    
    //MARK: Button Actions
    
    @IBAction func loginButtonClicked(_ sender: Any)
    {
        let dashBoardVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "dashBoardViewController") as! DashBoardViewController
        self.navigationController?.pushViewController(dashBoardVC, animated: true)
    }
    
    @IBAction func backButtonClicked(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func passwordShowHideClicked(_ sender: Any)
    {
        if self.passwordShowHideButton.title(for: .normal) == "Show"
        {
            self.passwordShowHideButton.setTitle("Hide", for: .normal)
            self.passwordTextfield.isSecureTextEntry = false
        }
        else
        {
            self.passwordShowHideButton.setTitle("Show", for: .normal)
            self.passwordTextfield.isSecureTextEntry = true
        }
    }
    
    
    @IBAction func chemarkButtonClicked(_ sender: Any)
    {
        if (self.detailsCheckmarkButton.isSelected == true)
        {
            self.detailsCheckmarkButton.setBackgroundImage(UIImage(named: "checkBoxNonSelect"), for: UIControlState.normal)
            self.detailsCheckmarkButton.isSelected = false;
        }
        else
        {
            self.detailsCheckmarkButton.setBackgroundImage(UIImage(named: "checkBoxSelect"), for: UIControlState.normal)
            self.detailsCheckmarkButton.isSelected = true;
        }
    }
    
    //MARK: Touch Methods
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
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
