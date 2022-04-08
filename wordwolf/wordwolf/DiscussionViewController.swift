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
    var startTime: TimeInterval? = nil
    var timer = Timer()
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeStepper: UIStepper!
    @IBOutlet weak var startBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//      時間表示
        timeLabel.text = String(format: "%02d:00", time)
    }
    
    
    @IBAction func changeTimeStepper(_ sender: UIStepper) {
    }
    
//  タイマーカウント
    @objc func timerCounter() {
        guard let startTime = self.startTime else { return }
//      timeIntervalSinceReferenceDateは2001/01/01からの時間
        let timeCount = Double(time) * 60 - (Date.timeIntervalSinceReferenceDate - startTime)
        let min = Int(timeCount / 60)
        let sec = Int(timeCount) % 60
        self.timeLabel.text = String(format: "%02d:%02d", min, sec)
    }
    
    @IBAction func tapStartBtn(_ sender: Any) {
        timer.invalidate()
        self.startTime = Date.timeIntervalSinceReferenceDate
//      timeIntervalは１にしたら１秒ずつ
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapEnterButton(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: (memArray, tappedBtnTag))
    }

}
