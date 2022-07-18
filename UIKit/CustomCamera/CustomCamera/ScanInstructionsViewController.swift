//
//  ScanInstructionsViewController.swift
//  CustomCamera
//
//  Created by Truong Tommy on 7/14/22.
//

import UIKit

class ScanInstructionsViewController: UIViewController {
    
    private let capturedImage : UIImage
    
    let retakePhotoButton : UIButton = {
        var button = UIButton()
        button.setTitle("Chup Lai", for: .normal)
        button.configuration = .primary()
        return button
    }()
    let continueButton : UIButton = {
        var button = UIButton()
        button.setTitle("Tiep tuc", for: .normal)
        button.configuration = .primary()
        return button
    }()
    let instructions : UILabel = {
        var label = UILabel()
        label.text = "Can cuoc cong dan (mac truoc)"
        label.font = .boldSystemFont(ofSize: 10)
        return label
    }()

    
    init(capturedImage : UIImage) {
        self.capturedImage = capturedImage
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        view.addSubview(instructions)
        let imageView = UIImageView(image: capturedImage)
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 30, y: 110, width: 200, height: 200)
        view.addSubview(retakePhotoButton)
        retakePhotoButton.frame = CGRect(x: 0,
                                         y: view.safeAreaInsets.bottom - 150,
                                         width: 200,
                                         height: 50)
        retakePhotoButton.addTarget(self, action: #selector(didTapRetake), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        instructions.frame = CGRect(x: 0, y: 100, width: 200, height: 200)
//      chupLaiButton.frame = CGRect(x: 20, y: 200, width: 100, height: 100)
    }
        @objc private func didTapRetake() {
        let main = ViewController()
        let vc = UINavigationController(rootViewController: main)
        vc.modalPresentationStyle = .fullScreen
        present(vc,animated: true)
    }
    
    @objc private func didTapBack() {
        dismiss(animated: true)
    }
}


