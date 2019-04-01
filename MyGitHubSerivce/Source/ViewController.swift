//
//  ViewController.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 3. 31..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import Kingfisher //XCode 10은 4.10.0을 설치해야함. 10이상은 4.0설치!
import SnapKit


class ViewController: UIViewController {
    
    let githubService = GitHubService()
    

    //MARK:- UI Properties
    var tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(UserCell.self , forCellReuseIdentifier: "UserCell")
        return tableview
    }()
    
    func setupUI() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        view.addSubview(tableview)
        
        //SnapKit
        tableview.snp.makeConstraints{ make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
    
    //MARK:- GitHubService Call
    func gihubGetAll() {
        githubService.requestGitHubAllUser() { result in
            switch result {
            case .success(let response):
                //print(response)
                self.resetUserlist(response)
            case .failure(let response):
                print(response)
            }
        }
    }

    
    //githubGetAll()에서 받아온 데이터를 userlist에 담아주고 tableview reload
    func resetUserlist(_ response: [UserModel]) {
        userlist.removeAll()
        var newUser = UserModel()
        for user in response {
            newUser.avatar_url = user.avatar_url
            newUser.id = user.id
            newUser.login = user.login
            userlist.append(newUser)
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        gihubGetAll()
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        if let user_ava = userlist[indexPath.row].avatar_url,
            let user_id = userlist[indexPath.row].id,
            let user_login = userlist[indexPath.row].login {
                cell.itemTitle.text = String(userlist[indexPath.row].id!)
                cell.itemDetail.text = userlist[indexPath.row].login
            
                cell.itemTitle.text = String(user_id)
                cell.itemDetail.text = user_login
                cell.itemImageView.kf.setImage(with: user_ava) //kingfisher
            }
            return cell
        }
    
}
