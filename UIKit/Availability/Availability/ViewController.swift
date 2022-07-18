//
//  ViewController.swift
//  Availability
//
//  Created by Truong Tommy on 7/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue

        if #available(iOS 14, *){
            navigationItem.backButtonDisplayMode = .generic
        }else {
            navigationItem.backButtonTitle = ""
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            let vc = ViewController()
            vc.view.backgroundColor = .systemOrange
            vc.modalPresentationStyle = .automatic
            self.present(vc, animated: true)
        }
    }
    
    
//    @available(iOS 14,*)
//    func ios14()  {
//
//    }


}

