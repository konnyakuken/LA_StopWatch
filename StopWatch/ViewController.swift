//
//  ViewController.swift
//  StopWatch
//
//  Created by 若宮拓也 on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var result:UILabel!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = ""
    }
    
    @objc func up(){
        count += 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if(count>=9.80 && count<=10.20){
            result.text = "PERFECT!!"
        }else if(count>=9.70 && count<=10.30){
            result.text = "GREAT"
        }else if (count>=9.50 && count<=10.50){
            result.text = "GOOD"
        }else{
            result.text = "BAD"
        }
    }
    
    @IBAction func start(){
        if(!timer.isValid){
            result.text = ""
            //もしtimerがfalseなら
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    @IBAction func stop(){
        if (timer.isValid){
            timer.invalidate()
            
            self.hantei()
        }
    }
    
    @IBAction func reset(){
        if(timer.isValid){
            timer.invalidate()
        }else{
            count = 0.0
            label.text = String(format: "%.2f", count)
            result.text = ""
        }
        
    }


}

