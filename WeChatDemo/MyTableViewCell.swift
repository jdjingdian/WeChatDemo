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
    var lengeth:CGFloat = (UIScreen.main.bounds.width - 120 ) / 3
    var contentText = UILabel()
    //    var photo  = [
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView(),
    //        UIImageView()
    //    ]
    var photo = UIImageView()
    
    var amount:Int = 0
    //
    //
    //清空复用Cell之前的属性
    
    override func prepareForReuse() {
//        super.prepareForReuse()
//        photo.image = nil
//        photo.snp.remakeConstraints{(make) in
//
//        }
//        imageContenView.snp.remakeConstraints{ _ in
//
//        }
//        
//        
    }
    
    
//
//
//
//
    
    
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
        contentView.addSubview(name)
        contentView.addSubview(imageContenView)
        
        avatar.layer.cornerRadius = 5
        avatar.clipsToBounds = true
        avatar.image = UIImage(named: "dtk")
        avatar.snp.makeConstraints{ (make) in
            make.leading.top.equalToSuperview().inset(10)
            make.height.width.equalTo(50)
        }
        
        name.textColor = UIColor(red: 90/255, green: 106/255, blue: 145/255,alpha: 1)
        name.textAlignment = .left
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.snp.makeConstraints{(make) in
            make.leading.equalTo(avatar.snp.trailing).offset(8).priority(999)
            make.top.equalTo(avatar.snp.top)
            make.trailing.equalToSuperview().inset(10)
            
        }
        //必然存在头像以及名字
        contentText.textColor = UIColor(red: 25/255, green: 25/255, blue: 25/255, alpha: 1)
        contentText.numberOfLines = 0
        contentText.font = UIFont.systemFont(ofSize: 18)
    }
    public func setContent(names: String, avatars: String, content: String, photosAmount: Int, photosName: [String]){
        name.text = names
        avatar.image = UIImage(named: avatars)
        contentText.text = content
        amount = photosAmount
        
        if(amount != 0 ){
            contentText.snp.makeConstraints{(make) in
                make.top.equalTo(name.snp.bottom).offset(5)
                make.leading.equalTo(avatar.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                
            }
//            setImage(count:amount, pName:photosName)
            setImage(amount, pName: photosName)
        }else{
            contentText.snp.makeConstraints{(make) in
                make.top.equalTo(name.snp.bottom).offset(5)
                make.leading.equalTo(avatar.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
            
        }
    }

    
    private func setImage(_ count: Int, pName:[String]){
        imageContenView.addSubview(photo)
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.image = UIImage(named: pName[0])
        let heightOf:CGFloat = (photo.image?.size.height)!
        let widthOf:CGFloat = (photo.image?.size.width)!
        photo.snp.makeConstraints{(make)in
            make.width.equalTo((UIScreen.main.bounds.width/2))
            make.height.equalTo(photo.snp.width).multipliedBy(heightOf/widthOf)
            make.size.equalToSuperview()
            make.edges.equalToSuperview()
        }
        imageContenView.snp.makeConstraints{(make) in
            
            make.height.equalTo(setLayoutHeight(nums: 1 - 1))
            make.width.equalTo(setLayoutWidth(nums: count - 1))
            make.leading.equalTo(contentText.snp.leading)
            make.top.equalTo(contentText.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(16)
        }

    }
    private func setLayoutHeight(nums: Int) -> CGFloat {
        var heightOf:CGFloat = 0.0
        if(nums == 0){
            heightOf = UIScreen.main.bounds.width * ((photo.image?.size.height)!)/((photo.image?.size.width)!) / 2
        }else if(nums == 3){
            heightOf = 2*(lengeth + 5)
            
        }
        return heightOf
    }
    
    private func setLayoutWidth(nums: Int) -> CGFloat {
        var widthOf:CGFloat = 0.0
        if(nums == 0){
            widthOf = UIScreen.main.bounds.width/2
        }else if(nums == 3){
            widthOf = 2*(lengeth + 5)
        }
        return widthOf
    }
}


