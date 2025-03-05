import Foundation

@MainActor
class HomeVM: ObservableObject {
    @Published var gHUser: GitHubUser?
    @Published var errorMessage = "No error detected"
    let service = HomeService()
    
    init() {}
    
    func getUser() async throws {
        do {
            gHUser = try await service.getUsers()
        }
        catch GHError.invalidUrl {
            errorMessage = "Invalid URL"
        }
        catch GHError.invalidResponse {
            errorMessage = "Invalid Response"
        }
        catch GHError.decodingFailed {
            errorMessage = "Decoding Failed"
        }
        catch {
            errorMessage = "Unknown Error"
        }
    }
}
