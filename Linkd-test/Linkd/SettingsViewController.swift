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

let settings = ["Lighting Mode", "Default Font", "Sign Out" ]

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
        
        // Do any additional setup after loading the view.
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
        tableView.deselectRow(at: indexPath, animated: true)
        
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
                })
            controller.addAction(lightAction)

            let darkAction = UIAlertAction(
                title: "Dark",
                style: .default,
                handler: {
                    action in lightingMode = "Dark"
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
                })
            controller.addAction(arialAction)

            let robotoAction = UIAlertAction(
                title: "Roboto",
                style: .default,
                handler: {
                    action in defaultFont = "Roboto"
                })
            controller.addAction(robotoAction)
            
            let defaultAction = UIAlertAction(
                title: "Default",
                style: .default,
                handler: {
                    action in defaultFont = "Default"
                })
            controller.addAction(defaultAction)
            
            present(controller, animated: true)
        }
        else if (row == 2){
            
        }
        else{
            
        }
        //storeData()
        defaults.set(lightingMode, forKey: "lightingType")
        defaults.set(defaultFont, forKey: "fontType")
        lightingMode = defaults.string(forKey: "lightingType")
        defaultFont = defaults.string(forKey: "fontType")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "privatePolicySegue" {
          let vc = segue.destination as? PrivatePolicyViewController
       }
    }
}


//let fetchedResults = retrieveLightingMode()
//let test = fetchedResults[0]
//
//public var lightingMode = ""
//public var defaultFont = ""
//func retrieveLightingMode() -> [NSManagedObject] {
//
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "LightingMode")
//    var fetchedResults:[NSManagedObject]? = nil
//    do {
//        try fetchedResults = context.fetch(request) as? [NSManagedObject]
//    } catch {
//        // if an error occurs
//        let nserror = error as NSError
//        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//        abort()
//    }
//    return(fetchedResults)!
//}
//
//let font = retrieveDefaultFont()
//public var defaultFont = font.
//
//func retrieveDefaultFont() -> [NSManagedObject] {
//
//    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DefaultFont")
//    var fetchedResults:[NSManagedObject]? = nil
//    do {
//        try fetchedResults = context.fetch(request) as? [NSManagedObject]
//    } catch {
//        // if an error occurs
//        let nserror = error as NSError
//        NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
//        abort()
//    }
//    return(fetchedResults)!
//}
