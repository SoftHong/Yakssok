//
//  ActionListViewController.swift
//  Yakssok
//
//  Created by 홍성호 on 2017. 9. 7..
//  Copyright © 2017년 홍성호. All rights reserved.
//

import UIKit

class ActionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    fileprivate var tableView: UITableView?
    fileprivate var actionItems: [String] = ["이렇게 저렇게 해보세요", "요렇게 저렇게 해보세요", "요렇게 저렇게 해보세요"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNaviBar()
        self.setTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setNaviBar(){
        self.title = "활동 리스트"
    }
    
    func setTableView(){
        let tableView = UITableView.init()
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        self.tableView = tableView
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.actionItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "actionListCell")
        cell.textLabel?.text = self.actionItems[indexPath.row]
        return cell
    }

}
