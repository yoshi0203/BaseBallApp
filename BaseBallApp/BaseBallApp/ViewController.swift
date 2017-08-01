//
//  ViewController.swift
//  BaseBallApp
//
//  Created by 山中力仁 on 2017/07/18.
//  Copyright © 2017年 yamayoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var atBats: UITextField!
    @IBOutlet weak var calcAverage: UILabel!
    @IBOutlet weak var atHits: UITextField!
    @IBOutlet weak var atFourBall: UITextField!
    @IBOutlet weak var atDeadBall: UITextField!
    @IBOutlet weak var atSacrificeFly: UITextField!
    @IBOutlet weak var calcOBP: UILabel!
    
    @IBAction func calcButton(_ sender: Any) {
//        入力がなかった場合0を入れる
        let chkBats = atBats.text!
        let chkHits = atHits.text!
        let chkFB = atFourBall.text!
        let chkDB = atDeadBall.text!
        let chkSF = atSacrificeFly.text!
        
        if chkBats == ""  {
            atBats.text = "0"
        }
        if chkHits == "" {
            atHits.text = "0"
        }
        if chkFB == "" {
            atFourBall.text = "0"
        }
        if chkDB == "" {
            atDeadBall.text = "0"
        }
        if chkSF == "" {
            atSacrificeFly.text = "0"
        }
        
        
        let calcBats = Double(atBats.text!)
        let calcHits = Double(atHits.text!)
        let calcFB = Double(atFourBall.text!)
        let calcDB = Double(atDeadBall.text!)
        let calcSF = Double(atSacrificeFly.text!)
        
//        打席数と安打数が0の場合にNaNになるのを防ぐ
        if calcBats == 0 && calcHits == 0 {
            calcAverage.text = String(format: "%.3f" , 0)
//        その他は小数第3位で四捨五入で表示
        }else{
//            打率計算　＝　安打数/打席数
            let ansAvr = ((calcHits! * 100) / calcBats! ) * 0.01
            calcAverage.text = String( format: "%.3f" , round(ansAvr * 1000) * 0.001 )
            
//            出塁率　＝　安打数+四球数+死球数　/　打席数+四球数+死球数+犠飛数
            let ansOBP = (((calcHits! + calcFB! + calcDB!) * 100) / (calcBats! + calcFB! + calcDB! + calcSF!)) * 0.01
            calcOBP.text = String( format: "%.3f" , round(ansOBP * 1000) * 0.001 )
        }
    }
    
    //    画面タップでキーボードを隠す
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

