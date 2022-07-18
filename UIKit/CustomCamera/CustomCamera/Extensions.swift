//
//  Extensions.swift
//  CustomCamera
//
//  Created by Truong Tommy on 7/15/22.
//

import Foundation
import UIKit

extension UIButton.Configuration {
    static func primary() -> UIButton.Configuration {
        var config : UIButton.Configuration = .filled()
        config.baseBackgroundColor = .systemPurple
        config.titleAlignment = .center
        config.cornerStyle = .medium
//      config.showsActivityIndicator = true
        return config
    }
}

extension CGColor {
    static let backgroundPurple = CGColor(red: 248, green: 225, blue: 255, alpha: 1)
}

extension UIColor {
    static let backgroundPurple = UIColor(red: 248, green: 225, blue: 255, alpha: 1)
}
