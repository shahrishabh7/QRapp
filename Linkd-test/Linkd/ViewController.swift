//
//  ViewController.swift
//  Linkd
//
//  Created by Julian Wearden on 11/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = UIImage(named: "linkd-long-logo")
        mainImage.image = image
    }


}
