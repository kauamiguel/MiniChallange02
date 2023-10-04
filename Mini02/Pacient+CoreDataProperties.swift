//
//  Pacient+CoreDataProperties.swift
//  Mini02
//
//  Created by Kaua Miguel on 04/10/23.
//
//

import Foundation
import CoreData


extension Pacient {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pacient> {
        return NSFetchRequest<Pacient>(entityName: "Pacient")
    }

    @NSManaged public var dateOfBirth: Date?
    @NSManaged public var firstName: String?
    @NSManaged public var height: Float
    @NSManaged public var nickName: String?
    @NSManaged public var secondName: String?
    @NSManaged public var weight: Float
    @NSManaged public var emergencyContact: EmergencyContact?
    @NSManaged public var familyBG: FamilyBackGround?
    @NSManaged public var personalBG: PersonalBackGround?
    @NSManaged public var vaccines: VaccinesEntity?
    @NSManaged public var consults: NSSet?

}

// MARK: Generated accessors for consults
extension Pacient {

    @objc(addConsultsObject:)
    @NSManaged public func addToConsults(_ value: ConsultEntity)

    @objc(removeConsultsObject:)
    @NSManaged public func removeFromConsults(_ value: ConsultEntity)

    @objc(addConsults:)
    @NSManaged public func addToConsults(_ values: NSSet)

    @objc(removeConsults:)
    @NSManaged public func removeFromConsults(_ values: NSSet)

}

extension Pacient : Identifiable {

}
