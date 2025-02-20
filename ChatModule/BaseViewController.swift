//
//  BaseViewController.swift
//  ChatModule
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavBar()
        if #available(iOS 13.0, *) {
            statusBarStyle = .darkContent
        } else {
            statusBarStyle = .default
        }
    }
    
    var statusBarStyle: UIStatusBarStyle = .default {
        didSet {
            setNeedsStatusBarAppearanceUpdate()
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return statusBarStyle
    }
    
    private func setNavBar() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.black]  // Chỉnh màu title
            appearance.configureWithTransparentBackground()
            appearance.shadowImage = UIImage()  // Loại bỏ bóng đổ
            //appearance.backgroundEffect = UIBlurEffect(style: .light) // (Tùy chọn) Thêm hiệu ứng làm mờ
            
            // Áp dụng appearance vào navigation bar
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        } else {
            // Dành cho các phiên bản iOS trước 13
            self.navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.black
            ]
            
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            self.navigationController?.navigationBar.shadowImage = UIImage()  // Xóa bóng đổ của navigation bar
            self.navigationController?.navigationBar.isTranslucent = true
        }
        
    }
    
    func addRightButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Xong", style: .done, target: self, action: #selector(onDone))
    }
    
    func addLeftButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(onBack))
    }
    
    @objc func onBack() {
        guard let vcs = self.navigationController?.viewControllers else {
            self.navigationController?.dismiss(animated: true)
            return
        }
        if vcs.count <= 1 {
            self.navigationController?.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func onDone() {
        guard let vcs = self.navigationController?.viewControllers else {
            self.navigationController?.dismiss(animated: true)
            return
        }
        if vcs.count <= 1 {
            self.navigationController?.dismiss(animated: true)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
}


