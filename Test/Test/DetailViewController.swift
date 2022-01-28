//
//  DetailViewController.swift
//  Test
//
//  Created by Rudolph Rodion on 20.01.2022.
//

import UIKit


class DetailViewController: UITableViewController  {
    
    
    var lbltitle = ""
    var lblpreview = ""
    var lbllike = 0
    var lbltime = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassNewId", for: indexPath) as! myClassNew
        
        
        
        cell.labelTitle2?.text = "\(lbltitle)"
        cell.labelPreview2?.text = "\(lblpreview)"
        cell.labelLike2?.text = "🖤 \(lbllike)"
        cell.labelTimeshamp2?.text = "\(lbltime / 60 / 100000) minutes earlier"
        
        return cell
        
    }
    
    
}
