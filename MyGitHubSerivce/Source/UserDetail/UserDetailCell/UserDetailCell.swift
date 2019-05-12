//
//  UserDetailCell.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 5..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

final class UserDetailCell: UITableViewCell {
    
    //MARK:- Constant
    struct Constant {
        static let basicMargin: CGFloat = 8
        static let itemImageSize: CGFloat = 150
    }
    
    struct UI {
        static let labelFontSize: CGFloat = 8
    }
    
    
    //MARK:- UI Properties
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let itemLogin: UILabel = {
        let label = UILabel()
        label.font.withSize(UI.labelFontSize)
        return label
        
    }()
    let itemName: UILabel = {
        let label = UILabel()
        label.font.withSize(UI.labelFontSize)
        return label
        
    }()
    let itemLocation: UILabel = {
        let label = UILabel()
        label.font.withSize(UI.labelFontSize)
        return label
        
    }()
    let itemCompany: UILabel = {
        let label = UILabel()
        label.font.withSize(UI.labelFontSize)
        return label
        
    }()
    let itemFollowers: UILabel = {
        let label = UILabel()
        label.font.withSize(UI.labelFontSize)
        return label
        
    }()
    let itemFollowing: UILabel = {
        let label = UILabel()
        label.font.withSize(UI.labelFontSize)
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
    
    
    
    //MARK:- ConfigureUI
    func configureUserUI(with user: UserDetailModel) {
        
        guard let followers = user.followers else { return }
        guard let following = user.following else { return }
        
        itemImageView.kf.setImage(with: user.avatar_url)
        itemLogin.text = user.login
        itemName.text = user.name
        itemLocation.text = user.location
        itemCompany.text = user.company
        itemFollowers.text = "followers : \(followers)"
        itemFollowing.text = "following : \(following)"
    }
    
    
    //MARK:- SetupUI
    func setupUI() {
      
            addSubview(itemImageView)
            addSubview(itemLogin)
            addSubview(itemName)
            addSubview(itemLocation)
            addSubview(itemCompany)
            addSubview(itemFollowers)
            addSubview(itemFollowing)
            
            detailLayoutSetup()
    }
    
    
    func detailLayoutSetup() {
        
        itemImageView.snp.makeConstraints{ make in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing)//.offset(-Constant.basicMargin)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(Constant.itemImageSize)
            make.height.equalTo(Constant.itemImageSize)
        }
        
        itemLogin.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(Constant.basicMargin)
            make.leading.equalTo(Constant.basicMargin)
        }
        
        itemName.snp.makeConstraints { make in
            make.top.equalTo(itemLogin.snp.bottom).offset(Constant.basicMargin)
            make.leading.equalTo(Constant.basicMargin)
        }
        
        itemLocation.snp.makeConstraints { make in
            make.top.equalTo(itemName.snp.bottom).offset(Constant.basicMargin)
            make.leading.equalTo(Constant.basicMargin)
        }
        
        itemCompany.snp.makeConstraints { make in
            make.top.equalTo(itemLocation.snp.bottom).offset(Constant.basicMargin)
            make.leading.equalTo(Constant.basicMargin)
        }
        
        itemFollowers.snp.makeConstraints { make in
            make.top.equalTo(itemCompany.snp.bottom).offset(Constant.basicMargin)
            make.leading.equalTo(Constant.basicMargin)
            make.bottom.equalTo(self.snp.bottom).offset(-(Constant.basicMargin))
        }
        
        itemFollowing.snp.makeConstraints {make in
            make.top.equalTo(itemCompany.snp.bottom).offset(Constant.basicMargin)
            make.trailing.equalTo(itemImageView.snp.leading).offset(-(Constant.basicMargin))
            make.leading.greaterThanOrEqualTo(itemFollowers).offset(Constant.basicMargin)
            make.bottom.equalTo(self.snp.bottom).offset(-(Constant.basicMargin))
        }
    }
    
}
