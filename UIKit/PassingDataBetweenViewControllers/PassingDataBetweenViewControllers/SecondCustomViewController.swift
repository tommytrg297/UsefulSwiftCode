//
//  SecondCustomViewController.swift
//  PassingDataBetweenViewControllers
//
//  Created by Truong Tommy on 7/6/22.
//

import UIKit

class SecondCustomViewController: UIViewController {


    
    private let selectedItem : String
    private let relatedItems: [String]
    
    
    init(selectedItem : String, relatedItems: [String]) {
        self.selectedItem = selectedItem
        self.relatedItems = relatedItems
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedItem.uppercased()
        view.backgroundColor = .systemGreen
        
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.textAlignment = .center
        label.numberOfLines = -1
        for item in relatedItems {
            label.text = (label.text ?? "") + " " + item
        }

    }
    

}
