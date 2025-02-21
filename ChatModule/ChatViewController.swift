//
//  ChatViewController.swift
//  ChatModule
//
//  Created by ThienDD9 on 20/02/2025.
//

import UIKit
import CommonModule
import LoadingModule

class ChatViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var persons: [Person]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Chat Module"
        addRightButton()
        addLeftButton()
        tableView.register(UINib(nibName: "ItemCell", bundle: Bundle(identifier: "com.thiendd.ChatModule")), forCellReuseIdentifier: "ItemCell")
        tableView.backgroundColor = .clear
        tableView.backgroundView = nil
        self.getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func getData() {
        self.showLoading()
        NetworkingService.share.request(urlString: "https://jsonplaceholder.typicode.com/todos", method: .GET) { [weak self] (result: Result<[Person], NetworkError>) in
            
            switch result {
            case .success(let persons):
                self?.persons = persons
                self?.hideLoading()
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
            case .failure(let error):
                print("error.localizedDescription: \(error.localizedDescription)")
                break
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
}

extension ChatViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let persons = persons {
            return persons.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as? ItemCell else {
            return UITableViewCell()
        }
        let person = persons?[indexPath.row]
        cell.setData(model: person)
        cell.selectionStyle = .none
        return cell
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

