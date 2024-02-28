//
//  ViewController.swift
//  PracticalTask
//
//  Created by 2022M27 on 26/02/24.
//

import UIKit
import GoogleSignIn

class LogInVC: UIViewController {
    
    //MARK: OUTLETS-
    
    @IBOutlet weak var lblDes: UILabel!
    @IBOutlet weak var btnGoogleSignIn: UIButton!
    
    //MARK: CUSTOM VARIABLES-
    
    //MARK: CUSTOM METHODS-
    
    func setdata() {
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            // Handle sign-in error
            print("Google Sign-In error: \(error.localizedDescription)")
            return
        }
        
        // Sign-in successful, get user data
        guard let profile = user.profile else {
            print("User profile data not available.")
            return
        }
        
        // Save user data to UserDefaults or CoreData
        // Save other user data as needed
        
        // Perform any additional actions after successful sign-in
        // For example, navigate to the main screen or update UI
    }
    
    func setup() {
        
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error = error {
                    // Handle the error
                    print("Error restoring previous sign-in: \(error.localizedDescription)")
                } else if user != nil {
                    // User restored successfully
                    print("User restored: \(user.debugDescription)")
                } else {
                    // No previous sign-in found
                    print("No previous sign-in found.")
                }
            }
        }
    }
    
    func applystyle() {
        
        self.btnGoogleSignIn.layer.cornerRadius = 5
        
    }
    
    //MARK: ACTIONS-
    
    @IBAction func btnGoogleSignInTapped(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            self.btnGoogleSignIn.isHidden = false
            self.lblDes.text = "Welcome To GoogleSignIn! To continue with GoogleSignIn please hit below button. "
            guard error == nil else { return }
            
            guard let signInResult = signInResult else { return }
            let user = signInResult.user
            
            let fullName = user.profile?.name
            
            self.lblDes.text = "Hi \(fullName ?? "")"
            UserDefaultsConfig.isLogin = true
            UIApplication.shared.manageLogin()
            self.btnGoogleSignIn.isHidden = true
            
        }
    }
    
    //MARK: VIEW LIFE CYCLE-
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.applystyle()
        self.setdata()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
}
