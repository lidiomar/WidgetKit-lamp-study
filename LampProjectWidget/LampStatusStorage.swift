//
//  LampStatusStorage.swift
//  LampProjectWidgetExtension
//
//  Created by Lidiomar Machado on 27/11/23.
//

import Foundation

struct LampStatusStorage {
    private static let sharedDefaults: UserDefaults = UserDefaults(suiteName: "group.lampproject")!
    private static let key = "lampStatus"
    
    static func toggleLampStatus() {
        var toggleStatus = sharedDefaults.bool(forKey: key)
        toggleStatus.toggle()
        sharedDefaults.setValue(toggleStatus, forKey: key)
    }
    
    static func setLampStatus(status: Bool) {
        sharedDefaults.setValue(status, forKey: key)
    }
    
    static func currentLampStatus() -> Bool {
        return sharedDefaults.bool(forKey: key)
    }
}
