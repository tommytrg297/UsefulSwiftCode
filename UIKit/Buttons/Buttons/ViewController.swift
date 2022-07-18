//
//  ViewController.swift
//  Buttons
//
//  Created by Truong Tommy on 7/15/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
    }
                                                 
    func createButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center = view.center
        button.configuration = .primary()

        view.addSubview(button)
    }
}


    
    
extension UIButton.Configuration {
    static func primary() -> UIButton.Configuration {
        var config : UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemPink
        config.title = "Start Free Trial"
        config.subtitle = "Free for 1 month"
        config.titleAlignment = .center
        config.cornerStyle = .medium
//      config.showsActivityIndicator = true
        return config
    }
}























































