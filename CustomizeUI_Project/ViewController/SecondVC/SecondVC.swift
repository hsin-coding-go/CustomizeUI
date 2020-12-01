//
//  SecondVC.swift
//  CustomizeUI_Project
//
//  Created by ＵＳＥＲ on 2019/12/11.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var firstTabView: UIView!
    @IBOutlet weak var pointerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let originalPosition = self.pointerView.center.x // default is 69
               
       let swipeRight = UISwipeGestureRecognizer(target:self, action:#selector(swipeAction(_:)))
       swipeRight.direction = .right
       swipeRight.numberOfTouchesRequired = 1
       
       let swipeLeft = UISwipeGestureRecognizer(target:self, action:#selector(swipeAction(_:)))
       swipeLeft.direction = .left
       swipeLeft.numberOfTouchesRequired = 1
       
       self.view.addGestureRecognizer(swipeRight)
       self.view.addGestureRecognizer(swipeLeft)
    }
    
    
    @IBAction func firstTabAction(_ sender: Any) {
         self.tabMove(tabNumber: 1)
    }
    
    @IBAction func secondTabAction(_ sender: Any) {
        self.tabMove(tabNumber: 2)
    }
    
    
    @IBAction func thirdTabAction(_ sender: Any) {
        self.tabMove(tabNumber: 3)
    }
    
    // MARK: UISwipeGestureRecognizer
    
     @objc func swipeAction(_ recognizer:UISwipeGestureRecognizer) {
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
    
        if recognizer.direction == .right {
            
            if (self.pointerView.center.x - self.firstTabView.frame.size.width) > 0 {
                self.swipeLeftMove()
            }
        }
        
        if recognizer.direction == .left {
             if (self.pointerView.center.x + self.firstTabView.frame.size.width) < screenWidth {
                self.swipeRightMove()
            }
        }
    }
    
    
    func swipeRightMove() {
        UIView.animate(withDuration: 0.5) {
                    self.pointerView.center.x += self.firstTabView.frame.size.width
        }
    }
    
     func swipeLeftMove() {
        UIView.animate(withDuration: 0.5) {
                    self.pointerView.center.x -= self.firstTabView.frame.size.width
        }
    }
    
    
    
    func tabMove(tabNumber:Float) {
        print(self.pointerView.center.x)
        
        let currentPosition = Float(self.pointerView.center.x)
        let standardPosition = Float(self.firstTabView.frame.size.width)
        let position = 1 + (currentPosition - 69) / standardPosition
        let diff = tabNumber - position
        
        if diff > 0 {
            // 往右移
            UIView.animate(withDuration: 0.5) {
                self.pointerView.center.x += self.firstTabView.frame.size.width * CGFloat(diff)
            }
        } else {
            // 往左移
            UIView.animate(withDuration: 0.5) {
                self.pointerView.center.x += self.firstTabView.frame.size.width * CGFloat(diff)
            }
        }
    }
        
    
}
