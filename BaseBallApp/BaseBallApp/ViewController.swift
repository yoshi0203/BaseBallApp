//
//  ViewController.swift
//  BaseBallApp
//
//  Created by 山中力仁 on 2017/07/18.
//  Copyright © 2017年 yamayoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var atBats: UITextField!          //打席数
    @IBOutlet weak var calcAverage: UILabel!         //打率値
    @IBOutlet weak var atHits: UITextField!          //安打数
    @IBOutlet weak var atFourBall: UITextField!      //四球数
    @IBOutlet weak var atDeadBall: UITextField!      //死球数
    @IBOutlet weak var atSacrificeFly: UITextField!  //犠飛数
    @IBOutlet weak var cntTwoBase: UITextField!      //二塁打数
    @IBOutlet weak var cntThreeBase: UITextField!    //三塁打数
    @IBOutlet weak var cntHomeRun: UITextField!      //本塁打数
    @IBOutlet weak var calcOBP: UILabel!             //出塁率値
    @IBOutlet weak var calcOPS: UILabel!             //OPS値
    
    @IBAction func calcButton(_ sender: Any) {
//        入力がなかった場合0を入れる
        let chkBats = atBats.text!
        let chkHits = atHits.text!
        let chkFB = atFourBall.text!
        let chkDB = atDeadBall.text!
        let chkSF = atSacrificeFly.text!
        let chkTWB = cntTwoBase.text!
        let chkTHB = cntThreeBase.text!
        let chkHR = cntHomeRun.text!
        
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
        if chkTWB == "" {
            cntTwoBase.text = "0"
        }
        if chkTHB == "" {
            cntThreeBase.text = "0"
        }
        if chkHR == "" {
            cntHomeRun.text = "0"
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
//            打率計算　＝　安打数/打数
            let ansAvr = ((calcHits! * 100) / calcBats! ) * 0.01
            calcAverage.text = String( format: "%.3f" , round(ansAvr * 1000) * 0.001 )
            
//打数0で安打1以上の場合を追加したい
//OPS計算機能を追加したい
            
        }
        //出塁率　＝　安打数+四球数+死球数　/　打数+四球数+死球数+犠飛数
        let ansOBP = (((calcHits! + calcFB! + calcDB!) * 100) / (calcBats! + calcFB! + calcDB! + calcSF!)) * 0.01
        calcOBP.text = String( format: "%.3f" , round(ansOBP * 1000) * 0.001 )
    }
    
    @IBAction func rstBtn(_ sender: UIButton) {
//リセット機能
        atBats.text = "0"
        atHits.text = "0"
        atFourBall.text = "0"
        atDeadBall.text = "0"
        atSacrificeFly.text = "0"
        cntTwoBase.text = "0"
        cntThreeBase.text = "0"
        cntHomeRun.text = "0"
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

