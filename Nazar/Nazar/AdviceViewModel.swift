import Foundation

class AdviceViewModel: ObservableObject {
    @Published var advice: String = "Press the button to get advice!"
    private let adviceService = AdviceService()
    
    func getRandomAdvice() {
        adviceService.fetchRandomAdvice { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let advice):
                    self?.advice = advice.advice
                case .failure(let error):
                    self?.advice = "Failed to load advice: \(error.localizedDescription)"
                }
            }
        }
    }
}
