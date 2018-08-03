//
//  Contents.swift
//  NewsAPI
//
//  Created by tatsumi kentaro on 2018/08/03.
//  Copyright © 2018年 tatsumi kentaro. All rights reserved.
//

import Foundation
import UIKit

class Contents {
    var url:URL!
    var name:String!
    var date:String!
    init(url:URL,name:String,date:String) {
        self.url = url
        self.name = name
        self.date = date
    }
}
