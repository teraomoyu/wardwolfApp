//
//  SellectViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2021/09/12.
//

import UIKit

class SellectViewController: UIViewController {

    
    var tagNumber = 0
    @IBOutlet weak var foxButton: UIButton!
    @IBOutlet weak var wolfButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tapWolfButton(_ sender: UIButton) {
        tagNumber = sender.tag
        print(tagNumber)
        performSegue(withIdentifier: "toMemberSetting", sender: tagNumber)
    }
    
    @IBAction func tapFoxButton(_ sender: UIButton) {
        tagNumber = sender.tag
        print(tagNumber)
        performSegue(withIdentifier: "toMemberSetting", sender: tagNumber)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "toMemberSetting") {
                if let vc2 = segue.destination as? MemberSetViewController{
                // ViewControllerのtextVC2にメッセージを設定
                    vc2.tappedBtnTag = sender as? Int
                }
            }
        }

}
