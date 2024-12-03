import Foundation

class AdviceService {
    func fetchRandomAdvice(completion: @escaping (Result<Advice, Error>) -> Void) {
        let url = URL(string: "https://api.adviceslip.com/advice")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 1, userInfo: nil)))
                return
            }
            
            do {
                let adviceResponse = try JSONDecoder().decode(AdviceResponse.self, from: data)
                completion(.success(adviceResponse.slip))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
