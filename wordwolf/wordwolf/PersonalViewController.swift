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
    var clewNum: Int?
    var wolfNum: Int?
    var foxNum: Int?
    var memInt: Int = 0
    var words: [String: String] = [:]
    var clewIdx = [Int?]()
    var wolfIdx = [Int?]()
    var foxIdx = [Int?]()
    
    
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
//        let test_words = RealmWords()
//        test_words.clew = "ポニーテール"
//        test_words.wolf = "ツインテール"
//        test_words.fox = "わき毛"
//
//        try! realm.write {
//            realm.add(test_words)
//        }

//      ワード選び
        if memInt == 0{
            words = pickWords()
            print(words)
            
            randomRole()
        }
        
//      ワードの表示
        setWord()
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
    
    func pickWords() -> [String: String]{
        let results = realm.objects(RealmWords.self)
        let randomWords = results.randomElement()!
        return ["clew": randomWords.clew, "wolf": randomWords.wolf, "fox": randomWords.fox]
    }
    
    func randomRole(){
//      クルーの配列作る
        for i in 0..<memArray.count{
            clewIdx.append(i)
        }
//      狼配列
        for _ in 0..<wolfNum!{
            let j = Int.random(in: 0..<clewIdx.count)
            wolfIdx.append(clewIdx[j])
            clewIdx.remove(at: j)
        }
//      狐配列
        for _ in 0..<foxNum!{
            let j = Int.random(in: 0..<clewIdx.count)
            foxIdx.append(clewIdx[j])
            clewIdx.remove(at: j)
        }
    }
    
    func setWord(){
        if clewIdx.contains(memInt){
            wordLabel.text = "あなたのワードは" + words["clew"]! + "です。"
        }else if wolfIdx.contains(memInt){
            wordLabel.text = "あなたのワードは" + words["wolf"]! + "です。"
        }else if foxIdx.contains(memInt){
            wordLabel.text = "あなたのワードは" + words["fox"]! + "です。"
        }
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
