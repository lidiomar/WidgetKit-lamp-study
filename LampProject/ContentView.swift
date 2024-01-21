//
//  ContentView.swift
//  LampProject
//
//  Created by Lidiomar Machado on 25/11/23.
//

import SwiftUI
import WidgetKit

struct ContentView: View {
    @Environment(\.scenePhase) private var phase
    @State private var isOn: Bool = false
    
    var body: some View {
        ZStack {
            Color("LampGray").ignoresSafeArea()
            VStack {
                Image(isOn ? "LampOn": "LampOff")
                HStack {
                    Spacer()
                    Toggle("", isOn: $isOn)
                        .labelsHidden()
                        .onChange(of: isOn) {
                            LampStatusStorage.setLampStatus(status: isOn)
                        }
                    Spacer()
                }
            }.onChange(of: phase) {
                if phase == .background {
                    WidgetCenter.shared.reloadTimelines(ofKind: "LampProjectWidget")
                }
                isOn = LampStatusStorage.currentLampStatus()
                
            }
        }
    }
}

#Preview {
    ContentView()
}
