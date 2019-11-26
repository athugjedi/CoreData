//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by PuNeet on 22/09/19.
//  Copyright © 2019 Puneet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,DataPass {
    func data(object: [String? : String?], index: Int, isEdit: Bool) {
        txtName.text = object["name"] as? String
        txtAddress.text = object["address"] as? String
        txtEmail.text = object["email"] as? String
        txtmobile.text = object["mobile"] as? String
        i = index
        isUpdate = isEdit

    }
    
    func callMe(name: String?) {
         print("Value is \(name)")
    }


    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtmobile: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    var i = Int()
    var isUpdate = Bool()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func saveTapped(_ sender: Any) {
        let dict = ["name":txtName.text,"mobile":txtmobile.text,"email":txtEmail.text,"address":txtAddress.text,]

        if isUpdate{
            CoreDataHelper.sharedInstance.updateData(object: dict as! [String : String],index: i)
        }else{
            CoreDataHelper.sharedInstance.saveData(object: dict as! [String : String])
        }
        
        
    }
    
    @IBAction func showListTapped(_ sender: Any) {
        let listVC = self.storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
        listVC.delegate = self
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
   
}

