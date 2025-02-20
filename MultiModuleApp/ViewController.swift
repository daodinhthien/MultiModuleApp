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

    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getInfoView(payService: PayModuleService(), chatService: ChatModuleService())
    }


    @IBAction func showChatModule(_ sender: Any) {
        ChatModuleManager.share.showChat(rootVC: self)
    }
    
    @IBAction func showPayModule(_ sender: Any) {
        PayModuleManager.share.showPayModule(rootVC: self)
    }
    
    private func getInfoView(payService: PayModuleServiceProtocol, chatService: ChatModuleProtocol) {
        let message = chatService.getMessage() ?? ""
        let name = payService.getName() ?? ""
        contentLabel.text = message + " " + name
    }
}

