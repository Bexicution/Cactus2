//
//  SessionsListViewControlletViewController.swift
//  Cactus
//
//  Created by Mac on 8/8/20.
//  Copyright © 2020 Bex. All rights reserved.
//

import UIKit

class SessionsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sessions"
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SessionsStorage.shared.sessions.count
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sessionCell = tableView.dequeueReusableCell(withIdentifier: "session_cell", for: indexPath) as! SessionsListTableViewCell
        let session = SessionsStorage.shared.sessions[indexPath.row]
        sessionCell.configure(with: session)
        return sessionCell 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print ("didSelect")
    }
}	
