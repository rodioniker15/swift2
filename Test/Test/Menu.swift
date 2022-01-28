//
//  Menu.swift
//  Test
//
//  Created by Rudolph Rodion on 20.01.2022.
//

import UIKit

struct PostsData : Codable {
    let posts : [PostData]
}

struct PostData : Codable {
    let postId : Int
    let timeshamp : Int
    let title : String
    let preview_text : String
    let likes_count : Int
}

protocol myClassDelegate: AnyObject {
    func updateSelected(cell: UITableViewCell)
}

class myClass : UITableViewCell {

    @IBOutlet var labelTitle: UILabel!
    @IBOutlet var labelPreview: UILabel!
    @IBOutlet var labelLike: UILabel!
    @IBOutlet var labelTimeshamp: UILabel!
    @IBOutlet var showAllButton: UIButton!
    
    weak var delegate: myClassDelegate?
    
    @IBAction func showAll() {
        delegate?.updateSelected(cell: self)
    }
    
}

class myClassNew : UITableViewCell {

    @IBOutlet var labelTitle2: UILabel!
    @IBOutlet var labelPreview2: UILabel!
    @IBOutlet var labelLike2: UILabel!
    @IBOutlet var labelTimeshamp2: UILabel!

    
}




