//
//  DiscussionViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2022/04/06.
//

import UIKit

class DiscussionViewController: UIViewController {
    
    var memArray = [String?]()
    var tappedBtnTag: Int?
    var memInt: Int?
    var time: Int = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeStepper: UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
//      時間表示
        timeLabel.text = "\(time)分"
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapEnterButton(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: (memArray, tappedBtnTag))
    }

}
