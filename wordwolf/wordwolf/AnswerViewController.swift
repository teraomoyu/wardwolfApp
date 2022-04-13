//
//  AnswerViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2022/04/12.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var memArray = [String?]()
    var tappedBtnTag: Int?
    var memAndWord: [String: [String]] = [:]
    var labelFields = [UILabel]()
    var i: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(memAndWord)
        
        for (key, value) in memAndWord {
            print(key, value)
            let answerLabel = UILabel(frame: CGRect(x: 60,y: 210+i*45,width: Int(UIScreen.main.bounds.size.width)-120, height: 40))
            answerLabel.text = key + "さん　：　" + value[1] + "→" + value[0]
            labelFields.append(answerLabel)
            self.view.addSubview(labelFields[i])
            i += 1
        }
        
        // Do any additional setup after loading the view.
    }

}
