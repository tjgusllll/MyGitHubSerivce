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
    

    //MARK:- UI Properties
    var tableview: UITableView = {
        let tableview = UITableView(frame: .zero, style: .plain)
        tableview.register(UserCell.self , forCellReuseIdentifier: "UserCell")
        return tableview
    }()
    
    // MARK:- Properties
    var userList: [UserModel] = []
    let githubService = GitHubService()
    //pagination
    var pageArr: [UserModel] = []
    let limit: Int = 10
    
    
    func setupUI() {
        self.tableview.dataSource = self
        self.tableview.delegate = self
        view.addSubview(tableview)
        
        //SnapKit
        tableview.snp.makeConstraints{ make in
            
            //승진: 위아래양옆 같은 것은 edges로 한번에 할 수 있어! 팁이야!
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
    
    
    //MARK:- GitHubService Call
    func gihubGetAll(since: Int) {
        githubService.requestGitHubAllUser(since: since) { result in
            switch result {
            case .success(let response):
                self.resetUserlist(response)
            case .failure(let response):
                print(response)
            }
        }
    }

    
    //githubGetAll()에서 받아온 데이터를 userlist에 담아주고 tableview reload
    func resetUserlist(_ response: [UserModel]) {
        
        //승진: 모델에 객체 선언하는것 보단 위에 전전역으로 모델 선언하는게 좋은듯!
        userList = response
        for i in 0..<limit {
            pageArr.append(userList[i])
        }
        print("-------")
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        gihubGetAll(since: 0)
    }
}
 

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageArr.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        
        /* 승진: 수정!
            여기서 데이터 바인딩 처리하는것 보다 메서드 만드는 습관!
         UserCell에 configureUI(userList: UserModel) 이런식으로 만들어서 cell에서 처리하게!
         바인딩 처리는 cell == view 니까 view에서 처리하는게 맞음!
         */
        
        //어때 훨씬 깔끔하지?
        
        cell.configureUI(with: pageArr[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let lastItem = pageArr.count - 1
        if indexPath.row == lastItem {
            print("willDisplay lastID   :   \(lastItem)")
            loadMoreData(since: pageArr[indexPath.row].id)
        }
    }
    
    func loadMoreData(since: Int?){
        guard let lastId = since else { return }
        gihubGetAll(since: lastId)
    }
}


