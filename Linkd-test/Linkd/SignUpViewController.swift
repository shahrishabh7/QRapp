//
//  SignUpViewController.swift
//  Linkd
//
//  Created by Rishabh Shah on 11/29/22.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordField.isSecureTextEntry = true
        self.statusLabel.text = ""
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpClick(_ sender: Any) {
            Auth.auth().createUser(withEmail:emailField.text!,password:passwordField.text!) {
                authResult,error in
                if let error = error as NSError? {
                    self.statusLabel.text = "\(error.localizedDescription)"
                } else {
                    self.statusLabel.text = ""
                    self.performSegue(withIdentifier: "signUpSegue", sender: nil)
                }
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
