//
//  PayModuleManager.swift
//  PayModule
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit

@objc public class PayModuleManager: NSObject {
    @objc public static let share = PayModuleManager()
    private override init() {}
    
    @objc public func showPayModule(rootVC: UIViewController) {
        let bundle = Bundle(identifier: "com.thiendd.PayModule")
        let vc = PayViewController(nibName: "PayViewController", bundle: bundle)
        let nav = UINavigationController(rootViewController: vc)
        nav.isNavigationBarHidden = false
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .crossDissolve
        rootVC.present(nav, animated: false)
    }
}
