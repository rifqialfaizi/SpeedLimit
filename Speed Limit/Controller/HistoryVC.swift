//
//  HistoryVC.swift
//  Speed Limit
//
//  Created by Rifqi Alfaizi on 03/11/20.
//  Copyright © 2020 Rifqi Alfaizi. All rights reserved.
//

import UIKit

class HistoryVC: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var historyTable: UITableView!
    var history = [History]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.history = DataService.shared.getHistory()
        historyTable.dataSource = self
        historyTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "History Cell") as? HistoryCell {
           // let history = DataService.history.getHistory()[indexPath.row]
            let history = self.history[indexPath.row]
            cell.updateViews(history: history)
            return cell
        } else {
            return HistoryCell()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

}
