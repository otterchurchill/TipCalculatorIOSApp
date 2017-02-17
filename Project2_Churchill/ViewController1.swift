//
//  ViewController.swift
//  Project2_Churchill
//
//  Created by user124420 on 1/25/17.
//  Copyright © 2017 user124420. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var subtotal: Int = 0
    var tax: Int = 0
    var tip: Int = 0
    var total: Int = 0
    
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
        
        subtotalLabel.isHidden = false
        
        totalLabel.isHidden = false
        
    }
    
    
    @IBAction func Showtext(_ sender: Any) {
        defaultView()
        taxLabel.isHidden = false
        tipLabel.isHidden = false
         }
   
    @IBAction func slideView(_ sender: Any) {
        defaultView()
        hs1.isHidden = false
        hs2.isHidden = false
        
        //let hs1Val : NSDecimalNumber = NSDecimalNumber(string: "12.0")
        //let hs2Val : NSDecimalNumber = NSDecimalNumber(string: ".3")
        //let out : NSDecimalNumber = hs1Val.multiplying(by: hs2Val)
        //taxLabel.text = "\(out)"
        
    }
    @IBAction func stepView(_ sender: Any) {
        defaultView()
        taxOut.isHidden = false
        tipOut.isHidden = false
    }
    
    
    @IBAction func taxSlide(_ sender: Any) {
        taxLabel.text = "\(hs1.value)"
        
        let hs1Val2 = NSDecimalNumber.init(value: hs1.value)
        subtotalLabel.text = "\(hs1Val2)"
    }
    
    @IBAction func tipSlide(_ sender: Any) {
        taxLabel.text = "\(hs2.value)"    }
    
    @IBAction func taxStep(_ sender: Any) {
        taxLabel.text = "\(taxOut.value)"    }
    
    
    
    @IBAction func tipStep(_ sender: Any) {
        taxLabel.text = "\(tipOut.value)"
    }
    
    
    @IBAction func taxText(_ sender: Any) {
    }
    
    @IBAction func tipText(_ sender: Any) {
    }
    
    
    @IBAction func ClearValues(_ sender: Any) {
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

