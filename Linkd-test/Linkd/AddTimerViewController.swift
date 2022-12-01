//
//  AddTimerViewController.swift
//  DuganTrevorHW7
//
//  Created by Macbook Pro 15 on 11/1/22.
//

import UIKit

var timers = [Timer]()

class Timer{
    var event:String
    var location:String
    var remainingTime:Int
    
    init(event:String, location:String, remainingTime:Int) {
        self.event = event
        self.location = location
        self.remainingTime = remainingTime
    }
}

class AddTimerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
    @IBOutlet weak var eventName: UITextField!
    @IBOutlet weak var locationName: UITextField!
    @IBOutlet weak var totalTime: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        
        let event = eventName.text
        let location = locationName.text
        let remainingTime = Int(totalTime.text!)
        
        if event != nil && location != nil && remainingTime != nil{
            let newTimer = Timer(event: event!, location: location!, remainingTime: remainingTime!)
            timers.append(newTimer)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
