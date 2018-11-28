//
//  SecondViewController.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
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

}

