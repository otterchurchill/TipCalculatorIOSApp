//
//  ViewController.swift
//  Project2_Churchill
//
//  Created by user124420 on 1/25/17.
//  Copyright © 2017 user124420. All rights reserved.
//
//========To-do==========\\
//add subtotal action on change
//diplay rounded number




import UIKit

class ViewController: UIViewController {
    
    let True = true
    var subtotal: NSDecimalNumber = 0.0001
    var tax: NSDecimalNumber = 0.081
    var tip: NSDecimalNumber = 0.0001
    var total: NSDecimalNumber = 0.0001
    
    @IBOutlet weak var finish: UILabel!
    @IBOutlet weak var subtotNoIN: UILabel!
    @IBOutlet weak var taxNoIN: UILabel!
    @IBOutlet weak var tipNoIn: UILabel!
    @IBOutlet weak var totalNoIn: UILabel!
    
    @IBOutlet weak var hs1: UISlider!
    @IBOutlet weak var hs2: UISlider!
    
    @IBOutlet weak var taxOut: UIStepper!
    @IBOutlet weak var tipOut: UIStepper!
   
    @IBOutlet weak var subtotalLabel: UITextField!
    @IBOutlet weak var taxLabel: UITextField!
    @IBOutlet weak var tipLabel: UITextField!
    @IBOutlet weak var totalLabel: UITextField!

    func defaultView() {
        
        subtotNoIN.isHidden = false
        taxNoIN.isHidden = false
        tipNoIn.isHidden = false
        totalNoIn.isHidden = false
        finish.isHidden = false
        
        subtotalLabel.isHidden = false
        totalLabel.isHidden = false
        
    }

    func Hidden(stateText: Bool, stateSlide: Bool, stateStepper:Bool){
        hs1.isHidden = stateSlide
        hs2.isHidden = stateSlide
        taxOut.isHidden = stateStepper
        tipOut.isHidden = stateStepper
        taxLabel.isHidden = stateText
        tipLabel.isHidden = stateText
    }

    func GetTotal(){
    
    let taxAmnt : NSDecimalNumber = subtotal.multiplying(by: tax)
    let subNTax = subtotal.adding(taxAmnt)
    let tipAmnt = subNTax.multiplying(by: tip)
    let subNTaxNTip = subNTax.adding(tipAmnt)

        
    total = subNTaxNTip
        
    let handler = NSDecimalNumberHandler(roundingMode: NSDecimalNumber.RoundingMode.up, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
    let final = subNTaxNTip.rounding(accordingToBehavior:  handler)
        
    totalLabel.text = "\(final)"

    }
    @IBAction func Showtext(_ sender: Any) {
        defaultView()
        Hidden(stateText: !True, stateSlide: True, stateStepper: True)
         }
   
    @IBAction func slideView(_ sender: Any) {
        defaultView()
        Hidden(stateText: True, stateSlide: !True, stateStepper: True)
       
    }



    @IBAction func stepView(_ sender: Any) {
        defaultView()
        Hidden(stateText: True, stateSlide: True, stateStepper: !True)
    }

    @IBAction func subtotText(_ sender: Any) {
        subtotal = NSDecimalNumber(string: subtotalLabel.text)
        GetTotal()
    }
    
    @IBAction func taxSlide(_ sender: Any) {
        
        tax = NSDecimalNumber.init(value: hs1.value)
        //tax = NSDecimalNumber.init(decimal: <#T##Decimal#>): hs1.value)
        taxLabel.text = "\(tax)"
        GetTotal()
    }
    
 
    @IBAction func tipSlide(_ sender: Any) {
        tip = NSDecimalNumber.init(value: hs2.value)
        tipLabel.text = "\(hs2.value)"
        GetTotal()
    }
    
    @IBAction func taxReally(_ sender: UIStepper) {
    //@IBAction func taxagain(_ sender: UIStepper) {
    //@IBAction func taxStep2(_ sender: UIStepper) {
    //@IBAction func taxStep(_ sender: UIStepper) {
    //@IBAction func taxStepper(_ sender: UIStepper) {
        tax = NSDecimalNumber.init(value: taxOut.value)
        tax = tax.dividing(by:100)
        GetTotal()
    }
    
    
    

    @IBAction func TippStepper(_ sender: UIStepper) {
    //@IBAction func tipStepper(_ sender: Any) {
        tip = NSDecimalNumber.init(value: tipOut.value)
        tip = tip.dividing(by: 100)
        GetTotal()
    }
    
    @IBAction func taxTxtUpdate(_ sender: Any) {
        tax = NSDecimalNumber(string: taxLabel.text)
        tax = tax.dividing(by:100)
        GetTotal()
    }
    


    @IBAction func tipText(_ sender: Any) {
        tip = NSDecimalNumber(string: tipLabel.text)
        tip = tip.dividing(by: 100)
        GetTotal()
        

    }
    
    @IBAction func ClearValues(_ sender: Any) {
        subtotalLabel.text = "0"
        totalLabel.text = "0"

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

