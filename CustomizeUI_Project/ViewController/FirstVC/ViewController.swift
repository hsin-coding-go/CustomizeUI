//
//  ViewController.swift
//  CustomizeUI_Project
//
//  Created by ＵＳＥＲ on 2019/9/24.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var firstPageBtn: UIButton!
    @IBOutlet weak var secondPageBtn: UIButton!
    @IBOutlet weak var thirdPageBtn: UIButton!
    @IBOutlet weak var forthPageBtn: UIButton!
    @IBOutlet weak var fifthPageBtn: UIButton!
    @IBOutlet weak var sixthPageBtn: UIButton!
    
    @IBOutlet weak var firstPageImage: UIImageView!
    @IBOutlet weak var secondPageImage: UIImageView!
    @IBOutlet weak var thirdPageImage: UIImageView!
    @IBOutlet weak var forthPageImage: UIImageView!
    @IBOutlet weak var fifthPageImage: UIImageView!
    @IBOutlet weak var sixthPageImage: UIImageView!
    
    @IBOutlet weak var vcView: UIView!
    @IBOutlet weak var myScrollView: UIScrollView!
    
    var arr = [Any]()
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = false

        
        let firstVC = FirstViewController()
        firstVC.view.backgroundColor = UIColor.red
        let secondVC = FirstViewController()
        secondVC.view.backgroundColor = UIColor.orange
        let thirdVC = FirstViewController()
        thirdVC.view.backgroundColor = UIColor.yellow
        let forthVC = FirstViewController()
        forthVC.view.backgroundColor = UIColor.green
        let fifthVC = FirstViewController()
        fifthVC.view.backgroundColor = UIColor.blue
        let sixthVC = FirstViewController()
        sixthVC.view.backgroundColor = UIColor.purple
        
        arr = [firstVC,secondVC,thirdVC,forthVC,fifthVC,sixthVC]
        let vc = arr[0] as! FirstViewController
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipeRight(_:)))
        swipeRight.direction = .left
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipeLeft(_:)))
        swipeLeft.direction = .right
        self.vcView.addGestureRecognizer(swipeRight)
        self.vcView.addGestureRecognizer(swipeLeft)
        self.vcView.addSubview(vc.view)
        hiddenAllPageUI()
        //先註冊
        NotificationCenter.default.addObserver(self, selector: #selector(pageUIChange(notification:)), name: NSNotification.Name(rawValue: "UpdateUI") , object: nil)
    }
    
    
    
    
    
    
    @objc func pageUIChange(notification: Notification)  {
        //接受響應
        guard let userInfo = notification.userInfo else { return  }
        guard let page: Int = userInfo["currentPage"] as? Int else { return  }
       
        var pageCGPoint = 35 * (page + 1)
        if page == 0 {
            pageCGPoint = 0
        }
        let position = CGPoint.init(x: pageCGPoint, y: 0)
        myScrollView.setContentOffset(position, animated: true)
        
        hiddenAllPageUI()
        switch page {
        case 0:
            firstPageImage.isHidden = false
            break
        case 1:
            secondPageImage.isHidden = false
            break
        case 2:
            thirdPageImage.isHidden = false
            break
        case 3:
            forthPageImage.isHidden = false
            break
        case 4:
            fifthPageImage.isHidden = false
            break
        case 5:
            sixthPageImage.isHidden = false
            break
            
        default:
            break
        }
    }
    
    func hiddenAllPageUI() {
        firstPageImage.isHidden = true
        secondPageImage.isHidden = true
        thirdPageImage.isHidden = true
        forthPageImage.isHidden = true
        fifthPageImage.isHidden = true
        sixthPageImage.isHidden = true
    }
    
    @IBAction func pageBtnAction(_ sender: UIButton) {
        
        currentPage = sender.tag
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UpdateUI"), object: self, userInfo:["currentPage":self.currentPage])
        
        for vc in self.vcView.subviews {
                   vc.removeFromSuperview()
               }
        let vc = arr[sender.tag] as! FirstViewController
        let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipeRight(_:)))
        swipeRight.direction = .left
        let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipeLeft(_:)))
        swipeLeft.direction = .right
        self.vcView.addGestureRecognizer(swipeRight)
        self.vcView.addGestureRecognizer(swipeLeft)
        self.vcView.addSubview(vc.view)
    }
    
    
    @objc func swipeRight(_ recognizer:UISwipeGestureRecognizer){
            
        currentPage += 1
        if(currentPage == arr.count) {
            currentPage = 0
        }
        let vc = arr[currentPage] as! FirstViewController
        self.vcView.addSubview(vc.view)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UpdateUI"), object: self, userInfo:["currentPage":self.currentPage])
    }
    
    
    @objc func swipeLeft(_ recognizer:UISwipeGestureRecognizer){
            print("swipe ok")
        currentPage -= 1
        if(currentPage < 0) {
            currentPage = 5
        }
        let vc = arr[currentPage] as! FirstViewController
        self.vcView.addSubview(vc.view)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "UpdateUI"), object: self, userInfo:["currentPage":self.currentPage])
    }
}

