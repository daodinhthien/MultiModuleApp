//
//  ItemCell.swift
//  ChatModule
//
//  Created by ThienDD9 on 21/02/2025.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setData(model: Person?) {
        idLabel.text = "ID:"
        if let model = model, let id = model.userId {
            idLabel.text = "ID: \(id)"
        }
        contentLabel.text = model?.title
    }
}
