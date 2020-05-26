//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by William Tomaz on 25/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var slTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    let config = Configuration.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil) { (notification) in
            
            self.formatView()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        formatView()
    }
    
    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        config.autorefresh = sender.isOn // altera o valor na userdafaults
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        let value = Double(round(sender.value)) //metodo round arredonda o valor, não precisaria por estar convertendo em inteiro
        changeTimeIntervalLabel(with: value) //altera o valor da label
        config.timeInterval = value // altera o valor no userDafaults
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex //pega o segmento e altera na userdefaults
    }
    
    func formatView(){ //carrega as views de acordo com o userdefault
        swAutorefresh.setOn(config.autorefresh, animated: false)
        slTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = config.colorScheme
        changeTimeIntervalLabel(with: config.timeInterval)
    }
    
    func changeTimeIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }
}

