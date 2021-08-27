//
//  ViewController.swift
//  IDFA_Apple_sign
//
//  Created by Molder on 2021/8/11.
//

import UIKit
import AppTrackingTransparency
import AuthenticationServices

class ViewController: UIViewController {

    @IBOutlet weak var trackingButton: UIButton!
    @IBOutlet weak var appleSignInView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trackingButton.layer.cornerRadius = 5
        setAppleButton()
    }

    @IBAction func trackingAction(_ sender: Any) {
        trackingRequest()
    }
    
}

extension ViewController {
    
    /// 追蹤請求
    func trackingRequest() {
        // 詢問授權
        ATTrackingManager.requestTrackingAuthorization { (status) in
            // 得到授權狀態
            switch status {
            case .authorized:
                print("用戶允許")
            case .denied:
                print("用戶拒絕")
                // 如果用戶拒絕，導引用戶到手機的設定 -> Demo APP 裡
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                
                DispatchQueue.main.async {
                    if UIApplication.shared.canOpenURL(settingsUrl) {
                        UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                            print("Settings opened: \(success)")
                        })
                    }
                }
            case .notDetermined:
                print("用戶未作選擇")
            case .restricted:
                print("裝置受限制")
            default:
                print("其他")
            }
        }
    }
}

extension ViewController: ASAuthorizationControllerDelegate,
                          ASAuthorizationControllerPresentationContextProviding {
    
    /// 建立 apple id 登入 button
    func setAppleButton() {
        let authorizationAppleIDButton: ASAuthorizationAppleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
        authorizationAppleIDButton.frame = self.appleSignInView.bounds
        authorizationAppleIDButton.addTarget(self, action: #selector(self.appleSignIn), for: .touchUpInside)
        self.appleSignInView.addSubview(authorizationAppleIDButton)
    }
    
    /// apple id登入 客制button Action
    @objc private func appleSignIn() {
        let authorizationAppleIDRequest: ASAuthorizationAppleIDRequest = ASAuthorizationAppleIDProvider().createRequest()
        authorizationAppleIDRequest.requestedScopes = [.fullName, .email]
        let controller: ASAuthorizationController = ASAuthorizationController(authorizationRequests: [authorizationAppleIDRequest])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    /// 告知 ASAuthorizationController 該呈現在哪個 Window 上
    /// - Parameter controller:
    /// - Returns:
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    /// 授權成功
    /// - Parameters:
    ///   - controller:
    ///   - authorization:
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
            // 可以取得 fullName, Email, state, realUserStatus, authorizedScopes,
            // authorizationCode
            // NSString(data: appleIDCredential.authorizationCode!, encoding: String.Encoding.utf8.rawValue)
            // identityToken
            // NSString(data: appleIDCredential.identityToken!, encoding: String.Encoding.utf8.rawValue)
            // UID
            print(appleIDCredential.user)
            print(appleIDCredential.email ?? "noEmail")
        }
    }
    
    /// 授權失敗
    /// - Parameters:
    ///   - controller:
    ///   - error:
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        
        switch (error) {
        case ASAuthorizationError.canceled:
            break
        case ASAuthorizationError.failed:
            break
        case ASAuthorizationError.invalidResponse:
            break
        case ASAuthorizationError.notHandled:
            break
        case ASAuthorizationError.unknown:
            break
        default:
            break
        }
        
        print(error.localizedDescription)
    }
    
}
