//
//  CoreDataHelper.swift
//  CoreDataDemo
//
//  Created by PuNeet on 22/09/19.
//  Copyright © 2019 Puneet. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class CoreDataHelper {
    
    static var sharedInstance = CoreDataHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    
    func saveData(object: [String:String]){
        
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!) as! Student
        
        student.address = object["address"]
        student.name = object["name"]
        student.email = object["email"]
        student.mobile = object["mobile"]
        
        do {
            try context?.save()
        } catch  {
            print("Data is not saved")
        }
        
    }
    
    func getStudentdata() ->[Student]{
        var student = [Student]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
 
        do {
            student = try context?.fetch(fetchRequest) as! [Student]
        } catch  {
            print("Cant get data")
        }
        return student
    }
    
    func deleteStudentData(index: Int) ->[Student]{
        var student = getStudentdata()
        context?.delete(student[index])
        student.remove(at: index)
        
        do{
            try context?.save()
        }catch{
            print("Data not deleted")
        }
        
        return student
    }
    func updateData(object:[String?:String?],index: Int){
        print(index)
        let student = getStudentdata()
        student[index].name = object["name"] as? String
        student[index].address = object["address"] as? String
        student[index].email = object["email"] as? String
        student[index].mobile = object["mobile"] as? String
        
        do{
            try context?.save()
        }catch{
            print("Failed to update")
        }
        
    }
}
