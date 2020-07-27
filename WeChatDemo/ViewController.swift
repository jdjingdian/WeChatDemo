//
//  ViewController.swift
//  WeChatDemo
//
//  Created by djing on 2020/7/24.
//  Copyright © 2020 djing. All rights reserved.
//

import UIKit
import SnapKit
class ViewController: UIViewController {
    
    var group = [
        Person(name: "Universal App Quick Start Program", avatar: "dtk", opinion: "The Universal App Quick Start Program includes all the tools, resources, and support you need to build, test, and optimize your next-generation Universal apps for macOS Big Sur.", photo: [
            Photos(photoName: "apple silicon"),
        ]),
        Person(name: "Mac Catalyst", avatar: "catalyst", opinion: "Native Mac apps built with Mac Catalyst can share code with your iPad apps, and you can add more features just for Mac. In macOS Big Sur, you can create even more powerful versions of your apps and take advantage of every pixel on the screen by running them at native Mac resolution. Apps built with Mac Catalyst can now be fully controlled using just the keyboard, access more iOS frameworks, and take advantage of the all-new look of macOS Big Sur. There’s never been a better time to turn your iPad app into a powerful Mac app.", photo: [
            Photos(photoName: "789"),
            Photos(photoName: "456"),
            Photos(photoName: "101112"),
            Photos(photoName: "131415")
            ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myTable = UITableView()
        myTable.delegate = self
        myTable.dataSource = self
        myTable.estimatedRowHeight = 190.0
        myTable.rowHeight = UITableView.automaticDimension
        myTable.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.identifier)
        myTable.backgroundColor = UIColor(red: 254/255, green: 254/255, blue: 254/255, alpha: 1)
        view.addSubview(myTable)
        myTable.snp.makeConstraints{(make) in
            make.edges.equalToSuperview()
        }
    }
    
    
}
extension ViewController: UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return group.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.identifier, for: indexPath) as? MyTableViewCell else{
            return UITableViewCell()
        }
        cell.setContent(names: group[indexPath.section].name, avatars: group[indexPath.section].avatar, content: group[indexPath.section].opinion, photosAmount: group[indexPath.section].photo.count, photosName: group[indexPath.section].photo[Photos])
        return cell
        
    }
    
}

