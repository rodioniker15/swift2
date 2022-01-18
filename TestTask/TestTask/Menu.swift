//
//  Menu.swift
//  TestTask
//
//  Created by Rudolph Rodion on 14.01.2022.
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
