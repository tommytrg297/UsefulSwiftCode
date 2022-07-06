//
//  ThirdViewController.swift
//  PassingDataBetweenViewControllers
//
//  Created by Truong Tommy on 7/6/22.
//

import UIKit

class ThirdViewController: UIViewController {
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        let button = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: 200,
                                            height: 50))
        view.addSubview(button)
        button.center = view.center
        button.backgroundColor = .blue
        button.setTitle("fire event", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        

    }
    
    @objc private func didTapButton() {
        NotificationCenter.default.post(name: Notification.Name("ourCustom"),
                                        object: ["color":UIColor.red])
        
        
    }


}
