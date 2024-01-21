//
//  LampProjectWidget.swift
//  LampProjectWidget
//
//  Created by Lidiomar Machado on 25/11/23.
//

import WidgetKit
import SwiftUI
import AppIntents

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), status: ToggleIntent.getStatus())
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), status: ToggleIntent.getStatus())
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry(date: Date(), status: ToggleIntent.getStatus())
        completion(Timeline(entries: [entry], policy: .never))
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let status: Bool
}

struct LampProjectWidgetEntryView: View {
    var entry: Provider.Entry
    var imageAsset: String
    var toggleText: String
    
    init(entry: Provider.Entry) {
        self.entry = entry
        if entry.status {
            imageAsset = "LampOn"
            toggleText = "ON"
        } else {
            imageAsset = "LampOff"
            toggleText = "OFF"
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(imageAsset).resizable()
                .frame(width: 100, height: 100)
            Spacer()
            Toggle("",
                   isOn: entry.status,
                   intent: ToggleIntent())
            .toggleStyle(SymbolToggleStyle())
            .contentTransition(.opacity)
            .minimumScaleFactor(0.5)
        }.background(Color("LampGray"))
    }
}

struct LampProjectWidget: Widget {
    let kind: String = "LampProjectWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            LampProjectWidgetEntryView(entry: entry)
                .containerBackground(Color("LampGray"), for: .widget)
        }
        .configurationDisplayName("Lamp Widget")
        .description("This is a Lamp Widget example.")
        .supportedFamilies([.systemSmall])
    }
}
                                                                       
#Preview(as: .systemSmall) {
    LampProjectWidget()
} timeline: {
    SimpleEntry(date: .now, status: true)
    SimpleEntry(date: .now, status: false)
}

