//
//  CountdownViewController.swift
//  DuganTrevorHW7
//
//  Created by Macbook Pro 15 on 11/1/22.
//

import UIKit
import Foundation

class CountdownViewController: UIViewController {
    
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    var test = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventLabel.text = timers[indexNum].event
        locationLabel.text = timers[indexNum].location
        self.remainingTimeLabel.text = String(timers[indexNum].remainingTime)
        // Do any additional setup after loading the view.
        let queue1 = DispatchQueue(label: "userQueue", qos: .userInitiated)
        test = false
        
        queue1.async {
            while timers[indexNum].remainingTime > 0 {
                sleep(1)
                timers[indexNum].remainingTime -= 1
                if self.test {
                    break
                }
                DispatchQueue.main.async {
                    self.remainingTimeLabel.text = String(timers[indexNum].remainingTime)
                }
            }
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        test = true
    }
}


