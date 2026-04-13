import Foundation

struct Theme: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let bannerURL: String
    let avatarURL: String
    let category: ThemeCategory
    let pixelArtAssets: [String] // URLs to 3D pixel art assets
}

enum ThemeCategory: String, Codable, CaseIterable {
    case gothic = "Gothic"
    case crusader = "Crade/Crusader Era"
    case dragon = "Dragon Legend"
    case cosmos = "Star/Cosmos"
    case cute = "Cute Core"
}
