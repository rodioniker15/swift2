//
//  ViewController.swift
//  TestTask
//
//  Created by Rudolph Rodion on 14.01.2022.
//

import UIKit


var globalArray = [PostsData]()



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var MyTableView = UITableView()
    let identifire = "MyCell"
    
//    var myArray = [PostData]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTable()
        readAndParseJson()
            print(globalArray)
        
    }

    func createTable() {

        self.MyTableView = UITableView(frame: view.bounds, style: .grouped)
        MyTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifire)

        self.MyTableView.delegate = self
        self.MyTableView.dataSource = self

        MyTableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(MyTableView)

    }
    
    // MARK - still do smth
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    // MARK - still do smth
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        _ = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath)
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        
        let x1 = globalArray
        cell.textLabel?.text = "\(x1)"
        
//        let x1 = globalArray[indexPath.row].title
//        cell.textLabel?.text = "\(x1)"
//        let x2 = globalArray[indexPath.row].previewText
//        cell.textLabel?.text = "\(x1)"
//        let x3 = globalArray[indexPath.row].likesCount
//        cell.textLabel?.text = "\(x1)"
//        let x4 = globalArray[indexPath.row].timeshamp
//        cell.textLabel?.text = "\(x1)"
        
//        cell.textLabel?.text = myArray[indexPath.row].previewText
//        cell.textLabel?.text = myArray[indexPath.row].previewText
//        cell.textLabel?.text = myArray[indexPath.row].likesCount
//        cell.textLabel?.text = myArray[indexPath.row].timeshamp

        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    


    func readAndParseJson() {
    if let url = URL(string: "https://raw.githubusercontent.com/aShaforostov/jsons/master/api/main.json" ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                do {
                    let parsedJson = try jsonDecoder.decode([PostsData].self, from: data)
                    
                    globalArray = parsedJson
                    
                    
                } catch {
                    print(error)
                }
            }
            
        } .resume()
    }
}


}



