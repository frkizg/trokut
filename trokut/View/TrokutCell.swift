//
//  TrokutCell.swift
//  trokut
//
//  Created by Zvonimir Grebenar  on 28/11/2018.
//  Copyright © 2018 Zvonimir Grebenar . All rights reserved.
//

import UIKit

class TrokutCell: UITableViewCell {

    
   
    @IBOutlet weak var stranaALbl: UILabel!
    @IBOutlet weak var stranaBLbl: UILabel!
    @IBOutlet weak var stranaCLbl: UILabel!
    @IBOutlet weak var povrsinaLbl: UILabel!
    @IBOutlet weak var vrijemeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(trokut: Trokut){
        
        stranaALbl.text = "Strana A: \(trokut.stranicaA)"
        stranaBLbl.text = "Strana B: \(trokut.stranicaB)"
        stranaCLbl.text = "Strana C: \(trokut.stranicaC)"
        povrsinaLbl.text = "Površina: \(trokut.povrsinaTrokuta())"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "hr_HR")
        vrijemeLbl.text = dateFormatter.string(from: trokut.datumStvaranja as Date)
        
    }
    

}
