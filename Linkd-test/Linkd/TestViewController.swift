//
//  TestViewController.swift
//  Linkd
//
//  Created by Macbook Pro 15 on 11/30/22.
//

import UIKit

var indexNum: Int = 0

class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        indexNum = row
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        indexNum = row
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        let event = timers[row].event
        let location = timers[row].location
        let remainingTime = timers[row].remainingTime
        let text = "\(event) \t \(location) \t \(remainingTime)"
        cell.textLabel?.text = text

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

    @IBOutlet weak var tableView: UITableView!
    
}



