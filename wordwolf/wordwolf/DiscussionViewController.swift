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
    var min: Int = 0
    var sec: Int = 0
    var stepperValue: Double = 0
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeStepper: UIStepper!
    @IBOutlet weak var startBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
//      時間表示
        min = time
        timeLabel.text = String(format: "%02d:%02d", min, sec)
        stepperValue = Double(time)
        timeStepper.value = Double(time)
    }
    
    
    @IBAction func changeTimeStepper(_ sender: UIStepper) {
        time = Int(sender.value)
        min = min + Int(sender.value - stepperValue)
        timeLabel.text = String(format: "%02d:%02d", min, sec)
        stepperValue = sender.value
    }
    
//  タイマーカウント
    @objc func timerCounter() {
        guard let startTime = self.startTime else { return }
//      timeIntervalSinceReferenceDateは2001/01/01からの時間
        let timeCount = Double(time) * 60 - (Date.timeIntervalSinceReferenceDate - startTime)
        min = Int(timeCount / 60)
        sec = Int(timeCount) % 60
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
