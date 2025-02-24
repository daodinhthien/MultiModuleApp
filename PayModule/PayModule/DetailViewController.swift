//
//  DetailViewController.swift
//  PayModule
//
//  Created by ThienDD9 on 24/02/2025.
//

import UIKit

class FirstViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
}

class ThirdViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .orange
    }
}

class DetailViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Pay Detail"
        addLeftButton()
        
        // Tạo các ViewController
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        // Tạo Tab Bar Items
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "star.fill"), tag: 0)
        secondVC.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "circle.fill"), tag: 1)
        thirdVC.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "square.fill"), tag: 2)
        
        // Thiết lập các ViewControllers cho TabBarController
        self.viewControllers = [firstVC, secondVC, thirdVC]
    }
    
    private func addLeftButton() {
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
}
