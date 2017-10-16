//
//  AboutMeViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 12/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class AboutMeViewController: BaseButtonBarPagerTabStripViewController<PagerTabIconCell>,UITableViewDelegate,UITableViewDataSource {

    //MARK: View Outlets and Variables
    
    
    @IBOutlet weak var yearLabel                : UILabel!
    @IBOutlet weak var countryView              : UIView!
    @IBOutlet weak var countryNameLabel         : UILabel!
    @IBOutlet weak var leftViewConstant         : NSLayoutConstraint!
    @IBOutlet weak var myPhotosButton           : UIButton!
    @IBOutlet weak var myLifeButton             : UIButton!
    @IBOutlet weak var viewLine                 : UIView!
    @IBOutlet weak var boyImageView             : UIImageView!
    @IBOutlet weak var tableView                : UITableView!
    
    private var pageController                  : UIPageViewController!
    private var arrVC                           :[UIViewController] = []
    private var currentPage                     : Int!
    var aboutMeVC:AboutMeViewController!        = nil
    var myPhotosVC:MyPhotosViewController!      = nil
    var itemInfo                                = IndicatorInfo(title: "View")
    
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
//        //super.init()
//        self.itemInfo = itemInfo
//    }
    
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
        self.myPhotosButton.imageView?.alpha = 0.5
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.countryNameLabel.text = "Dominican \nRepublic"
        
        settings.style.buttonBarBackgroundColor = redColor
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.selectedBarBackgroundColor = UIColor(red: 234/255.0, green: 234/255.0, blue: 234/255.0, alpha: 1.0)
        settings.style.selectedBarHeight = 4.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: PagerTabIconCell?, newCell: PagerTabIconCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.iconImage.tintColor = self?.unselectedIconColor
            newCell?.iconImage.tintColor = .white
        }
    }
    
    
    // MARK: - PagerTabStripDataSource
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
      
//        let child1 = AboutMeViewController(WithItemInfo: IndicatorInfo(title: "My Life + Family", image: UIImage(named: "myFamily")))
//        let child2 = MyPhotosViewController(WithItemInfo: IndicatorInfo(title: "My Photos", image: UIImage(named: "myPhoto")))
        let child1 = AboutMeViewController()
        let child2 = MyPhotosViewController()
        return [child1, child2]
    }
    
    override func configure(cell: PagerTabIconCell, for indicatorInfo: IndicatorInfo) {
        cell.iconImage.image = indicatorInfo.image?.withRenderingMode(.alwaysTemplate)
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        super.updateIndicator(for: viewController, fromIndex: fromIndex, toIndex: toIndex, withProgressPercentage: progressPercentage, indexWasChanged: indexWasChanged)
        if indexWasChanged && toIndex > -1 && toIndex < viewControllers.count {
            let child = viewControllers[toIndex] as! IndicatorInfoProvider // swiftlint:disable:this force_cast
            UIView.performWithoutAnimation({ [weak self] () -> Void in
                guard let me = self else { return }
                me.navigationItem.leftBarButtonItem?.title =  child.indicatorInfo(for: me).title
            })
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }
    
    //MARK: - TableView Delegate and Datasource Methods
    
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
    
    @IBAction func myLifeButtonClicked(_ sender: Any)
    {

    }
    
    @IBAction func myPhotosButtonClicked(_ sender: Any)
    {
    
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
