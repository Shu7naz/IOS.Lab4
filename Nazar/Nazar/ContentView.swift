import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AdviceViewModel()
    
    var body: some View {
        ZStack { // Використання ZStack для накладання фону
            LinearGradient(
                gradient: Gradient(colors: [Color(.lightGray), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea() // Фон покриває весь екран
            
            VStack(spacing: 20) {
                Text(viewModel.advice)
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.primary)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button(action: {
                    viewModel.getRandomAdvice()
                }) {
                    Text("Get Random Advice")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
