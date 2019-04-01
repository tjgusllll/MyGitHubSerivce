//
//  UserCell.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import Kingfisher //XCode 10은 4.10.0을 설치해야함. 10이상은 4.0설치!


final class UserCell: UITableViewCell {
    
    //MARK:- Constant
    struct Constant {
        static let basicMargin: CGFloat = 20
        static let itemImageSize: CGFloat = 100
        static let addButtonSize: CGFloat = 50
    }
    
    //MARK:- UI Properties
    
    let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let itemTitle: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let itemDetail: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    //MARK:- Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    //class에서 초기화 메소드를 구현할떄에는 반드시 required를 붙여야한다.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(itemImageView)
        addSubview(itemTitle)
        addSubview(itemDetail)
       
//        //itemImage
//        itemImageView.translatesAutoresizingMaskIntoConstraints = false
//        itemImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
//        itemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.basicMargin).isActive = true
//        itemImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//        
//        //imageview,view는 intrinsic size가 없으므로 크기를 잡아줘야한다
//        itemImageView.widthAnchor.constraint(equalToConstant: Constant.itemImageSize).isActive = true
//        itemImageView.heightAnchor.constraint(equalToConstant: Constant.itemImageSize).isActive = true
//        
//        
//        //itemTitle
//        itemTitle.translatesAutoresizingMaskIntoConstraints = false
//        itemTitle.topAnchor.constraint(equalTo: topAnchor, constant: Constant.basicMargin).isActive = true
//        itemTitle.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: Constant.basicMargin).isActive = true
//        
//        //itemDetail
//        itemDetail.translatesAutoresizingMaskIntoConstraints = false
//        //itemDetail.centerXAnchor.constraint(equalTo: itemTitle.centerXAnchor).isActive = true
//        itemDetail.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: Constant.basicMargin).isActive = true
//        itemDetail.topAnchor.constraint(equalTo: itemTitle.bottomAnchor, constant: (Constant.basicMargin / 2)).isActive = true
        
    }
    
}
