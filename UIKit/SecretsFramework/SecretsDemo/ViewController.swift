//
//  ViewController.swift
//  SecretsDemo
//
//  Created by Truong Tommy on 7/15/22.
//

import UIKit
import SecretsFramework

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let manager = SecretsManager(key: "12345")
        if let secret = manager.readSecret(){
            print(secret)
        }else {
            print("Nothing")
        }
    }
}

