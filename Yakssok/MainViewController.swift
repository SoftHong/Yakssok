//
//  ViewController.swift
//  Yakssok
//
//  Created by 홍성호 on 2017. 9. 6..
//  Copyright © 2017년 홍성호. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    fileprivate var tableView: UITableView?
    fileprivate var menuTitles: [String] = ["활동 리스트", "일기장", "복약 기록", "자가 체크 리스트"]
    
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        self.view.addSubview(tableView)
        self.tableView = tableView
        self.setTableViewAutoLayout()
    }
    
    fileprivate func setTableViewAutoLayout(){
        
        if let tableView = self.tableView{
            let margins = view.layoutMarginsGuide
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            tableView.heightAnchor.constraint(equalTo: margins.heightAnchor).isActive = true
            tableView.widthAnchor.constraint(equalTo: margins.widthAnchor).isActive = true
        }
    }

    fileprivate func setNaviBar(){
        self.title = "BLUE MON"
    }

    
    // MARK: - Table view
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuTitles.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "reuseCell")
        cell.textLabel?.text = self.menuTitles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView?.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            self.pushActionListVC()
        }else if indexPath.row == 3 {
            self.pushSelfCheckVC()
        }
    }
    
    func pushActionListVC(){
        let actionListViewController = self.storyboard?.instantiateViewController(withIdentifier: "ActionListViewController") as! ActionListViewController
        self.navigationController?.pushViewController(actionListViewController, animated: true)
    }
    
    func pushSelfCheckVC(){
        let selfCheckViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelfCheckViewController") as! SelfCheckViewController
        self.navigationController?.pushViewController(selfCheckViewController, animated: true)
    }

}

