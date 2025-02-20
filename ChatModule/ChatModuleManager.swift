//
//  ChatModuleManager.swift
//  ChatModule
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit

@objc public class ChatModuleManager: NSObject {
    @objc public static let share = ChatModuleManager()
    private override init() {
        
    }
    
    @objc public func showChat(rootVC: UIViewController) {
        let bundle = Bundle(identifier: "com.thiendd.ChatModule")
        let vc = ChatViewController(nibName: "ChatViewController", bundle: bundle)
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = false
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        rootVC.present(nav, animated: true)
    }
}
