import Foundation

struct HomeService {
    
    func getUsers() async throws -> GitHubUser {
        let urlString = "https://api.github.com/users/Mayago7"
        
        guard let url = URL(string: urlString) else {
            throw GHError.invalidUrl
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            throw GHError.decodingFailed
        }
    }
}
