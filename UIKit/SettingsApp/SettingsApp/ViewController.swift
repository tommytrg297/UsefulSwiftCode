//
//  ViewController.swift
//  SettingsApp
//
//  Created by Truong Tommy on 7/15/22.
//

import UIKit

struct Section {
    let title : String
    let options : [settingsOptionsType]
}
enum settingsOptionsType {
    case staticCell(model:settingsOption)
    case switchCell(model:settingsSwitchOption)
}
struct settingsSwitchOption {
    var isOn:Bool
    let title : String
    let icon : UIImage?
    let iconBackgroundColor : UIColor
    let handler :  (()-> Void)
    
}
struct settingsOption {
    let title : String
    let icon : UIImage?
    let iconBackgroundColor : UIColor
    let handler :  (()-> Void)
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
        case .staticCell(let model):
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SettingTableViewCell.identifier,
                for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        case .switchCell(let model) :
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SwitchTableViewCell.identifier,
                for: indexPath) as? SwitchTableViewCell else {
                    return UITableViewCell()
                }
            cell.configure(with: model)
            return cell
        }
    }
    
    private let tableView : UITableView = {
        var table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()
    
    var models = [Section]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func configure () {
        models.append(Section(title: "Bluetooth", options: [
            .switchCell(model: settingsSwitchOption(isOn: false,
                                                    title: "bluetooth",
                                                    icon: UIImage(systemName: "bluetooth"),
                                                    iconBackgroundColor: .systemBlue, handler: {
                                                        print("toggled")
                                                    }))]))
        models.append(Section(title: "General", options: [
            .staticCell(model:settingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
                print("Tapped on wifi first")
            }),
            .staticCell(model:settingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
                
            }),
            .staticCell(model:settingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .yellow){
                
            }),
            .staticCell(model:settingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
                
            })
        ]))
                      
        models.append(Section(title: "Information", options:[
            .staticCell(model:settingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink){
              
          }),
            .staticCell(model:settingsOption(title: "Bluetooth", icon: UIImage(systemName: "bluetooth"), iconBackgroundColor: .link){
              
          }),
            .staticCell(model:settingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .yellow){
              
          }),
            .staticCell(model:settingsOption(title: "iCloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange){
              
          })
        ]))
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .staticCell(let model):
            model.handler()
        case .switchCell(let model) :
            model.handler()
        }
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }


}

