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
    //    var photos = UIImageView()
    
    
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
        contentView.addSubview(imageContenView)
        contentView.addSubview(avatar)
        contentView.addSubview(contentText)
        //        contentView.addSubview(photos)
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
    }
    private func setUpCell(){
        
    }
    
    public func setContent(names: String, avatars: String, content: String, photosAmount: Int, photosName: [String]){
        name.text = names
        avatar.image = UIImage(named: avatars)
        contentText.text = content
        amount = photosAmount
        let value: Int = Int(UIScreen.main.bounds.width)
        switch amount{
        case 0 :
            contentText.snp.makeConstraints{(make) in
                make.top.equalTo(name.snp.bottom).offset(5)
                make.leading.equalTo(avatar.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
        case 1 :
            contentView.addSubview(photo[0])
            photo[0].image = UIImage(named: photosName[0])
            photo[0].clipsToBounds = true
            photo[0].contentMode = .scaleAspectFill
            let heightOf:CGFloat = (photo[0].image?.size.height)!
            let widthOf:CGFloat = (photo[0].image?.size.width)!
            photo[0].snp.makeConstraints{(make) in
                make.top.equalTo(contentText.snp.bottom).offset(5)
                make.leading.equalTo(contentText.snp.leading)
                make.width.equalTo(UIScreen.main.bounds.width/2)
                make.height.equalTo(photo[0].snp.width).multipliedBy(heightOf/widthOf)
                make.bottom.equalToSuperview().inset(10)
            }
        case 4 :
            for i in 0...3 {
                contentView.addSubview(photo[i])
                photo[i].image = UIImage(named: photosName[i])
                photo[i].clipsToBounds = true
                photo[i].contentMode = .scaleAspectFill
                
                switch i {
                case 0:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalTo(contentText.snp.bottom).offset(5)
                        make.leading.equalTo(contentText.snp.leading)
                        make.width.height.equalTo((value - 120)/3)
                    }
                case 1:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalTo(contentText.snp.bottom).offset(5)
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5).priority(999)
                        make.width.height.equalTo((value - 120)/3)
                        make.trailing.equalToSuperview().inset(10).priority(777)
                    }
                case 2:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalTo(photo[i-2].snp.bottom).offset(5)
                        make.leading.equalTo(contentText.snp.leading)
                        make.width.height.equalTo((value - 120)/3)
                        make.bottom.equalToSuperview().inset(10)
                    }
                case 3:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalTo(photo[i-2].snp.bottom).offset(5)
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5).priority(999)
                        make.trailing.equalToSuperview().inset(10).priority(777)
                        make.width.height.equalTo((value - 120)/3)
                        make.bottom.equalToSuperview().inset(10)
                    }
                default:
                    photo[i].clipsToBounds = false
                
                
            }
        }
        
        default :
            for i in 0..<amount{
            contentView.addSubview(photo[i])
            photo[i].image = UIImage(named: photosName[i])
            photo[i].clipsToBounds = true
            photo[i].contentMode = .scaleAspectFill
            photo[i].snp.makeConstraints{(make) in
                if(i == 0){
                    make.top.equalTo(contentText.snp.bottom).offset(5)
                    make.leading.equalTo(contentText.snp.leading)
                    make.width.height.equalTo((value - 120)/3)
                }else if(i == 3){
                    make.top.equalTo(photo[i-3].snp.bottom).offset(5)
                    make.leading.equalTo(contentText.snp.leading)
                    make.width.height.equalTo((value - 120)/3)
                    
                }else if(i == 6){
                    make.top.equalTo(photo[i-3].snp.bottom).offset(5)
                    make.leading.equalTo(contentText.snp.leading)
                    make.width.height.equalTo((value - 120)/3)
                    make.bottom.equalToSuperview().inset(16)
                }else{
                    make.leading.equalTo(photo[i-1].snp.trailing).offset(5).priority(999)
                    make.width.height.equalTo((value - 120)/3)
                    make.centerY.equalTo(photo[i-1].snp.centerY)
                    make.bottom.equalTo(photo[i-1].snp.bottom)
                }
            }
        }
    }
}
}
