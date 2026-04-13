import Foundation
import Combine

class ThemeViewModel: ObservableObject {
    @Published var themes: [Theme] = []
    @Published var selectedTheme: Theme?
    @Published var isLoading = false
    
    private let firebaseService = FirebaseService()
    
    init() {
        fetchThemes()
    }
    
    func fetchThemes() {
        isLoading = true
        firebaseService.fetchThemes { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let fetchedThemes):
                    self?.themes = fetchedThemes
                    self?.selectedTheme = fetchedThemes.first
                case .failure(let error):
                    print("Error fetching themes: \(error.localizedDescription)")
                }
            }
        }
    }
}
