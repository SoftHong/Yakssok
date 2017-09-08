//
//  SelfCheckResultViewController.swift
//  Yakssok
//
//  Created by 홍성호 on 2017. 9. 8..
//  Copyright © 2017년 홍성호. All rights reserved.
//

import UIKit

class SelfCheckResultViewController: UIViewController {

    public var selfCheckModel: SelfCheckModel?
    fileprivate var scoreLabel: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setScoreLabel()
        self.setConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setScoreLabel(){
        if let checkModel = self.selfCheckModel{
            let scoreLabel = UILabel()
            scoreLabel.text = "\(checkModel.resultScore)점으로\n\(checkModel.resultDesc)"
            scoreLabel.textColor = UIColor.cobaltBlue()
            scoreLabel.numberOfLines = 0
            scoreLabel.textAlignment = .center
            scoreLabel.sizeToFit()
            view.addSubview(scoreLabel)
            self.scoreLabel = scoreLabel
        }
    }
    
    fileprivate func setConstraints(){
        
        if let scoreLabel = self.scoreLabel{
            let margins = view.layoutMarginsGuide
            scoreLabel.translatesAutoresizingMaskIntoConstraints = false
            scoreLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
            scoreLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
            scoreLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
            scoreLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
