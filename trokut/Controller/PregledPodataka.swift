//
//  SecondViewController.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import UIKit

class PregledPodataka: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
   
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trokutArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        trokutArray.sort(by: {$0.povrsinaTrokuta() > $1.povrsinaTrokuta() })
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "trokutCell", for: indexPath) as? TrokutCell else { return UITableViewCell() }
        cell.configureCell(trokut: trokutArray[indexPath.row])
        return cell
        
    }
    
    
    @IBAction func brisiBtnWsPressed(_ sender: Any) {
        
        let alert = UIAlertController(title: "BRISANJE", message: "Da li želite obriati sve 📐", preferredStyle: .alert)
        let brisanjeBtn = UIAlertAction(title: "Briši", style: .destructive) { (action) in
            trokutArray.removeAll()
            self.tableView.reloadData()
        }
        
        let cancelBtn = UIAlertAction(title: "Odustani", style: .cancel, handler: nil)
        
        alert.addAction(brisanjeBtn)
        alert.addAction(cancelBtn)
        present(alert, animated: true, completion: nil)
    }
    
}

