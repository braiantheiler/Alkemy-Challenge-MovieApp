

import Foundation

class MovieListViewModel {
    
    private var movieListService: MovieListService
    private var movies = [Movie]()
    private var delegate: MovieListDelegate

    
    init(service: MovieListService, delegate: MovieListDelegate){
        self.movieListService = service
        self.delegate = delegate
    }
    
    func getMovies(){
        movieListService.getMovies { movies in
            self.movies = movies
            self.delegate.reloadTable()
        } onError: {
            self.delegate.showError()
        }
    }
    
    func getMovie(at index: Int) -> Movie {
        return movies[index]
    }
    
    func getMovieCount() -> Int {
        return movies.count
    }
    
    
}
