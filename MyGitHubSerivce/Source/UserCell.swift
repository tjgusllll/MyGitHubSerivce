//
//  UserCell.swift
//  MyGitHubSerivce
//
//  Created by 조서현 on 2019. 4. 1..
//  Copyright © 2019년 조서현. All rights reserved.
//

import UIKit
import SnapKit


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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        addSubview(itemImageView)
        addSubview(itemTitle)
        addSubview(itemDetail)
       
        //SnapLit
        itemImageView.snp.makeConstraints{ make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading).offset(Constant.basicMargin)
            make.bottom.equalTo(self.snp.bottom)
            make.width.equalTo(Constant.itemImageSize)
            make.height.equalTo(Constant.itemImageSize)
        }
        
        itemTitle.snp.makeConstraints{ make in
            make.top.equalTo(self.snp.top).offset(Constant.basicMargin)
            make.leading.equalTo(itemImageView.snp.trailing).offset(Constant.basicMargin)
        }
        
        itemDetail.snp.makeConstraints{ make in
            make.leading.equalTo(itemImageView.snp.trailing).offset(Constant.basicMargin)
            make.top.equalTo(itemTitle.snp.bottom).offset((Constant.basicMargin) / 2)
        }
    }
    
}
