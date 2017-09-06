//
//  ViewController.swift
//  Yakssok
//
//  Created by 홍성호 on 2017. 9. 6..
//  Copyright © 2017년 홍성호. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var tableView: UITableView?
    fileprivate var plans: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.setNaviBar()
        self.setTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func setTableView(){
        let tableView = UITableView.init()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView = tableView
    }

    fileprivate func setNaviBar(){
        self.title = "약쏙"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addPlan))
    }
    
    func addPlan(){
        self.plans.append("새로운 복약 일정")
        self.tableView?.reloadData()
    }
    
    
    // MARK: - Table view
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCell")
        cell.textLabel?.text = self.plans[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .normal, title: "삭제") { (action, indexPath) in
            self.plans.remove(at: indexPath.row)
            self.tableView?.reloadData()
        }
        deleteAction.backgroundColor = .red
        
        return [deleteAction]
    }
    
}

