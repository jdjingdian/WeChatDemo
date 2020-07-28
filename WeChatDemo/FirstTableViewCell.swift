//
//  FirstTableViewCell.swift
//  WeChatDemo
//
//  Created by 经典 on 2020/7/27.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit
import CoreImage

class FirstTableViewCell: UITableViewCell {
    static let identifier1 = "FirstTableViewCell"
    var photos = UIImageView()
    var avatar = UIImageView()
    var name = UILabel()
    var icon1 = UIImageView()
    var icon2 = UIImageView()
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
        contentView.addSubview(icon2)
        photos.image = UIImage(named: "background")
        photos.clipsToBounds = true
        let heightOf:CGFloat = (photos.image?.size.height)!
        let widthOf:CGFloat = (photos.image?.size.width)!
        photos.contentMode = .scaleAspectFit
        photos.snp.makeConstraints{(make) in
            make.edges.equalToSuperview()
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
        icon1.image = UIImage(systemName: "chevron.left.circle")
        icon1.tintColor = .black
        icon1.snp.makeConstraints{(make) in
            make.width.height.equalTo(30)
            make.leading.equalToSuperview().inset(20)
            make.top.equalToSuperview().inset(40)
        }
        icon2.image = UIImage(systemName: "camera")
        icon2.tintColor = .black
        icon2.snp.makeConstraints{(make) in
            make.width.equalTo(36)
            make.height.equalTo(27)
            make.trailing.equalToSuperview().inset(25)
            make.centerY.equalTo(icon1.snp.centerY).offset(1)
        }
        name.text = "Derek Jing"
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.textAlignment = .right
        name.textColor = UIColor.black
        name.snp.makeConstraints{(make) in
            make.width.equalToSuperview()
            make.trailing.equalTo(avatar.snp.leading).offset(-10)
            make.centerY.equalTo(avatar.snp.centerY)
        }
    }
    
}
