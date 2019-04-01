//
//  ViewController.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 3. 31..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    let githubService = GitHubService()
    

    //MARK:- UI Properties
    var tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(UserCell.self , forCellReuseIdentifier: "UserCell")
        return tableview
    }()
    
    
    //MARK:- SetupUI_TableView
    func setupUI() {
        
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        view.addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableview.topAnchor),
            self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableview.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: tableview.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: tableview.trailingAnchor)
            ])
    }
    
    func gihubGetAll() {
        githubService.requestGitHubAllUser() { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let response):
                print(response)
            }
        }
        self.tableview.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        gihubGetAll()
    }

}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        return cell
    }
    
}
