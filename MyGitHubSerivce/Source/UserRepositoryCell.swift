//
//  UserRepositoryCell.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 11..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher


final class UserRepositoryCell: UITableViewCell {
    
    //MARK:- Constant
    struct Constant {
        static let basicMargin: CGFloat = 10
    }
    
    
    //MARK:- UI Properties
   
    let itemName: UILabel = {
        let label = UILabel()
        return label
        
    }()
    let itemDate: UILabel = {
        let label = UILabel()
        return label
        
    }()
    let itemStar: UILabel = {
        let label = UILabel()
        return label
        
    }()
    let itemWatcher: UILabel = {
        let label = UILabel()
        return label
        
    }()
    
    let itemDescription: UILabel = {
        let label = UILabel();
        label.textAlignment = .natural
        label.lineBreakMode = .byCharWrapping
        label.numberOfLines = 2
        return label
        
    }()

    
    //MARK:- Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureReposUI(with repos: UserRepositoryModel) {
        guard let stargazers_count = repos.stargazers_count else { return }
        guard let watchers_count = repos.watchers_count else { return }
        guard let created_at = repos.created_at else { return }
        
        itemName.text = repos.name
        itemDescription.text = repos.description
        itemStar.text = "star : \(stargazers_count)"
        itemWatcher.text = "watcher : \(watchers_count)"
        itemDate.text = dateConverter(created_at: created_at)
    }
    
    func dateConverter(created_at: String) -> String? {
        var result: String?
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = formatter.date(from: created_at)
        
        if let dateStr = date {
            formatter.dateFormat = "yyyy.MM.dd HH:mm"
            result = formatter.string(from: dateStr)
        }
        return result
    }

    
    
    func setupUI() {
            addSubview(itemName)
            addSubview(itemDate)
            addSubview(itemDescription)
            addSubview(itemStar)
            addSubview(itemWatcher)
            
            reposLayoutSetup()
    }
    
    func reposLayoutSetup() {
        
        itemName.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(Constant.basicMargin)
            make.leading.equalTo(self.snp.leading).offset(Constant.basicMargin)
        }
        
        itemDescription.snp.makeConstraints {make in
            make.top.equalTo(itemName.snp.bottom).offset(Constant.basicMargin)
            make.leading.equalTo(itemName.snp.leading)
            make.width.equalTo(250)
        }
        
        itemStar.snp.makeConstraints { make in
            make.top.equalTo(itemName.snp.top)
            make.trailing.equalTo(self.snp.trailing).offset(-(Constant.basicMargin))
        }
        
        itemWatcher.snp.makeConstraints { make in
            make.top.equalTo(itemStar.snp.bottom).offset(Constant.basicMargin)
            make.trailing.equalTo(-(Constant.basicMargin))
        }
        
        itemDate.snp.makeConstraints { make in
            make.top.equalTo(itemWatcher.snp.bottom).offset(Constant.basicMargin)
            make.trailing.equalTo(-(Constant.basicMargin))
            make.bottom.equalTo(self.snp.bottom).offset(-(Constant.basicMargin))
           
        }
    }
}
