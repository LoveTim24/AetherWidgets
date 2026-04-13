import AppIntents
import WidgetKit

struct ToggleAnimationIntent: AppIntent {
    static var title: LocalizedStringResource = "Toggle Animation"
    static var description = IntentDescription("Triggers a 3D pixel art animation on the widget.")

    func perform() async throws -> some IntentResult {
        // Logic to update state (e.g., in UserDefaults or App Group)
        // This would trigger a timeline refresh
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}
