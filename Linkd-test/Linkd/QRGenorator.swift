//
//  QRGenorator.swift
//  Linkd
//
//  Created by Sam Kartiganer on 11/29/22.
//

import UIKit
import FirebaseAuth
import CoreData

let apDelegate = UIApplication.shared.delegate as! AppDelegate
let ontext = appDelegate.persistentContainer .viewContext

class QRGenorator: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBOutlet var TestQR: UIImageView!
    
    @IBAction func QRgen(_ sender: Any) {
        
        let website = "place holder"
        
        let controller = UIAlertController(title: "Add your URL", message: "to link", preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        controller.addTextField(configurationHandler: {
            (textField:UITextField!) in
            textField.placeholder = "Enter somthing"
        })
        
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) in
            if let textFieldArray = controller.textFields {
                let textFields = textFieldArray as [UITextField]
                let enteredText = textFields[0].text
                let image = generateQRCode(from: "\(enteredText)")
                
                self.TestQR.image = image
                self.clearCoreData()
                let pngImageData = image?.pngData()
                let QR = NSEntityDescription.insertNewObject(forEntityName: "QRcode", into: context)
                QR.setValue(pngImageData, forKey: "storedImage")
            }
        }))
        func generateQRCode(from string: String) -> UIImage? {
            let data = string.data(using: String.Encoding.ascii)

            if let filter = CIFilter(name: "CIQRCodeGenerator") {
                filter.setValue(data, forKey: "inputMessage")
                let transform = CGAffineTransform(scaleX: 3, y: 3)

                if let output = filter.outputImage?.transformed(by: transform) {
                    return UIImage(ciImage: output)
                }
            }

            return nil
        }
        
        present(controller, animated: true)
//
//        let image = generateQRCode(from: "\(website)")
//
//        TestQR.image = image
    }
    func clearCoreData() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "QRcode")
        var fetchedResults:[NSManagedObject]
        
        do {
            try fetchedResults = context.fetch(request) as! [NSManagedObject]
            
            if fetchedResults.count > 0 {
                for result:AnyObject in fetchedResults {
                    context.delete(result as! NSManagedObject)
                    print("\(result.value(forKey: "name")!) has been deleted")
                }
            }
            saveContext()
            
        } catch {
            // if an error occurs
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            abort()
        }
        
    }
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
