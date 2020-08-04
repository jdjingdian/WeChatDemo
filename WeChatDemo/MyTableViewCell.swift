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
    var length:CGFloat = (UIScreen.main.bounds.width - 120 ) / 3
    var length2:CGFloat = (UIScreen.main.bounds.width - 120 ) / 2
    var contentText = UILabel()
    var photo  = [
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
    //    var photo = UIImageView()
    
    var amount:Int = 0
    
    //清空复用Cell之前的属性
    override func prepareForReuse() {
        super.prepareForReuse()
        imageContenView.snp.remakeConstraints{(make) in
        }


        for i in 0...8{
            photo[i].snp.remakeConstraints { (make) in
            }
            photo[i].image = nil
        }
        
        
    }
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
        name.snp.remakeConstraints{(make) in
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
            contentText.snp.remakeConstraints{(make) in
                make.top.equalTo(name.snp.bottom).offset(5)
                make.leading.equalTo(avatar.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                
            }
            setImage(count:amount, pName:photosName)
        }else{
            contentText.snp.remakeConstraints{(make) in
                make.top.equalTo(name.snp.bottom).offset(5)
                make.leading.equalTo(avatar.snp.trailing).offset(8)
                make.trailing.equalToSuperview().inset(16)
                make.bottom.equalToSuperview().inset(16)
            }
            
        }
    }//将图片与文字信息传入
    
    private func setImage(count: Int, pName:[String]){
        //将图像循环放入imageContenView(UIView)中
        for i in 0 ..< count {
            imageContenView.addSubview(photo[i])
            if(count == 1){
                photo[i].clipsToBounds = true
                photo[i].contentMode = .scaleAspectFill
                photo[i].image = UIImage(named: pName[i])
                let heightOf:CGFloat = (photo[i].image?.size.height)!
                let widthOf:CGFloat = (photo[i].image?.size.width)!
                photo[i].snp.makeConstraints{(make) in
                    make.width.equalTo((UIScreen.main.bounds.width/2))
                    make.height.equalTo(photo[i].snp.width).multipliedBy(heightOf/widthOf)
                    make.size.equalToSuperview()
                    make.edges.equalToSuperview()
                }
                
                
            }else if(count == 4 || count == 2){
                photo[i].image = UIImage(named: pName[i])
                photo[i].clipsToBounds = true
                photo[i].contentMode = .scaleAspectFill
                switch i{
                case 0:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.leading.equalToSuperview()
                        make.width.height.equalTo(length2)
                        if(count == 2){
                            make.bottom.equalToSuperview()
                        }
                    }
                case 1:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalToSuperview()
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5).priority(999)
                        make.width.height.equalTo(length2)
                        make.trailing.equalToSuperview().priority(777)
                        if(count == 2){
                            make.bottom.equalToSuperview()
                        }
                    }
                case 2:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalTo(photo[i-2].snp.bottom).offset(5)
                        make.leading.equalToSuperview()
                        make.width.height.equalTo(length2)
                        make.bottom.equalToSuperview()
                    }
                case 3:
                    photo[i].snp.makeConstraints{(make) in
                        make.top.equalTo(photo[i-2].snp.bottom).offset(5)
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5).priority(999)
                        make.trailing.equalToSuperview()
                        make.width.height.equalTo(length2)
                        make.bottom.equalToSuperview()
                    }
                default:
                    photo[i].clipsToBounds = false
                }
            }else{
                photo[i].image = UIImage(named: pName[i])
                photo[i].clipsToBounds = true
                photo[i].contentMode = .scaleAspectFill
                photo[i].snp.makeConstraints{(make) in
                    make.width.height.equalTo(length)
                    if(i>=((count-1)/3)*3){
                        make.bottom.equalToSuperview()
                    }
                    if(i == 0){
                        make.top.equalToSuperview()
                        make.leading.equalToSuperview()
                    }else if(i>0&&i<3){
                        make.top.equalToSuperview()
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5)
                    }else if(i%3 == 0 && i>2){
                        make.leading.equalToSuperview()
                        make.top.equalTo(photo[i-3].snp.bottom).offset(5)
                    }else if(i%3 == 1 && i>2){
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5)
                        make.top.equalTo(photo[i-3].snp.bottom).offset(5)
                    }else if(i%3 == 2 && i>2){
                        make.trailing.equalToSuperview()
                        make.leading.equalTo(photo[i-1].snp.trailing).offset(5)
                        make.top.equalTo(photo[i-3].snp.bottom).offset(5)
                    }
                   
                }
            }
            imageContenView.snp.remakeConstraints{(make) in
                
                make.height.equalTo(setLayoutHeight(nums: count))
                make.width.equalTo(setLayoutWidth(nums: count))
                make.leading.equalTo(contentText.snp.leading).priority(888)
                make.top.equalTo(contentText.snp.bottom).offset(10).priority(999)
                make.bottom.equalToSuperview().inset(16)
            }
            
        }
    }
    
    
    private func setLayoutHeight(nums: Int) -> CGFloat {
        var heightOf:CGFloat = 0.0
        if(nums == 0){
            heightOf = 0
        }else if(nums == 1){
            heightOf = UIScreen.main.bounds.width * ((photo[nums-1].image?.size.height)!)/((photo[nums-1].image?.size.width)!) / 2
        }else if(nums == 4){
            heightOf = 2*length2 + 5
        }else if(nums == 2){
            heightOf = length2
        }else{
            let i:CGFloat = CGFloat((nums-1)/3)
            heightOf = (i+1)*length + i*5
        }
        return heightOf
    }
    
    private func setLayoutWidth(nums: Int) -> CGFloat {
        var widthOf:CGFloat = 0.0
        if(nums == 0){
            widthOf = 0
        }else if(nums == 1){
            widthOf = UIScreen.main.bounds.width/2
        }
        else if(nums == 4 || nums == 2){
            widthOf = 2*length2 + 5
        }else if(nums<=3){
            let i:CGFloat = CGFloat(nums)
            widthOf = i*length + (i-1)*5
        }
        else{
            widthOf = 3*length + 2*5
        }
        return widthOf
    }
}


