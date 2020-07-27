//
//  FirstTableViewCell.swift
//  WeChatDemo
//
//  Created by 经典 on 2020/7/27.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit

class FirstTableViewCell: UITableViewCell {
    static let identifier1 = "FirstTableViewCell"
    var photos = UIImageView()
    var avatar = UIImageView()
    var name = UILabel()
    let icon = UIImage(systemName: "chevron.backward")
    var icon1 = UIImageView()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style:style,reuseIdentifier:reuseIdentifier)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder): has not been implemented")
    }
    
    private func setUI(){
        contentView.addSubview(photos)
        contentView.addSubview(avatar)
        contentView.addSubview(name)
        contentView.addSubview(icon1)
        photos.image = UIImage(named: "background")
        photos.clipsToBounds = true
        let heightOf:CGFloat = (photos.image?.size.height)!
        let widthOf:CGFloat = (photos.image?.size.width)!
        photos.contentMode = .scaleAspectFill
        photos.snp.makeConstraints{(make) in
            make.leading.top.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(photos.snp.width).multipliedBy(heightOf/widthOf)
            
        }
        avatar.image = UIImage(named: "selfLogo")
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 5
        avatar.snp.makeConstraints{(make) in
            make.width.height.equalTo(UIScreen.main.bounds.width/6)
            make.bottom.equalToSuperview().inset(45)
            make.trailing.equalToSuperview().inset(30)
        }
        icon1.image = icon
        icon1.snp.makeConstraints{(make) in
            make.width.height.equalTo(30)
            make.leading.top.equalToSuperview().inset(20)
//            make.centerY.equalToSuperview()
        }
        
    }
    
}
