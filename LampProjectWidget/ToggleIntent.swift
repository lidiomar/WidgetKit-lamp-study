//
//  ToggleIntent.swift
//  LampProjectWidgetExtension
//
//  Created by Lidiomar Machado on 27/11/23.
//

import Foundation
import AppIntents

struct ToggleIntent: AppIntent {
    static var title: LocalizedStringResource = "ToggleIntent"
    
    func perform() async throws -> some IntentResult {
        LampStatusStorage.toggleLampStatus()
        return .result()
    }
    
    static func getStatus() -> Bool {
        return LampStatusStorage.currentLampStatus()
    }
}
