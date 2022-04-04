//
//  RolesViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2021/11/17.
//

import UIKit

class RolesViewController: UIViewController {

    var memArray = [String?]()
    var tappedBtnTag: Int?
    var memNum: Int = 3
    var wolfNum: Int = 1
    var foxNum: Int?
    var clewNum: Int = 1
    
    //ステッパー
    @IBOutlet weak var wolfStepper: UIStepper!
    @IBOutlet weak var foxStepper: UIStepper!
    @IBOutlet weak var timeStepper: UIStepper!
    
    //ラベル
    @IBOutlet weak var clewLabel: UILabel!
    @IBOutlet weak var wolfLabel: UILabel!
    @IBOutlet weak var foxLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    //狐のタイトルタグを消すため
    @IBOutlet weak var foxNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(memArray.count)
        memNum = memArray.count
        
        if(tappedBtnTag == 3){
            //狐なしの場合
            foxStepper.isHidden = true
            foxLabel.isHidden = true
            foxNameLabel.isHidden = true
            clewNum = memNum - 1
        }else{
            //狐あり
            clewNum = memNum - 2
            foxNum = 1
            foxLabel.text = "\(foxNum!)"
            foxStepper.value = Double(foxNum!)
        }
        clewLabel.text = "\(clewNum)"
        wolfLabel.text = "\(wolfNum)"
        wolfStepper.value = Double(wolfNum)
        changeMax(clew: clewNum, wolf: wolfNum, fox: foxNum)
        //タイマーの時間変えられるようにする
        timeLabel.text = "\(Int(timeStepper.value))分"
    }
    
    @IBAction func changeWolfStepper(_ sender: UIStepper) {
        print(sender.value)
        wolfNum = Int(sender.value)
        wolfLabel.text = "\(wolfNum)"
        consistMemNum(wolf: sender, fox: foxStepper)
        changeMax(clew: clewNum, wolf: wolfNum, fox: foxNum)
    }
    
    @IBAction func changeFoxStepper(_ sender: UIStepper) {
        print(sender.value)
        foxNum = Int(sender.value)
        foxLabel.text = "\(foxNum!)"
        consistMemNum(wolf: wolfStepper, fox: sender)
        changeMax(clew: clewNum, wolf: wolfNum, fox: foxNum)
    }
    
    //市民の人数で整合性をとる
    func consistMemNum(wolf: UIStepper, fox: UIStepper){
        clewNum = memNum - Int(wolf.value) - Int(fox.value)
        clewLabel.text = "\(clewNum)"
    }
    
    //人数の最大値を決める
    func changeMax(clew: Int, wolf: Int, fox: Int?){
        if (clew - wolf == 1){
            //整合性をとって市民が減っても人狼の人数が超えないように
            wolfStepper.maximumValue = Double(clew - 1)
        }else{
            wolfStepper.maximumValue = Double(clew)
        }
        //狐ありの場合
        if ((fox) != nil){
            wolfStepper.minimumValue = Double(fox!)
            if (clew - fox! == 1){
                foxStepper.maximumValue = min(Double(wolf), Double(clew - 1))
            }else{
                foxStepper.maximumValue = min(Double(wolf), Double(clew))
            }
        }
    }
    
    @IBAction func changeTimeStepper(_ sender: UIStepper) {
        print(sender.value)
        timeLabel.text = "\(Int(sender.value))分"
        print(timeLabel.text!)
    }
    
    @IBAction func tapEnterButton(_ sender: Any) {
        performSegue(withIdentifier: "toPersonalPage", sender: (memArray, tappedBtnTag, clewNum, wolfNum, foxNum))
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
     }
    
    //画面遷移の設定
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toPersonalPage"){
            let data: (nextMemArray: [String], nextBtnTag: Int, nextClewNum: Int, nextWolfNum: Int, nextFoxNum: Int?) = (sender as? ([String], Int, Int, Int, Int?))!
            if let nextVC = segue.destination as? PersonalViewController{
                nextVC.memArray = data.nextMemArray
                nextVC.tappedBtnTag = data.nextBtnTag
                nextVC.clewNum = data.nextClewNum
                nextVC.wolfNum = data.nextWolfNum
                nextVC.foxNum = data.nextFoxNum
            }
        }
    }
    

}
