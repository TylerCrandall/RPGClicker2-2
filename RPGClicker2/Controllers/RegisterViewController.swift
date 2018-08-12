//
//  RegisterViewController.swift
//  RPGClicker2
//
//  Created by Tyler Crandall on 8/12/18.
//  Copyright © 2018 TCrandall. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var txtEmail: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRegister_TouchUpInside(_ sender: Any) {
        if let email = txtEmail.text, let password = txtPassword.text
        {

            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                // ...
                
                if user != nil {
                 let vc = self.storyboard?.instantiateViewController(withIdentifier: "login")
                 self.present(vc!, animated: true, completion:nil)
                 }
                 else{
                 let alertController = UIAlertController(title:"Registration Failed!", message: (error?.localizedDescription)!, preferredStyle: UIAlertControllerStyle.alert)
                 let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
                 (result : UIAlertAction) -> Void in print("OK")
                 }
                 alertController.addAction(okAction)
                    self.present(alertController, animated:true, completion: nil)
            
            
            }
            
            
            
                }
            }
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
        txtUsername.resignFirstResponder()
        txtConfirmPassword.resignFirstResponder()
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
