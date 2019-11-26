//
//  Student+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by PuNeet on 22/09/19.
//  Copyright © 2019 Puneet. All rights reserved.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: String?

}
