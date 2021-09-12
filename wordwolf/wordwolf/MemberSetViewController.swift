//
//  MemberSetViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2021/09/12.
//

import UIKit

class MemberSetViewController: UIViewController {

    var tappedBtnTag: Int?
    
    @IBOutlet weak var testLabel: UILabel!//ラベル
     
    @IBAction func changeStepperValue(sender: UIStepper) {
        testLabel.text = "\(sender.value)"
        imageRemove()
        setNameTextField(num: Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testLabel.text = "\(tappedBtnTag)"
        
        print("### tappedBtnTag:", tappedBtnTag as Any)
        setNameTextField(num: tappedBtnTag!)

        // Do any additional setup after loading the view.
    }
    
    func setNameTextField(num: Int){
        // 入力された数だけループします。
        for i in 0...num{
            let textField = UITextField(frame: CGRect(x: 60,y: 190+i*30,width: 120,height: 30)) // textFieldを作りましょう。
            textField.backgroundColor = UIColor.red // 白いとわかりずらいので赤くしました。
            self.view.addSubview(textField) // scrollViewにaddしましょう。
        }
    }

    func imageRemove(){
            // self.viewの上に乗っているオブジェクトを順番に取得する
            for v in view.subviews {
                // オブジェクトの型がUIImageView型で、タグ番号が1〜5番のオブジェクトを取得する
                if let v = v as? UITextField  {
                    // そのオブジェクトを親のviewから取り除く
                    v.removeFromSuperview()
                }
            }
        }
}
