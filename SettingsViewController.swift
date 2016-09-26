//
//  SettingsViewController.swift
//  Tippy
//
//  Created by Ngoc Quy Nguyen on 9/26/16.
//  Copyright © 2016 Ngoc Quy Nguyen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var segRate: UISegmentedControl!
    @IBOutlet weak var txtBillAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let currentSettings = UserDefaults.standard
        let segRateIndex = currentSettings.integer(forKey: "segRateIndex")
        
        segRate.selectedSegmentIndex = segRateIndex
        
        let defaultBillAmount = currentSettings.float(forKey: "defaultBillAmount")
        
        txtBillAmount.text = String.init(format: "%.2f", defaultBillAmount)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let currentSettings = UserDefaults.standard
        let segRateIndex = segRate.selectedSegmentIndex
        currentSettings.set(segRateIndex, forKey: "segRateIndex")
        let defaultBillAmount = Float(txtBillAmount.text!) ?? 0
        currentSettings.set(defaultBillAmount, forKey: "defaultBillAmount")
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
