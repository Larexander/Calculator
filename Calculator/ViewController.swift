//
//  ViewController.swift
//  Calculator
//
//  Created by  Александр  on 04.12.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var numerOnScreen: Int = 0
    var firstNum: Int = 0
    var operation: Int = 0
    var mathSign: Bool = false
    
    @IBOutlet weak var result: UILabel! // Лейбл
    
    @IBAction func digit(_ sender: UIButton) { // Цифры
        
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        numerOnScreen = Int(result.text!)!
        
    }
    
    @IBAction func action(_ sender: UIButton) { // Действия
       
        if result.text != "" && sender.tag != 18 && sender.tag != 11 {
            
            firstNum = Int(result.text!)!
            
            if sender.tag == 14 {
                result.text = "/"
            }
           
            else if sender.tag == 15 {
                result.text = "x"
            }
            else if sender.tag == 16 {
                result.text = "-"
            }
            
            else if sender.tag == 17 {
                result.text = "+"
            }
           
            else if sender.tag == 18 {
                result.text = "="
            }
            
            else if sender.tag == 13 {
                result.text = "%"
            }
        
            operation = sender.tag
            mathSign = true
            
        }
        
        else if sender.tag == 18 { // Сумма операций
            
            if operation == 14 { // Сумма деления
                result.text = String(firstNum / numerOnScreen)
            }
            
            else if operation == 15 {
                result.text = String(firstNum * numerOnScreen)
            }
            
            if operation == 16 {
                result.text = String(firstNum - numerOnScreen)
            }
            
            if operation == 17 {
                result.text = String(firstNum + numerOnScreen)
                }
            
            if operation == 13 {
                result.text = String(firstNum % numerOnScreen)
            }
        }
        
        else if sender.tag == 11 { // Очистка
            
            result.text = ""
            firstNum = 0
            numerOnScreen = 0
            operation = 0
            
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

