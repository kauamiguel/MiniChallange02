//
//  PacientModel+CoreDataProperties.swift
//  Mini02
//
//  Created by Kaua Miguel on 26/09/23.
//
//

import Foundation
import CoreData


extension PacientModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PacientModel> {
        return NSFetchRequest<PacientModel>(entityName: "PacientModel")
    }

    @NSManaged public var age: Int64
    @NSManaged public var firstName: String?
    @NSManaged public var height: Float
    @NSManaged public var nickName: String?
    @NSManaged public var secondName: String?
    @NSManaged public var weight: Float
    @NSManaged public var bloodExam: NSSet?
    @NSManaged public var familyBG: FamilyBackGround?
    @NSManaged public var personalBG: PersonalBackGround?
    @NSManaged public var ultrassound: NSSet?

}

// MARK: Generated accessors for bloodExam
extension PacientModel {

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
extension PacientModel {

    @objc(addUltrassoundObject:)
    @NSManaged public func addToUltrassound(_ value: UltraSoundModel)

    @objc(removeUltrassoundObject:)
    @NSManaged public func removeFromUltrassound(_ value: UltraSoundModel)

    @objc(addUltrassound:)
    @NSManaged public func addToUltrassound(_ values: NSSet)

    @objc(removeUltrassound:)
    @NSManaged public func removeFromUltrassound(_ values: NSSet)

}

extension PacientModel : Identifiable {

}
