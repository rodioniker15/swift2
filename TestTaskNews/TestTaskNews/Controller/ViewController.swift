//
//  ViewController.swift
//  TestTaskNews
//
//  Created by Rudolph Rodion on 04.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    

    var postsData : [PostsData?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        
        
        
        if let localData = readLocalJsonFile(forName: "data") {
            parse(jsonData: localData)
        }
        
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return postsData.count
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return postsData.count
    }
}

func readLocalJsonFile (forName name : String) -> Data? {
    do {
        if let fileUrl = Bundle.main.url(forResource: name, withExtension: "json") {

            return try Data(contentsOf: fileUrl)
        }
    } catch {
        print("error: \(error)")
    }
    return nil
}


private func parse(jsonData: Data){
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let postsData = try decoder.decode(PostsData.self, from: jsonData)
        
        let readyData = DecodedJson()
        
        for post in postsData.posts {
            readyData.postId = post.postId
            readyData.timeshamp = post.timeshamp
            readyData.title = post.title
            readyData.previewText = post.previewText
            readyData.likesCount = post.likesCount
        }
        print(readyData)
        
    } catch {
        print("decode error: ", error)
    }
    
}



