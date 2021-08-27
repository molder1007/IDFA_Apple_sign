//
//  ViewControllerButtons.swift
//  IDFA_Apple_sign
//
//  Created by Molder on 2021/8/27.
//

import UIKit
import AuthenticationServices

class ViewControllerButtons: UIViewController {

    @IBOutlet weak var appleSignInView1: UIView!
    @IBOutlet weak var appleSignInView2: UIView!
    @IBOutlet weak var appleSignInView3: UIView!
    @IBOutlet weak var appleSignInView4: UIView!
    @IBOutlet weak var appleSignInView5: UIView!
    @IBOutlet weak var appleSignInView6: UIView!
    @IBOutlet weak var appleSignInView7: UIView!
    @IBOutlet weak var appleSignInView8: UIView!
    @IBOutlet weak var appleSignInView9: UIView!
    @IBOutlet weak var appleSignInView10: UIView!
    @IBOutlet weak var appleSignInView11: UIView!
    @IBOutlet weak var appleSignInView12: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppleButton()
    }

    /// 建立 apple id 登入 button
    func setAppleButton() {
        let authorizationAppleIDButton1: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .white)
        authorizationAppleIDButton1.frame = self.appleSignInView1.bounds
        self.appleSignInView1.addSubview(authorizationAppleIDButton1)
        
        let authorizationAppleIDButton2: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .white)
        authorizationAppleIDButton2.frame = self.appleSignInView2.bounds
        self.appleSignInView2.addSubview(authorizationAppleIDButton2)
        
        let authorizationAppleIDButton3: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signUp, authorizationButtonStyle: .white)
        authorizationAppleIDButton3.frame = self.appleSignInView3.bounds
        self.appleSignInView3.addSubview(authorizationAppleIDButton3)
        
        let authorizationAppleIDButton4: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .white)
        authorizationAppleIDButton4.frame = self.appleSignInView4.bounds
        self.appleSignInView4.addSubview(authorizationAppleIDButton4)
        
        let authorizationAppleIDButton5: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .whiteOutline)
        authorizationAppleIDButton5.frame = self.appleSignInView5.bounds
        self.appleSignInView5.addSubview(authorizationAppleIDButton5)
        
        let authorizationAppleIDButton6: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .whiteOutline)
        authorizationAppleIDButton6.frame = self.appleSignInView6.bounds
        self.appleSignInView6.addSubview(authorizationAppleIDButton6)
        
        let authorizationAppleIDButton7: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signUp, authorizationButtonStyle: .whiteOutline)
        authorizationAppleIDButton7.frame = self.appleSignInView7.bounds
        self.appleSignInView7.addSubview(authorizationAppleIDButton7)
        
        let authorizationAppleIDButton8: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .whiteOutline)
        authorizationAppleIDButton8.frame = self.appleSignInView8.bounds
        self.appleSignInView8.addSubview(authorizationAppleIDButton8)
        
        let authorizationAppleIDButton9: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signIn, authorizationButtonStyle: .black)
        authorizationAppleIDButton9.frame = self.appleSignInView9.bounds
        self.appleSignInView9.addSubview(authorizationAppleIDButton9)
        
        let authorizationAppleIDButton10: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .continue, authorizationButtonStyle: .black)
        authorizationAppleIDButton10.frame = self.appleSignInView10.bounds
        self.appleSignInView10.addSubview(authorizationAppleIDButton10)
        
        let authorizationAppleIDButton11: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .signUp, authorizationButtonStyle: .black)
        authorizationAppleIDButton11.frame = self.appleSignInView11.bounds
        self.appleSignInView11.addSubview(authorizationAppleIDButton11)
        
        let authorizationAppleIDButton12: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        authorizationAppleIDButton12.frame = self.appleSignInView12.bounds
        self.appleSignInView12.addSubview(authorizationAppleIDButton12)
    }

}


