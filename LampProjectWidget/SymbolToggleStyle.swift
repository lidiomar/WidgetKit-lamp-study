//
//  SymbolToggleStyle.swift
//  LampProjectWidgetExtension
//
//  Created by Lidiomar Machado on 27/11/23.
//

import SwiftUI

struct SymbolToggleStyle: ToggleStyle {

  var systemImage: String = "circle.fill"
  var activeColor: Color = .green

  func makeBody(configuration: Configuration) -> some View {
      return HStack {
          configuration.label
          Spacer()

          RoundedRectangle(cornerRadius: 30)
              .fill(configuration.isOn ? activeColor : Color(.systemGray5))
              .overlay {
                  Circle()
                      .fill(.white)
                      .padding(3)
                      .overlay {
                          Image(systemName: systemImage)
                              .foregroundColor(.white)
                      }
                      .offset(x: configuration.isOn ? 10 : -10)

              }
              .frame(width: 50, height: 32)
              .onTapGesture {
                  withAnimation(.spring()) {
                      configuration.isOn.toggle()
                  }
              }
      }
  }
}
