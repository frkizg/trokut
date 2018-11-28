//
//  PovrsinaTrokutaVC.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import UIKit

class PovrsinaTrokutaVC: UIViewController {

    var povrsina:Double!
    
    @IBOutlet weak var povrsinaLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         povrsinaLbl.text = "Površina trokuta je \(povrsina!)"
    }
    
    
    @IBAction func zatvoriBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}
