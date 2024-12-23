import Foundation

class APIService {
    static let shared = APIService()

    private init() {}

    func fetchData(from endpoint: String, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        var request = URLRequest(url: url)
        request.addValue("your-rapidapi-key", forHTTPHeaderField: "4a0856c181msh228b94a84caf90dp13e4d1jsn90810cf892ff") // Use your RapidAPI Key
        request.addValue("your-rapidapi-host", forHTTPHeaderField: "task-manager-api3.p.rapidapi.com") // Use the API Host provided by RapidAPI

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No Data", code: 500, userInfo: nil)))
                return
            }
            completion(.success(data))
        }

        task.resume()
    }
}

