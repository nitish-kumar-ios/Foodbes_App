//
//  MyProfileVCViewController.swift
//  Foodbes
//
//  Created by Admin on 30/08/22.
//

import UIKit

class MyProfileVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "UserInfoTableCell", bundle: nil), forCellReuseIdentifier: "UserInfoTableCell")
        tableView.register(UINib(nibName: "MyProfileOtherCell", bundle: nil), forCellReuseIdentifier: "MyProfileOtherCell")
    }

}

extension MyProfileVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0 : let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
            
        default : let cell = tableView.dequeueReusableCell(withIdentifier: "MyProfileOtherCell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30))
        view.backgroundColor = UIColor(named: "bgColor") 
        return view
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
