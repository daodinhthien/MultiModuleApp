//
//  UIViewController+Extension.swift
//  LoadingModule
//
//  Created by ThienDD9 on 21/02/2025.
//

import UIKit

extension UIViewController {
    public func showLoading() {
        LoadingIndicator.shared.show()
    }

    public func hideLoading() {
        LoadingIndicator.shared.hide()
    }
}
