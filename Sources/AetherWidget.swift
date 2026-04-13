import WidgetKit
import SwiftUI
import AppIntents

struct AetherWidget: Widget {
    let kind: String = "AetherWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            AetherWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .configurationDisplayName("Aether Interactive")
        .description("Interact with 3D Pixel Art on your home screen.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), themeName: "Gothic", interactionCount: 0)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), themeName: "Gothic", interactionCount: 0)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entries = [SimpleEntry(date: Date(), themeName: "Gothic", interactionCount: 0)]
        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let themeName: String
    let interactionCount: Int
}

struct AetherWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        VStack {
            Text(entry.themeName)
                .font(.headline)
            
            // Interactive Button using AppIntent
            Button(intent: ToggleAnimationIntent()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.red.opacity(0.2))
                    
                    Image(systemName: "sparkles")
                        .font(.title)
                        .foregroundColor(.red)
                }
            }
            .buttonStyle(.plain)
            
            Text("Interactions: \(entry.interactionCount)")
                .font(.caption2)
        }
        .padding()
    }
}
