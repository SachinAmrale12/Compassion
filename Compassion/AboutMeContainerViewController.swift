//
//  AboutMeContainerViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 16/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit
import MXSegmentedPager

class AboutMeContainerViewController: UIViewController,MXSegmentedPagerDataSource,MXSegmentedPagerDelegate{

    var segmentedPager  = MXSegmentedPager()
    var headerView      : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.headerView = UINib(nibName: "AboutMeHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AboutMeHeaderView
        self.view.addSubview(self.segmentedPager)
        self.segmentedPager.dataSource = self
        self.segmentedPager.delegate = self
        self.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews()
    {
        self.view.layoutIfNeeded()
        self.segmentedPager.frame = self.view.bounds
        super.viewWillLayoutSubviews()
    }

    //MARK: Pager Methods
    
    func reloadData()
    {
        segmentedPager.backgroundColor = .white
        segmentedPager.parallaxHeader.view = headerView
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.height = 129
        segmentedPager.parallaxHeader.minimumHeight = 20
        
        segmentedPager.segmentedControl.selectionIndicatorLocation = .down
        segmentedPager.segmentedControl.backgroundColor = .white
        segmentedPager.segmentedControl.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]
        segmentedPager.segmentedControl.selectedTitleTextAttributes = [NSForegroundColorAttributeName : UIColor.black]
        segmentedPager.segmentedControl.selectionStyle = .textWidthStripe
        segmentedPager.segmentedControl.selectionIndicatorColor = UIColor(red: (34.0/255.0), green: (156.0/255.0), blue: (182.0/255.0), alpha: 1.0)
        self.segmentedPager.segmentedControlEdgeInsets = UIEdgeInsetsMake(12, 12, 12, 12);
    }
    
    func numberOfPages(in segmentedPager: MXSegmentedPager) -> Int {
        
        return 2
    }
    
    //    func segmentedPager(_ segmentedPager: MXSegmentedPager, attributedTitleForSectionAt index: Int) -> NSAttributedString
    //    {
    //        if index == 0
    //        {
    //            return NSMutableAttributedString(string: "My Life + Family", attributes: nil)
    //        }
    //        else
    //        {
    //            return NSMutableAttributedString(string: "My Photos", attributes: nil)
    //        }
    //    }
    
    func segmentedPager(_ segmentedPager: MXSegmentedPager, viewForPageAt index: Int) -> UIView
    {
        if index == 0
        {
            //let aboutMeVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutMeViewController") as! AboutMeViewController)
            //return aboutMeVC.view
            
            let aboutView = UINib(nibName: "View", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! TestView
            aboutView.frame = self.view.bounds
            return aboutView
        }
        else
        {
            let myPhotosVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyPhotosViewController") as! MyPhotosViewController)
            return myPhotosVC.view
         
        }
    }
    
    func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["My Life + Family", "My Photos"][index]
    }
    
    func heightForSegmentedControl(in segmentedPager: MXSegmentedPager) -> CGFloat
    {
        return 30.0
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
