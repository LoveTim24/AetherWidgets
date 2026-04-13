import SwiftUI

struct ThemeGalleryView: View {
    @ObservedObject var viewModel: ThemeViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(viewModel.themes) { theme in
                ThemeCard(theme: theme, isSelected: viewModel.selectedTheme?.id == theme.id)
                    .onTapGesture {
                        viewModel.selectedTheme = theme
                    }
            }
        }
        .padding(.horizontal)
    }
}

struct ThemeCard: View {
    let theme: Theme
    let isSelected: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.black.opacity(0.3))
                    .frame(height: 100)
                
                // Placeholder for 3D Pixel Art Asset
                Image(systemName: "cube.fill")
                    .font(.largeTitle)
                    .foregroundColor(isSelected ? .red : .white.opacity(0.3))
            }
            
            Text(theme.name)
                .font(.custom("PressStart2P-Regular", size: 10))
                .foregroundColor(isSelected ? .red : .white)
            
            Text(theme.category.rawValue)
                .font(.caption2)
                .foregroundColor(.white.opacity(0.5))
        }
        .padding(12)
        .background(Color.white.opacity(0.05))
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(isSelected ? Color.red.opacity(0.5) : Color.clear, lineWidth: 2)
        )
    }
}
