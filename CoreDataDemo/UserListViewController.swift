//
//  UserListViewController.swift
//  CoreDataDemo
//
//  Created by PuNeet on 22/09/19.
//  Copyright © 2019 Puneet. All rights reserved.
//

import UIKit

protocol DataPass {
    func data(object:[String?: String?],index: Int,isEdit:Bool)
    func callMe(name: String?)

}
class UserListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var objTableView: UITableView!
    var studentsData = [Student]()
    var delegate: DataPass?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        studentsData = CoreDataHelper.sharedInstance.getStudentdata()
        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let cell : UserViewCell? = tableView.dequeueReusableCell(withIdentifier: "userIdentifier", for: indexPath)as? UserViewCell
        
//        cell?.lblAddress.text = studentsData[indexPath.row].address
//        cell?.lblName.text = studentsData[indexPath.row].name
//        cell?.lblEmail.text = studentsData[indexPath.row].email
//        cell?.lblMobile.text = studentsData[indexPath.row].mobile
        
        cell?.student = studentsData[indexPath.row]

        return cell!
    }
    

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            studentsData = CoreDataHelper.sharedInstance.deleteStudentData(index: indexPath.row)
            self.objTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = ["name":studentsData[indexPath.row].name,"address":studentsData[indexPath.row].address,"email":studentsData[indexPath.row].email,"mobile":studentsData[indexPath.row].mobile]
        delegate?.data(object: dict as! [String : String],index: indexPath.row, isEdit: true)

     //   delegate?.callMe(name: "Hello")
        
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
