//
//  PayViewController.swift
//  PayModule
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit
import CommonModule

class PayViewController: BaseViewController {

    @IBOutlet weak var contenTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Pay Module"
        addRightButton()
    }
    
    private func saveData(passWord: String) {
        let result = KeyChainService.share.saveToKeychain(service: KeychainServiceId.commonService.rawValue, account: "keyAccount", password: passWord)
        resultLabel.text = result ? " Lưu thành công" : "Lưu thất bại"
    }
    
    @IBAction func saveAction(_ sender: Any) {
        contenTextField.endEditing(true)
        if let pwd = contenTextField.text {
            saveData(passWord: pwd)
        }
        else {
            resultLabel.text = "Vui lòng nhập thông tin cần lưu"
        }
    }
    
    @IBAction func detailAction(_ sender: Any) {
        let vc = DetailViewController.instance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
