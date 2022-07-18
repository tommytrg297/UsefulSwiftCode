//
//  TextEntryViewController.swift
//  PassingDataBetweenViewControllers
//
//  Created by Truong Tommy on 7/6/22.
//

import UIKit

class TextEntryViewController: UIViewController {
    
    private let field : UITextField = {
        let field = UITextField()
        field.placeholder = "Enter name..."
        field.backgroundColor = .white
        return field
    }()
    
    public var completion : ((String?) -> Void)? 

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Enter name"
        view.backgroundColor = .lightGray
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapDoneButton))
        view.addSubview(field)
        field.frame = CGRect(x: 20,
                                 y: 100,
                                 width: view.frame.size.width - 40,
                                 height: 55)
        field.becomeFirstResponder()
    }
    
    @objc private func didTapDoneButton() {
        completion?(field.text)
        dismiss(animated: true, completion: nil)
    }
    


}
