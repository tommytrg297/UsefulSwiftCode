//
//  ViewController.swift
//  ViewDelegates
//
//  Created by Truong Tommy on 5/26/22.
//

import UIKit

class ViewController: UIViewController, NotificationsSettingViewDelegate {
    
    
    private let notificationsView = notificationSettingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        notificationsView.delegate = self
        view.addSubview(notificationsView)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        notificationsView.frame = CGRect(x: 10, y: view.safeAreaInsets.top,
                                         width: view.frame.size.width - 20,
                                         height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
    
    func didTapEnabledButton() {
        let alert = UIAlertController(title: "Enable Notifications", message: "MORE MESSAGES", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Added alert", style: .default,handler: nil))
        present(alert, animated: true )
    }
    


}

protocol NotificationsSettingViewDelegate : AnyObject {
    func didTapEnabledButton()
}

class notificationSettingView : UIView {
    weak var delegate : NotificationsSettingViewDelegate?
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell")
        imageView.tintColor = .systemBlue
        
        return imageView
    } ()
    
    private let label : UILabel = {
        let uiLabel = UILabel()
        uiLabel.text = "Stay up to date, enable Push Notif!"
        uiLabel.textAlignment = .center
        return uiLabel
    }()
    
    private let button : UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Enable Notfication", for: UIControl.State.normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        
        return button
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        addSubview(imageView)
        addSubview(label)
        addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: UIControl.Event.touchUpInside)

    }
    
    required init?(coder : NSCoder) {
        fatalError()
    }
    
    @objc private func didTapButton() {
        delegate?.didTapEnabledButton()
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = bounds.size.width / 2
        imageView.frame = CGRect(x: (bounds.size.width - imageSize) / 2  , y: 30, width: imageSize, height: imageSize)
        label.frame = CGRect(x: 10, y: 30 + imageSize + 20 , width: frame.size.width - 20, height: 100)
        button.frame = CGRect(x: 40, y: 160 + imageSize  , width: frame.size.width - 80, height: 200)

    }
}
