//
//  SelfCheckViewController.swift
//  Yakssok
//
//  Created by 홍성호 on 2017. 9. 7..
//  Copyright © 2017년 홍성호. All rights reserved.
//

import UIKit

class SelfCheckViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    fileprivate var tableView: UITableView?
    fileprivate var finishButton: UIButton?
    fileprivate var selfCheckModel = SelfCheckModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.setConstraints()
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
        tableView.estimatedRowHeight = 80
        tableView.sectionHeaderHeight = UITableViewAutomaticDimension
        tableView.estimatedSectionHeaderHeight = 25
        
        self.view.addSubview(tableView)
        self.tableView = tableView
    }

    fileprivate func setConstraints(){
        
        let margins = view.layoutMarginsGuide
        
        if let tableView = self.tableView{
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            tableView.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        }
    }
    
    
    func pushSelfCheckResultVC(){
        let selfCheckResultViewController = self.storyboard?.instantiateViewController(withIdentifier: "SelfCheckResultViewController") as! SelfCheckResultViewController
        selfCheckResultViewController.selfCheckModel = self.selfCheckModel
        
        self.navigationController?.pushViewController(selfCheckResultViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    // MARK: - TABLE VIEW
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        var finishButtonCount = 0
        if self.selfCheckModel.checkProgress == 1.0{
            finishButtonCount = 1
        }else{
            finishButtonCount = 0
        }
        return Int(self.selfCheckModel.items.count/4) + finishButtonCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section >= self.selfCheckModel.items.count/4{
            return 1
        }else{
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "selfCheckCell")
        
        if(indexPath.section * 4 + indexPath.row >= self.selfCheckModel.items.count){
            cell.textLabel?.text = "결과 확인하기"
            cell.textLabel?.textColor = UIColor.cobaltBlue()
            cell.textLabel?.textAlignment = .center
        }else{
            cell.textLabel?.text = self.selfCheckModel.items[indexPath.section * 4 + indexPath.row]
            cell.textLabel?.numberOfLines = 0
            
            if(self.selfCheckModel.checks[indexPath.section] == indexPath.row){
                cell.accessoryType = .checkmark
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        self.tableView?.deselectRow(at: indexPath, animated: true)

        if(indexPath.section * 4 + indexPath.row >= self.selfCheckModel.items.count){
            
            self.pushSelfCheckResultVC()
            
        }else{
            self.selfCheckModel.checks[indexPath.section] = indexPath.row
            self.tableView?.reloadData()
            if self.selfCheckModel.checkProgress == 1.0{
                let indexPath = IndexPath(row: 0, section: self.selfCheckModel.items.count/4)
                self.tableView?.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
    }
}
