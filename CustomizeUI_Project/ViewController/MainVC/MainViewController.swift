//
//  MainViewController.swift
//  CustomizeUI_Project
//
//  Created by ＵＳＥＲ on 2019/12/11.
//  Copyright © 2019 hsin_project. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func toFirstVC(_ sender: Any) {
        let next = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func toSecondVC(_ sender: Any) {
        let next = SecondVC()
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func toThirdVC(_ sender: Any) {
        let next = ThirdVC()
        self.navigationController?.pushViewController(next, animated: true)
    }
    
    
}
