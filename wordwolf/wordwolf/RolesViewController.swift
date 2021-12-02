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
    
    @IBOutlet weak var clewStepper: UIStepper!
    @IBOutlet weak var wolfStepper: UIStepper!
    @IBOutlet weak var foxStepper: UIStepper!
    @IBOutlet weak var clewLabel: UILabel!
    @IBOutlet weak var wolfLabel: UILabel!
    @IBOutlet weak var foxLabel: UILabel!
    @IBOutlet weak var foxNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(memArray.count)
        var wolfNum = 1
        var clewNum: Int
        if(tappedBtnTag == 3){
            foxStepper.isHidden = true
            foxLabel.isHidden = true
            foxNameLabel.isHidden = true
            clewNum = memArray.count - 1
        }else{
            clewNum = memArray.count - 2
            var foxNum = 1
            foxLabel.text = "\(foxNum)"
        }
        clewLabel.text = "\(clewNum)"
        wolfLabel.text = "\(wolfNum)"
        
        // Do any additional setup after loading the view.
    }
    

    
     @IBAction func tapBackBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
     }
    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
