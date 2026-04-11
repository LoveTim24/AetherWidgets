import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = ThemeViewModel()
    
    var body: some View {
        ZStack {
            Color(hex: "2C1E16") // Dark Brown Background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Discord-style Header
                HeaderView()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("SELECT THEME")
                            .font(.custom("PressStart2P-Regular", size: 14))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(.horizontal)
                        
                        ThemeGalleryView(viewModel: viewModel)
                        
                        InteractionSection()
                    }
                    .padding(.vertical)
                }
            }
        }
    }
}

struct HeaderView: View {
    var body: some View {
        VStack(spacing: -40) {
            // Top Banner
            Rectangle()
                .fill(Color.black.opacity(0.3))
                .frame(height: 160)
                .overlay(
                    Image("banner_placeholder") // Replace with actual pixel art banner
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
            
            // Avatar with Glowing Red Halo
            ZStack {
                Circle()
                    .stroke(Color.red, lineWidth: 4)
                    .blur(radius: 8) // Glowing effect
                    .frame(width: 100, height: 100)
                
                Circle()
                    .fill(Color(hex: "1A110B"))
                    .frame(width: 90, height: 90)
                    .overlay(
                        Image(systemName: "person.fill") // Replace with 3D Pixel Art Icon
                            .foregroundColor(.white)
                    )
            }
            .offset(x: -100) // Positioned like Discord profile
        }
        .padding(.bottom, 50)
    }
}

struct InteractionSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("WIDGET PREVIEW")
                .font(.custom("PressStart2P-Regular", size: 12))
                .foregroundColor(.white.opacity(0.5))
            
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.black.opacity(0.4))
                .frame(height: 170)
                .overlay(
                    Text("Interactive Widget Area")
                        .foregroundColor(.white.opacity(0.3))
                )
        }
        .padding(.horizontal)
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(.sRGB, red: Double(r) / 255, green: Double(g) / 255, blue: Double(b) / 255, opacity: Double(a) / 255)
    }
}
