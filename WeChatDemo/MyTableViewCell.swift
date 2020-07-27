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
    var contentText = UILabel()
    var photos = UIImageView()
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
        contentView.addSubview(photos)
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
        
        contentText.text = "Get your Universal apps ready.The Universal App Quick Start Program includes all the tools, resources, and support you need to build, test, and optimize your next-generation Universal apps for macOS Big Sur."
        contentText.textColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        contentText.numberOfLines = 0
        contentText.font = UIFont.systemFont(ofSize: 18)
        contentText.snp.makeConstraints{(make) in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.leading.equalTo(avatar.snp.trailing).offset(8)
            make.trailing.equalToSuperview().inset(16)
        }
        
        
        
        //        photos.image = UIImage(named: "apple silicon")
        
    }
    private func setUpCell(){
        
    }
    
    public func setContent(names: String, avatars: String, content: String, photosAmount: Int, photosName: String){
        name.text = names
        avatar.image = UIImage(named: avatars)
        contentText.text = content
        amount = photosAmount
        photos.image = UIImage(named: photosName)
        print(UIImage(named: "apple silicon")?.size.width)
        print(UIImage(named: "apple silicon")?.size.height)
        
        if(amount != 1){
            photos.clipsToBounds = true
            photos.contentMode = .scaleAspectFit
            photos.snp.makeConstraints{(make) in
                make.top.equalTo(contentText.snp.bottom).offset(5)
                make.leading.equalTo(contentText.snp.leading)
                make.width.height.equalTo(100)
                make.bottom.equalToSuperview().inset(10)
            }
            
        }else{
            photos.clipsToBounds = true
            photos.contentMode = .scaleAspectFill
            let heightOf:CGFloat = (photos.image?.size.height)!
            let widthOf:CGFloat = (photos.image?.size.width)!
            photos.snp.makeConstraints{(make) in
                make.top.equalTo(contentText.snp.bottom).offset(5)
                make.leading.equalTo(contentText.snp.leading)
                make.width.equalTo(UIScreen.main.bounds.width/2)
                make.height.equalTo(photos.snp.width).multipliedBy(heightOf/widthOf)
                make.bottom.equalToSuperview().inset(10)
            }
        }
    }
}
