//
//  HomeViewController.swift
//  Compassion
//
//  Created by Sachin Amrale on 12/10/17.
//  Copyright © 2017 Sachin Amrale. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate {

    //MARK: View Outlets and Variables
    
    @IBOutlet weak var colletionView        : UICollectionView!
    @IBOutlet weak var eventLabel           : UILabel!
    @IBOutlet weak var notificationImage    : UIImageView!
    @IBOutlet weak var childImage           : UIImageView!
    
    var childImageArray                     = [String]()
    
    //MARK: View Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInitialization()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews()
    {
        childImage.layer.cornerRadius = childImage.layer.frame.size.width / 2
        childImage.clipsToBounds = true
    }
    
    func commonInitialization()
    {
        self.colletionView.delegate = self
        self.colletionView.dataSource = self
        self.eventLabel.attributedText = self.attributedText(string: "CHOOSE YOUR EVENT : RUN,WALK OR CYCLE")
        self.notificationImage.layer.cornerRadius = self.notificationImage.frame.height / 2
        self.notificationImage.layer.masksToBounds = true
        self.childImageArray.append("yaneth1")
        self.childImageArray.append("yaneth2")
        self.childImageArray.append("yaneth3")
        self.childImageArray.append("yaneth4")
        self.childImageArray.append("yaneth5")
        
        childImage.image = UIImage(named: "childImage")
        childImage.layer.borderWidth = 3
        childImage.layer.borderColor = UIColor(red: (16.0/255.0), green: (86.0/255.0), blue: (165.0/255.0), alpha: 1.0).cgColor
    }
    
    //MARK: Custom String Attribute Method
    
    func attributedText(string :String) -> NSAttributedString
    {
        let string = string as NSString
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [NSFontAttributeName:UIFont.systemFont(ofSize: 11.0)])
        let boldFontAttribute = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 11.0)]
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "CHOOSE YOUR EVENT"))
        return attributedString
    }
    
    
    //MARK: ColletionView Delegate and Datasource Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return childImageArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "childCell", for: indexPath) as! ChildCollectionViewCell
        myCell.childImageView.image = UIImage(named: childImageArray[indexPath.row])
        myCell.childNameLabel.text = childImageArray[indexPath.row]
        if indexPath.row == 0
        {
            myCell.childImageView.alpha = 1.0
        }
        else
        {
            myCell.childImageView.alpha = 0.5
        }
        
//        if indexPath.row == 1 {
//            collectionView.selectItem(at: IndexPath(row:currentChild,section:0), animated: true, scrollPosition: .centeredHorizontally)
//            self.collectionView((collectionView), didSelectItemAt: IndexPath(row:currentChild,section:0))
//        }
        
        return myCell
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
//        currentChild = indexPath.row
//        if currentChild != previousChild {
//            let colcell = collectionView.cellForItem(at: indexPath) as? ChildCollectionViewCell
//            colcell?.Img.alpha = 1
//            
//            
//            let cell = self.blogTableView.dequeueReusableCell(withIdentifier: "singlechildcell", for: IndexPath(row:2,section:0)) as! singleChildTableViewCell;
//            cell.Namelbl.text = childName[currentChild]
//            cell.ageLbl.text = childAge[currentChild] + " years old"
//            
//            cell.childImage.sd_setImage(with: URL(string: childImg[indexPath.row]), placeholderImage: UIImage(named: "child4.png"))
//            //self.blogTableView.reloadRows(at: [IndexPath(row:2,section:0)], with: .none)
//            if previousChild < currentChild {
//                self.blogTableView.reloadRows(at: [IndexPath(row:2,section:0)], with: .left)
//            } else {
//                self.blogTableView.reloadRows(at: [IndexPath(row:2,section:0)], with: .right)
//            }
//            
//            self.tpChildImg.sd_setImage(with: URL(string: childImg[indexPath.row]), placeholderImage: UIImage(named: "load.jpg"))
//            self.tpChildName.text = childName[indexPath.row]
//            self.tpChildAge.text = childAge[indexPath.row] + " years old"
//            previousChild = currentChild
 //       }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        // if currentChild != previousChild {
//        let colcell = collectionView.cellForItem(at: indexPath) as?
//        ChildCollectionViewCell
//        colcell?.Img.alpha = 0.5
        // }
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
