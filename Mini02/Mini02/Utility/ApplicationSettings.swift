//
//  ApplicationSettings.swift
//  Mini02
//
//  Created by Fabio Freitas on 19/09/23.
//

import Foundation

fileprivate let onboardingStorageKey = "seen.onboard.setting"

final class ApplicationSettings {
    private static let userDefaultsStorage = UserDefaults(suiteName: "temp.testing.mini.2")!
    
    static func shoudDisplayOnboarding() -> Bool {
        return !userDefaultsStorage.bool(forKey: onboardingStorageKey)
    }
    
    static func hideOnboardingOnStart() {
        userDefaultsStorage.set(true, forKey: onboardingStorageKey)
    }
}
