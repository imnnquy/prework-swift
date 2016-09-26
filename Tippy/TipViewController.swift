//
//  ViewController.swift
//  Tippy
//
//  Created by Ngoc Quy Nguyen on 9/26/16.
//  Copyright © 2016 Ngoc Quy Nguyen. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var txtBillAmount: UITextField!
    @IBOutlet weak var lbTip: UILabel!
    @IBOutlet weak var lbTotal: UILabel!
    @IBOutlet weak var segRate: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let currentSettings = UserDefaults.standard
        let segRateIndex = currentSettings.integer(forKey: "segRateIndex")
        
        segRate.selectedSegmentIndex = segRateIndex
        
        let defaultBillAmount = currentSettings.float(forKey: "defaultBillAmount")
        
        txtBillAmount.text = String.init(format: "%.2f", defaultBillAmount)
        
        onChangeBill(txtBillAmount)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func onChangeBill(_ sender: AnyObject) {
        
        let tipRate = [0.15, 0.2, 0.25]
        
        let billAmount = Double(self.txtBillAmount.text!) ?? 0
        let tip = billAmount * tipRate[segRate.selectedSegmentIndex]
        let total = billAmount + tip
        
        lbTip.text = String.init(format: "$%.2f", tip)
        lbTotal.text = String.init(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let currentSettings = UserDefaults.standard
        let segRateIndex = currentSettings.integer(forKey: "segRateIndex")
        
        segRate.selectedSegmentIndex = segRateIndex
        
        onChangeBill(txtBillAmount)

    }
    
    @IBAction func onFocusBillAmount(_ sender: AnyObject) {
        txtBillAmount.text = ""
        onChangeBill(txtBillAmount)
    }
    
    
}

