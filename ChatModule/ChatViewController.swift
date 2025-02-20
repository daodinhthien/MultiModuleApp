//
//  ChatViewController.swift
//  ChatModule
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit

class ChatViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat Module"
        addRightButton()
        addLeftButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}
