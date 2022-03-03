

import Foundation

class MovieDetailViewModel {
    
    private var delegate: MovieDetailDelegate
    private var movieDetailService: MovieDetailService
    private var urlMovie: String
    
    init(urlMovie: String, service: MovieDetailService, delegate: MovieDetailDelegate) {
        self.urlMovie = urlMovie
        self.movieDetailService = service
        self.delegate = delegate
    }
    
    func getMovie() {
        self.delegate.toogleLoading()
        movieDetailService.getMovie(urlMovie: self.urlMovie, onComplete: { movie in
            self.delegate.loadMovieData(movie: movie)
            self.delegate.toogleLoading()
        }, onError: { self.delegate.showError() })
    }
    
}
