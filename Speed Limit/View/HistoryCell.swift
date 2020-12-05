//
//  HistoryCell.swift
//  Speed Limit
//
//  Created by Rifqi Alfaizi on 03/11/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var streetLable: UILabel!
    
    @IBOutlet weak var durationLable: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews(history: History) {
        speedLabel.text = String(history.speed)
        durationLable.text = String(history.duration)
        timeLable.text = history.time
        dateLable.text = history.date
        streetLable.text = history.street
    }

}
