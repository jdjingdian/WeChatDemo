//
//  MyTableViewCell.swift
//  WeChatDemo
//
//  Created by djing on 2020/7/27.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit


class MyTableViewCell: UITableViewCell {
    static let identifier = "MyTableViewCell"
    var avatar = UIImageView()
    var name = UILabel()
    var imageContenView = UIView()
    
    var contentText = UILabel()
    var photo = [
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView(),
        UIImageView()
    ]
    
    var amount:Int = 0
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setUpUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder): has not been implemented")
        
    }
    
    private func setUpUI(){
        contentView.addSubview(avatar)
        contentView.addSubview(contentText)
        contentView.addSubview(imageContenView)
        contentView.addSubview(name)
        
        avatar.layer.cornerRadius = 5
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "dtk")
        avatar.snp.makeConstraints{ (make) in
            make.leading.top.equalToSuperview().inset(10)
            make.height.width.equalTo(50)
        }
        
        name.textColor = UIColor(red: 90/255, green: 106/255, blue: 145/255,alpha: 1)
        name.numberOfLines = 1
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.snp.makeConstraints{(make) in
            make.leading.equalTo(avatar.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalTo(avatar.snp.top)
        }
        
        contentText.textColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        contentText.numberOfLines = 0
        contentText.font = UIFont.systemFont(ofSize: 18)
        contentText.snp.makeConstraints{(make) in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.leading.equalTo(avatar.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        //        imageContenView.snp.makeConstraints{(make) in
        //            make.top.equalTo(contentText.snp.bottom).offset(10)
        //            make.leading.equalTo(contentText.snp.leading)
        //            make.trailing.equalToSuperview().inset(10)
        //            make.bottom.equalToSuperview().inset(10)
        //        }
    }
    public func setContent(names: String, avatars: String, content: String, photosAmount: Int, photosName: [String]){
        name.text = names
        avatar.image = UIImage(named: avatars)
        contentText.text = content
        amount = photosAmount
        setImage(count:amount, pName:photosName)
    }
    
    private func setImage(count: Int, pName:[String]){
        print(count)
        if(count == 0){
            imageContenView.snp.makeConstraints{(make) in
                make.size.equalTo(0)
            }
            contentText.snp.makeConstraints{(make) in
                make.bottom.equalToSuperview().inset(16)
            }
        }else{
            imageContenView.snp.makeConstraints{(make) in
                make.top.equalTo(contentText.snp.bottom).offset(10)
                make.leading.equalTo(contentText.snp.leading)
                make.trailing.equalToSuperview().inset(10)
                make.bottom.equalToSuperview().inset(10)}
            imageContenView.addSubview(photo[0])
            photo[0].clipsToBounds = true
            photo[0].contentMode = .scaleAspectFill
            photo[0].image = UIImage(named: pName[0])
            photo[0].snp.makeConstraints{(make) in
                make.size.equalToSuperview()
                make.edges.equalToSuperview()
            }
        }
    }
    
}

