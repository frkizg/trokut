//
//  FirstViewController.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var textFieldStranicaA: UITextField!
    @IBOutlet weak var textFieldStranicaB: UITextField!
    @IBOutlet weak var textFieldStranicaC: UITextField!
    
    var trokut = Trokut()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func izracunaBtnPressed(_ sender: Any) {
        
        if let stranicaA = Double(textFieldStranicaA.text!), let stranicaB = Double(textFieldStranicaB.text!), let stranicaC = Double(textFieldStranicaC.text!){
            
            trokut.stranicaA = stranicaA
            trokut.stranicaB = stranicaB
            trokut.stranicaC = stranicaC
            
            trokutArray.append(trokut)
            
            performSegue(withIdentifier: "toPovrsinaTrokutaVC", sender: self)
            
        } else {
            let alert = UIAlertController(title: "Greška", message: "Neispravan unos", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "toPovrsinaTrokutaVC"{
            guard let povrsinaTrokutaVC = segue.destination as? PovrsinaTrokutaVC else {
                debugPrint("PovrsinaTrokutaVC not initialised")
                return }
            
            povrsinaTrokutaVC.trokut = trokut
        }
        
    }
    

}

