//
//  ViewController.swift
//  Test
//
//  Created by Rudolph Rodion on 20.01.2022.
//

import UIKit

class ViewController: UITableViewController, myClassDelegate {


    var myArrData = [PostData]()
    
    var selectedCell: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Main"
        view.backgroundColor = .black
        readAndParseJson()
        
        configureItems()
        
    }

    
    
    
    @objc func showSort() {
        let myActionSheet = UIAlertController(title: "Sort", message: "How you want to sort?", preferredStyle: UIAlertController.Style.actionSheet)
        
        let sortMoreLikesButtonAction = UIAlertAction(title: "More likes", style: UIAlertAction.Style.default) { [self] (ACTION) in
            sortMoreLikes()
        }
        
        let sortLessLikesButtonAction = UIAlertAction(title: "Less likes", style: UIAlertAction.Style.default) { [self] (ACTION) in
            sortLessLikes()
        }
        
        let earlierTimeshampButtonAction = UIAlertAction(title: "Earlier Time", style: UIAlertAction.Style.default) { [self] (ACTION) in
            sortMoreTimeshamp()
        }
        
        let laterTimeshampButtonAction = UIAlertAction(title: "Later time", style: UIAlertAction.Style.default) { [self] (ACTION) in
            sortLessTimeshamp()
        }
        
        let cancelButtonAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel) { [self] (ACTION) in
            sortCancel()
        }
        
        myActionSheet.addAction(sortMoreLikesButtonAction)
        myActionSheet.addAction(sortLessLikesButtonAction)
        myActionSheet.addAction(earlierTimeshampButtonAction)
        myActionSheet.addAction(laterTimeshampButtonAction)
        myActionSheet.addAction(cancelButtonAction)
        
        self.present(myActionSheet, animated: true, completion: nil)
    }
    
    
    func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "sort",
            style: .plain,
            target: self,
            action: #selector (showSort)

        )
    }
    
    func sortMoreLikes() {
        myArrData.sort() { $0.likes_count > $1.likes_count}
        tableView.reloadData()
    }
    
    func sortLessLikes() {
        myArrData.sort() { $0.likes_count < $1.likes_count}
        tableView.reloadData()
    }
    
    func sortMoreTimeshamp() {
        myArrData.sort() { $0.timeshamp > $1.timeshamp}
        tableView.reloadData()
    }
    
    func sortLessTimeshamp() {
        myArrData.sort() { $0.timeshamp < $1.timeshamp}
        tableView.reloadData()
    }
    
    func sortCancel() {
        myArrData.sort() { $0.postId < $1.postId }
        tableView.reloadData()
    }
    
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myArrData.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyClassId", for: indexPath) as! myClass
        
        let arrData = myArrData[indexPath.row]
        
        if indexPath.row == selectedCell {
            cell.labelPreview?.numberOfLines = 0
            cell.showAllButton.setTitle("Show less", for: .normal)
        } else {
            cell.labelPreview?.numberOfLines = 2
            cell.showAllButton.setTitle("Show more", for: .normal)
        }
        
        cell.delegate = self
        cell.labelTitle?.text = "\(arrData.title)"
        cell.labelPreview?.text = "\(arrData.preview_text)"
        cell.labelLike?.text = "🖤 \(arrData.likes_count)"
        cell.labelTimeshamp?.text = "\(arrData.timeshamp / 60 / 100000) minutes earlier"
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "detail_vc") as! DetailViewController

        navigationController?.pushViewController(vc, animated: true)
        
        
        let myNewData = myArrData[indexPath.row]
                
        vc.lbltitle = "\(myNewData.title)"
        vc.lblpreview = "\(myNewData.preview_text)"
        vc.lbllike = myNewData.likes_count
        vc.lbltime = myNewData.timeshamp

    }
    

    func readAndParseJson() -> [PostData] {
        if let url = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    let jsonDecoder = JSONDecoder()
//                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    do {
                        let parsedJson = try jsonDecoder.decode(PostsData.self, from: data)
                        let greatData = parsedJson.posts
                        self.myArrData = greatData
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
            }catch{
                print("Error! \(error)")
            }
                }
        }.resume()
    }
        return myArrData
}

    func updateSelected(cell: UITableViewCell) {
        guard let row = tableView.indexPath(for: cell)?.row else { return }
        
        if row == selectedCell {
            selectedCell = nil
        } else {
            selectedCell = row
        }
        tableView.reloadData()
    }


}

