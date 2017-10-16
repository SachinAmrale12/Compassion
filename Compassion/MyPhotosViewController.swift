//
//  MyPhotosViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 13/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MyPhotosViewController: BaseButtonBarPagerTabStripViewController<PagerTabIconCell> {

    //MARK: View Outlets and Variables
    
    var itemInfo         = IndicatorInfo(title: "View")
    
    //MARK: View Methods
    
    let redColor = UIColor(red: 221/255.0, green: 0/255.0, blue: 19/255.0, alpha: 1.0)
    let unselectedIconColor = UIColor(red: 73/255.0, green: 8/255.0, blue: 10/255.0, alpha: 1.0)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        buttonBarItemSpec = ButtonBarItemSpec.nibFile(nibName: "PagerTabIconCell", bundle: Bundle(for: PagerTabIconCell.self), width: { _ in
            return 132.0
        })
    }
    
//    init(WithItemInfo itemInfo: IndicatorInfo) {
//        self.itemInfo = itemInfo
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
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
