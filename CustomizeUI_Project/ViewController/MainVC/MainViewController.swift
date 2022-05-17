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
    
    
    @IBAction func toForthVC(_ sender: Any) {
        let settingVC = SettingViewController()
////        self.navigationController?.pushViewController(settingVC, animated: true)
//
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
//        present(settingVC, animated: false, completion: nil)
        settingVC.modalPresentationStyle = .overFullScreen
        self.presentDetail(settingVC)
    }
    
    
}

extension UIViewController {

    func presentDetail(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)

        present(viewControllerToPresent, animated: false)
    }

    func dismissDetail() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)

        dismiss(animated: false)
    }
}
