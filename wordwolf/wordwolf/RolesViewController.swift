//
//  RolesViewController.swift
//  wordwolf
//
//  Created by Moyu Terao on 2021/11/17.
//

import UIKit

class RolesViewController: UIViewController {

    var memArray = [String?]()
    
    @IBOutlet weak var clewStepper: UIStepper!
    @IBOutlet weak var wolfStepper: UIStepper!
    @IBOutlet weak var foxStepper: UIStepper!
    @IBOutlet weak var clewLabel: UILabel!
    @IBOutlet weak var wolfLabel: UILabel!
    @IBOutlet weak var foxLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(memArray)
        var clewNum = memArray.count - 2
        var wolfNum = 1
        var foxNum = 1
        clewLabel.text = "\(clewNum)"
        wolfLabel.text = "\(wolfNum)"
        foxLabel.text = "\(foxNum)"
        // Do any additional setup after loading the view.
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
