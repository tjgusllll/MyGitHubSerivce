//
//  DetailViewController.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 5..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    
    enum Section: Int {
        case userInfo = 0
        case userRepos = 1
        case totalCount = 2
    }
    
    struct UI {
        static let userInfoSectionHeight: CGFloat = 150
        static let userRepositoriesSectionHeight: CGFloat = 130
        static let backColor = UIColor(red: 207/255, green: 219/255, blue: 225/255, alpha: 1)
    }
    
    
    
    // MARK:- Properties
    var username: String?
    var userDetail = UserDetailModel()
    var userReposList: [UserRepositoryModel] = []
    
    let githubDetailService = GitHubService()
    
    //pagination
    var pageReposArr: [UserRepositoryModel] = []
    var page: Int = 1
    
    //MARK:- UI Properties
    var tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(UserDetailCell.self , forCellReuseIdentifier: "UserDetail")
        tableview.register(UserRepositoryCell.self , forCellReuseIdentifier: "UserRepos")
        return tableview
    }()


    func setupUI() {
        guard let username = username else{return}
        githubUserDetail(username: username)
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        view.addSubview(tableview)

        tableview.snp.makeConstraints{ make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    
    override func viewDidLoad() {
        setupUI()
    }
    
    //MARK:- Get Github Data
    func githubUserDetail(username: String){
        githubDetailService.requestGitHubUserDetail(name: username) { result in
            switch result {
            case .success(let response):
                self.userDetail = response
                self.githubUserRepos(username: username, page: self.page)
            case .failure(let response):
                print(response)
            }
        }
    }
    
    func githubUserRepos(username: String, page: Int) {
        githubDetailService.requestGitHubUserRepository(name: username, page: page) { result in
            switch result {
            case .success(let response):
                self.resetReposList(response)
                self.page += 1
            case .failure(let response):
                print(response)
            }
        }
    }
    
    
    func resetReposList(_ response: [UserRepositoryModel]) {
        userReposList = response
        for repos in userReposList {
            pageReposArr.append(repos)
        }
        
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
}


extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // 승진 : 이런 숫자같은것들 그냥 쓰면안되! 나쁜 버릇
        // 이런식으로 Enum을 쓰든 struct등을 만들어서 관리를 해야되!
//        return Section.totalCount.rawValue
        
        return Section.totalCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return pageReposArr.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == Section.userInfo.rawValue {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetail", for: indexPath) as! UserDetailCell
            cell.configureUserUI(with: self.userDetail)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserRepos", for: indexPath) as! UserRepositoryCell
            cell.backgroundColor = UI.backColor
            cell.configureReposUI(with: self.pageReposArr[indexPath.row]) //self.userReposList[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == Section.userInfo.rawValue {
            return UI.userInfoSectionHeight
        } else {
            
            return UI.userRepositoriesSectionHeight
        }
    }
    
    
    //MARK:- Pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = pageReposArr.count - 1
        if indexPath.row == lastItem {
            loadMoreData(username: self.username, page: self.page)
        }
    }
    
    func loadMoreData(username: String?, page: Int){
        guard let username = username else { return }
        githubUserRepos(username: username, page: page)
    }
    
    
}

