//
//  FirstViewController.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import UIKit

class UnosPodatakaVC: UIViewController {

    @IBOutlet weak var textFieldStranicaA: UITextField!
    @IBOutlet weak var textFieldStranicaB: UITextField!
    @IBOutlet weak var textFieldStranicaC: UITextField!
    
   //(stranicaA: 0, stranicaB: 0, stranicaC: 0, datum: NSDate())

    var povrsina = 0.0
    var userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if trokutArray.count < 1{
            loadData()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        saveData()
    }
    
    @IBAction func izracunaBtnPressed(_ sender: Any) {
        
        if let stranicaA = Double(textFieldStranicaA.text!), let stranicaB = Double(textFieldStranicaB.text!), let stranicaC = Double(textFieldStranicaC.text!){
            
             let trokut = Trokut(stranicaA: stranicaA, stranicaB: stranicaB, stranicaC: stranicaC, datum: NSDate())
            
//            trokut.stranicaA = stranicaA
//            trokut.stranicaB = stranicaB
//            trokut.stranicaC = stranicaC
//            trokut.datumStvaranja = NSDate()
            trokutArray.append(trokut)
            
            povrsina = trokut.povrsinaTrokuta()
            
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
            
            povrsinaTrokutaVC.povrsina = povrsina
        }
        
    }
    func saveData(){
        
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: trokutArray)
        userDefaults.set(encodedData, forKey: "trokuti")
        userDefaults.synchronize()
    }
    
    func loadData(){
        if let decoded  = userDefaults.object(forKey: "trokuti") as? Data{
            trokutArray = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [Trokut]
        }
        
    }
}

