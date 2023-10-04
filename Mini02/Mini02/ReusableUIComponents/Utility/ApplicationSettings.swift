//
//  ApplicationSettings.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation
import UIKit

fileprivate let onboardingStorageKey = "seen.onboard.setting"
fileprivate let imgKey = "someimgkey.temp"
fileprivate let firstAppointmentKey = "temp.appointments.hasEnteredFirstAppointmentData"

final class ApplicationSettings {
    private static let userDefaultsStorage = UserDefaults(suiteName: "temp.testing.mini.2")!
    
    static func shoudDisplayOnboarding() -> Bool {
        return !userDefaultsStorage.bool(forKey: onboardingStorageKey)
    }
    
    static func hideOnboardingOnStart() {
        userDefaultsStorage.set(true, forKey: onboardingStorageKey)
    }
    
    static func saveImage(img: UIImage) {
        userDefaultsStorage.set(img.pngData(), forKey: imgKey)
    }
    
    static func loadImageData() -> Data? {
        return userDefaultsStorage.data(forKey: imgKey)
    }
    
    static func shouldEnterFirstAppointment() -> Bool {
        return !userDefaultsStorage.bool(forKey: firstAppointmentKey)
    }
    
    static func hasEnteredFirstAppointment() {
        userDefaultsStorage.set(true, forKey: firstAppointmentKey)
    }
}
