//
//  LoginViewController.swift
//  RPGClicker2
//
//  Created by Tyler Crandall on 8/12/18.
//  Copyright © 2018 TCrandall. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {

    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnCreateAccount: UIButton!
    @IBOutlet weak var txtUsername: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnLogin_TouchUpInside(_ sender: Any){
        if let email = txtUsername.text, let password = txtPassword.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                // ...
                if user != nil {
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "welcome")
                    self.present(vc!, animated: true, completion: nil)
                }
                
                
                else{
                    let alertController = UIAlertController(title:"Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                        (result : UIAlertAction) -> Void in print("OK")
                    }
                }
            
            }
            
        }
    }
    
    
    @IBAction func btnCreateAccount_TouchUpInsid(_ sender: Any) {
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        txtUsername.resignFirstResponder()
        txtPassword.resignFirstResponder()
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
