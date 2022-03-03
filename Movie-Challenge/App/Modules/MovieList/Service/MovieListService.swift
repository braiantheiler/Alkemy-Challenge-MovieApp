
import Foundation

class MovieListService {
    
    func getMovies(onComplete: @escaping ([Movie]) -> Void, onError: @escaping () -> Void) {
        
        ApiManager.shared.get(url: Constants().movieListURL) { response in
            switch response {
            case .success(let data):
                do {
                    
                    if let data = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let movieResponse = try decoder.decode(MovieResponse.self, from: data)
                        onComplete(movieResponse.results)
                    } else {
                        onError()
                    }
                    
                } catch {
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
        
    }
    
}
