//
//  SettingsViewController.swift
//  Linkd
//
//  Created by Macbook Pro 15 on 11/28/22.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate
let context = appDelegate.persistentContainer.viewContext

let settings = ["Lighting Mode", "Default Font", "Push Notifications" ]

let defaults = UserDefaults.standard
public var lightingMode = defaults.string(forKey: "lightingType")
public var defaultFont = defaults.string(forKey: "fontType")


class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let textCellIdentifier = "TextCell"
    let settingSegueIdentifier = "SettingSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        lightingMode = defaults.string(forKey: "lightingType")
        if lightingMode == "Dark"{
            view.overrideUserInterfaceStyle = .dark
        }
        if lightingMode == "Light"{
            view.overrideUserInterfaceStyle = .light
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if lightingMode == "Dark"{
            view.overrideUserInterfaceStyle = .dark
        }
        else if lightingMode == "Light"{
            view.overrideUserInterfaceStyle = .light
        }
        else{
            view.overrideUserInterfaceStyle = .light
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        cell.textLabel?.text = settings[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        
        if (row == 0){
            let controller = UIAlertController(
                title: "Select Lighting Mode",
                message: "Please Choose a lighting mode",
                preferredStyle: .actionSheet)
            
            let lightAction = UIAlertAction(
                title: "Light",
                style: .default,
                handler: {
                    action in lightingMode = "Light"
                    defaults.set(lightingMode, forKey: "lightingType")
                    self.view.overrideUserInterfaceStyle = .light
                }
            )
            controller.addAction(lightAction)

            let darkAction = UIAlertAction(
                title: "Dark",
                style: .default,
                handler: {
                    action in lightingMode = "Dark"
                    defaults.set(lightingMode, forKey: "lightingType")
                    self.view.overrideUserInterfaceStyle = .dark
                })
            controller.addAction(darkAction)
            
            present(controller, animated: true)
        }
        else if (row == 1){
            let controller = UIAlertController(
                title: "Select a Default Font",
                message: "Please Choose a default font",
                preferredStyle: .actionSheet)
            
            let arialAction = UIAlertAction(
                title: "Arial",
                style: .default,
                handler: {
                    action in defaultFont = "Arial"
                    defaults.set(defaultFont, forKey: "fontType")
                })
            controller.addAction(arialAction)

            let robotoAction = UIAlertAction(
                title: "Roboto",
                style: .default,
                handler: {
                    action in defaultFont = "Roboto"
                    defaults.set(defaultFont, forKey: "fontType")
                })
            controller.addAction(robotoAction)
            
            let defaultAction = UIAlertAction(
                title: "Default",
                style: .default,
                handler: {
                    action in defaultFont = "Default"
                    defaults.set(defaultFont, forKey: "fontType")
                })
            controller.addAction(defaultAction)
            
            present(controller, animated: true)
        }
        else if (row == 2){
            UNUserNotificationCenter.current().requestAuthorization(options:[.alert,.badge,.sound]) {
                granted, error in
                if granted {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
        else{
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "privatePolicySegue" {
          let vc = segue.destination as? PrivatePolicyViewController
       }
    }
    
    @IBAction func recognizeLongPress(_ sender: Any) {
        performSegue(withIdentifier: "toReqFull", sender: nil)
    }
}


