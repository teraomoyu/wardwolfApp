//
//  PersonalViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2022/03/17.
//

import UIKit
import RealmSwift

class PersonalViewController: UIViewController {
    
    var memArray = [String?]()
    var tappedBtnTag: Int?
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(memArray)
        
        //テスト
        let test_words = RealmWords()
        test_words.clew = "エビ"
        test_words.wolf = "カニ"
        test_words.fox = "ゴキブリ"

        
        try! realm.write {
            realm.add(test_words)
        }

        let results = realm.objects(RealmWords.self)
        print(results)
    }
}
