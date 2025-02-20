//
//  ViewController.swift
//  MultiModuleApp
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit
import ChatModule
import PayModule

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func showChatModule(_ sender: Any) {
        ChatModuleManager.share.showChat(rootVC: self)
    }
    
    @IBAction func showPayModule(_ sender: Any) {
        PayModuleManager.share.showPayModule(rootVC: self)
    }
}

