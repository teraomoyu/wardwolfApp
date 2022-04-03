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
    var memInt: Int = 0
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var enterButton: UIButton!
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(memArray)
        
//      メンバー名の表示
        nameLabel.text = memArray[memInt]
        print(nameLabel.text!)
        
        //Realmのテスト
        let test_words = RealmWords()
        test_words.clew = "ワンピース"
        test_words.wolf = "ドレス"
        test_words.fox = "ピザ"

        try! realm.write {
            realm.add(test_words)
        }

        let results = realm.objects(RealmWords.self)
        if memInt == 0{
            print(results)
            let randomWords = results.randomElement()!
            print(randomWords)
        }
        
        
//      ワードの表示
        wordLabel.text = "test"
        print(wordLabel.text!)

       
       
    }
    
    @IBAction func tapNextButton(_ sender: Any) {
        memInt = memInt + 1  // 次の人の名前インデックス更新
        viewDidLoad()  //画面更新
        if (memInt == memArray.count - 1){
            nextButton.isHidden = true
            enterButton.isHidden = false
        }
        
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapEnterButton(_ sender: Any) {
        performSegue(withIdentifier:  "nextPerson", sender: (memArray, tappedBtnTag, memInt+1))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "nextPerson"){
            let data: (nextMemArray: [String?], nextBtnTag: Int, nextMemInt: Int) = (sender as? ([String], Int, Int))!
            if let nextVC = segue.destination as? PersonalViewController{
                nextVC.memArray = data.nextMemArray
                nextVC.tappedBtnTag = data.nextBtnTag
                nextVC.memInt = data.nextMemInt
            }
        }
    }
}
