//
//  WhatTFthisVCfor.swift
//  Linkd
//
//  Created by Sam Kartiganer on 11/29/22.
//

import UIKit

class WhatTFthisVCfor: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if lightingMode == "Dark"{
            view.overrideUserInterfaceStyle = .dark
        }
        if lightingMode == "Light"{
            view.overrideUserInterfaceStyle = .light
        }
        else{
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
