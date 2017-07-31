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
    
    @IBAction func calcButton(_ sender: Any) {
//        入力がなかった場合0を入れる
        let chkBats = atBats.text!
        let chkHits = atHits.text!
        if chkBats == ""  {
            atBats.text = "0"
        }
        if chkHits == ""{
            atHits.text = "0"
        }
        
        let calcBats = Double(atBats.text!)
        let calcHits = Double(atHits.text!)
        
//        打席数と安打数が0の場合にNaNになるのを防ぐ
        if calcBats == 0 && calcHits == 0 {
            calcAverage.text = String(format: "%.3f" , 0)
//        その他は小数第3位で四捨五入で表示
        }else{
            let ansAvr = ((calcHits! * 100) / calcBats! ) * 0.01
            calcAverage.text = String(format: "%.3f" , round(ansAvr * 1000) * 0.001)
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

