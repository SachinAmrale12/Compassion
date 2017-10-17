//
//  DashBoardViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 12/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class DashBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInitialization()
        // Do any additional setup after loading the view.
    }

    
    func commonInitialization()
    {
        self.customTabBar()
    }
    
    func customTabBar()
    {
        let tabBarController = ESTabBarController()
        tabBarController.tabBar.backgroundColor = UIColor.white
        tabBarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabBarController.didHijackHandler = {
            [weak tabBarController] tabbarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                alertController.addAction(takePhotoAction)
                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                alertController.addAction(selectFromAlbumAction)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                tabBarController?.present(alertController, animated: true, completion: nil)
            }
        }
        
        let v1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        let v2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutMeContainerViewController") as! AboutMeContainerViewController
        let v3 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AnimatedViewController") as! AnimatedViewController
        let v4 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyProjectViewController") as! MyProjectViewController
        let v5 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyCommunityViewController") as! MyCommunityViewController
        
        v1.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home1"))
        v2.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "About Me", image: UIImage(named: "aboutMe"), selectedImage: UIImage(named: "aboutMe"))
        v3.tabBarItem = ESTabBarItem.init(ExampleIrregularityContentView(), title: nil, image: UIImage(named: "middleButton"), selectedImage: UIImage(named: "middleButton1"))
        v4.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "My Project", image: UIImage(named: "myProject"), selectedImage: UIImage(named: "myProject1"))
        v5.tabBarItem = ESTabBarItem.init(ExampleIrregularityBasicContentView(), title: "My Community", image: UIImage(named: "community"), selectedImage: UIImage(named: "community1"))
        
        tabBarController.viewControllers = [v1, v2, v3, v4, v5]
       // let navigationController = UINavigationController(rootViewController: tabBarController)
        self.present(tabBarController, animated: true, completion: nil)
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
