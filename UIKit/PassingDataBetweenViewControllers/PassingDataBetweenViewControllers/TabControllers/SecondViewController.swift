//
//  SecondViewController.swift
//  PassingDataBetweenViewControllers
//
//  Created by Truong Tommy on 7/6/22.
//

import UIKit

//Completion Handler Model
class SecondViewController: UIViewController {
    
    let label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Name: "
        return label
    }()
    
    private var observer:NSObjectProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(label)
        label.frame = CGRect(  x: 0,
                               y: 50,
                               width: view.frame.size.width,
                               height: 100)
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(button)
        button.center = view.center
        button.setTitle("Set Name", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("ourCustom"),
                                                   object: nil,
                                                   queue: .main,
                                                   using: { notification in
            guard let object = notification.object as? [String:UIColor] else { return  }
            guard let color = object["color"] else { return }
            self.view.backgroundColor = color
            
        })
    }
    
    @objc private  func didTapButton(){
        let textEntry =  TextEntryViewController()
        
        textEntry.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        
        let vc = UINavigationController(rootViewController: textEntry)
        present(vc, animated: true )
    }


}
