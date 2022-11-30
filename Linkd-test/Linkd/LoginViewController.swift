//
//  LoginViewController.swift
//  Linkd
//
//  Created by Rishabh Shah on 11/29/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {


    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        Auth.auth().signIn(withEmail:emailField.text!,password:passwordField.text!) {
                authResult,error in
                if let error = error as NSError? {
                    self.statusLabel.text = "\(error.localizedDescription)"
                    print("L")
                } else {
                    self.performSegue(withIdentifier: "showProfileSegue", sender: nil)
                    self.statusLabel.text = ""
                    print("SUCCESS")
                }
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        self.statusLabel.text = ""
        self.statusLabel.textAlignment = .center

        // Do any additional setup after loading the view.
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
