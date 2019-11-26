//
//  UserViewCell.swift
//  CoreDataDemo
//
//  Created by PuNeet on 22/09/19.
//  Copyright © 2019 Puneet. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    var student: Student?{
        didSet{
            lblName.text =  student?.name
            lblEmail.text =  student?.email
            lblMobile.text =  student?.mobile
            lblAddress.text =  student?.address
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
