//
//  SettingViewController.swift
//  CustomizeUI_Project
//
//  Created by Starly Chen on 17/5/2022.
//  Copyright © 2022 hsin_project. All rights reserved.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    private let baseView: UIView = {
        let baseView = UIView()
        baseView.backgroundColor = .blue
        return baseView
    }()
    
    private let backButton: UIButton = {
        let backButton = UIButton()
        backButton.backgroundColor = .red
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return backButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        
    }
    
    @objc func backAction(sender: UIButton!) {
        self.dismissDetail()
     }
    
    func setupViews() {
        self.view.addSubview(baseView)
        self.baseView.addSubview(backButton)
    }
    
    func setupConstraints() {
        
        baseView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.bottom.equalToSuperview()
//            make.width.equalToSuperview().offset(self.view.snp.width)
            make.width.equalTo(300)
        }
        
        backButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview()
            make.width.equalTo(50)
        }
        
    }

}
