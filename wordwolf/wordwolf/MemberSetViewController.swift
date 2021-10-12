//
//  MemberSetViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2021/09/12.
//

import UIKit

class MemberSetViewController: UIViewController{

    var tappedBtnTag: Int?
    
    @IBOutlet weak var testLabel: UILabel!//ラベル
     
    @IBOutlet weak var stepper: UIStepper!
    var memberNames = [String]()//メンバーの名前を格納する配列
    
    @IBAction func tapEnterButton(_ sender: Any, textFields: [UITextField]) {
        let memberNum = textFields.count
        for i in 0...memberNum-1{
            memberNames.append(textFields[i].text!)
            textFields[i].text = ""
        }
    }
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func changeStepperValue(sender: UIStepper) {
        testLabel.text = "\(String(format: "%.0f", sender.value))"//人数を変えた時に少数にならないようにformat設定
        imageRemove()
        setNameTextField(num: Int(sender.value))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let member_num = tappedBtnTag
        testLabel.text = "\(member_num!)"//!をつけたらOptionalが付かなくなった
        stepper.minimumValue = Double(Int(member_num!)) //狐か狼かによって最小値を変える
        print("### tappedBtnTag:", tappedBtnTag as Any)
        setNameTextField(num: tappedBtnTag!)

        // Do any additional setup after loading the view.
    }
    
    //入力欄を増やす
    func setNameTextField(num: Int){
        var textFields = [UITextField]()
        // 入力された数だけループします。
        for i in 0...num-1{
            var oneTextField = UITextField(frame: CGRect(x: 60,y: 210+i*45,width: Int(UIScreen.main.bounds.size.width)-120, height: 40))
            oneTextField.backgroundColor = UIColor.red // テキストフィールドの色
            oneTextField.setUnderLine()
            textFields.append(oneTextField)
        }
        for i in 0...num-1{
//            let textField = UITextField(frame: CGRect(x: 60,y: 210+i*45,width: Int(UIScreen.main.bounds.size.width)-120, height: 40)) // textFieldを作る。スクリーンの横幅取得して真ん中に。
//            textField.backgroundColor = UIColor.white // テキストフィールドの色
//            textField.setUnderLine()
            
            self.view.addSubview(textFields[i]) // scrollViewにaddしましょう。
        }
    }
    //入力欄を減らす
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

//テキストフィールドを下線にする
extension UITextField {
    func setUnderLine() {
        // 枠線を非表示にする
        borderStyle = .none
        let underline = UIView()
        // heightにはアンダーラインの高さを入れる
        underline.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 0.5)
        // 枠線の色
        underline.backgroundColor = UIColor.black
        addSubview(underline)
        // 枠線を最前面に
        bringSubviewToFront(underline)
    }
}
