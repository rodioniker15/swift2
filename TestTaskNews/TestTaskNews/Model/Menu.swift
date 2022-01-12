//
//  Menu.swift
//  TestTaskNews
//
//  Created by Rudolph Rodion on 12.01.2022.
//

import Foundation


struct PostsData : Codable {
    let posts : [PostData]
}

struct PostData : Codable {
    let postId : Int
    let timeshamp : Int
    let title : String
    let previewText : String
    let likesCount : Int
}


class DecodedJson {
    var postId : Int = 0
    var timeshamp : Int = 0
    var title : String = ""
    var previewText : String = ""
    var likesCount : Int = 0
}



