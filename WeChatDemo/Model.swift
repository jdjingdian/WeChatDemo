//
//  Model.swift
//  WeChatDemo
//
//  Created by djing on 2020/7/27.
//  Copyright © 2020 djing. All rights reserved.
//

import Foundation
struct Person {
    var name: String
    var avatar: String
    var opinion: String
    var photos = [String]()
}
struct Type{
    var typ: String
    var person:[Person]
}
