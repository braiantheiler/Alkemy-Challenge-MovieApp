

import Foundation

class MovieDetailService {
    
    func getMovie(urlMovie: String,
                    onComplete: @escaping (MovieDetail) -> Void,
                    onError: @escaping () -> Void) {
        
        ApiManager.shared.get(url: urlMovie, completion: { response in
            
            switch response {
                case .success(let data):
                    do {
                        if let data = data {
                            let decoder = JSONDecoder()
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let movieReponse = try decoder.decode(MovieDetail.self, from: data)
                            onComplete(movieReponse)
                        } else {
                            onError()
                        }
                    } catch {
                        onError()
                        print(error)
                    }
                case .failure(_):
                    onError()
            }
            
        })
        
    }
    
}

