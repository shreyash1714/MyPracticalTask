//
//  ImagesVC.swift
//  PracticalTask
//
//  Created by 2022M27 on 26/02/24.
//

import Foundation
import UIKit
import GoogleSignIn

class ProfileVC : UIViewController {
    
    //MARK: OUTLETS-
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnGoogleSignOut: UIButton!
    
    //MARK: CUSTOM VARIABLES-
    
    
    //MARK: CUSTOM METHODS-
    
    func setdata() {
        
    }
    
    func setup() {
        
    }
    
    func applystyle() {
        self.btnGoogleSignOut.layer.cornerRadius = 5
        self.lblName.text = GIDSignIn.sharedInstance.currentUser?.profile?.name
        self.lblEmail.text = GIDSignIn.sharedInstance.currentUser?.profile?.email
    }
    
    //MARK: ACTIONS-
    
    @IBAction func btnSignedOutTapped(_ sender: UIButton) {
        UserDefaultsConfig.isLogin = false
        UIApplication.shared.manageLogin()
        GIDSignIn.sharedInstance.disconnect()
        
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

