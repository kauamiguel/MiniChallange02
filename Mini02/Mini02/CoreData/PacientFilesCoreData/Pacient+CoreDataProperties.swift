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
    @NSManaged public var bloodExam: NSSet?
    @NSManaged public var emergencyContact: EmergencyContact?
    @NSManaged public var familyBG: FamilyBackGround?
    @NSManaged public var personalBG: PersonalBackGround?
    @NSManaged public var ultrassound: NSSet?
    @NSManaged public var vaccines: VaccinesEntity?

}

// MARK: Generated accessors for bloodExam
extension Pacient {

    @objc(addBloodExamObject:)
    @NSManaged public func addToBloodExam(_ value: BloodExam)

    @objc(removeBloodExamObject:)
    @NSManaged public func removeFromBloodExam(_ value: BloodExam)

    @objc(addBloodExam:)
    @NSManaged public func addToBloodExam(_ values: NSSet)

    @objc(removeBloodExam:)
    @NSManaged public func removeFromBloodExam(_ values: NSSet)

}

// MARK: Generated accessors for ultrassound
extension Pacient {

    @objc(addUltrassoundObject:)
    @NSManaged public func addToUltrassound(_ value: UltraSoundModel)

    @objc(removeUltrassoundObject:)
    @NSManaged public func removeFromUltrassound(_ value: UltraSoundModel)

    @objc(addUltrassound:)
    @NSManaged public func addToUltrassound(_ values: NSSet)

    @objc(removeUltrassound:)
    @NSManaged public func removeFromUltrassound(_ values: NSSet)

}

extension Pacient : Identifiable {

}
