
import UIKit

protocol MovieDetailDelegate {
    func toogleLoading()
    func loadMovieData(movie: MovieDetail)
    func showError()
}


class MovieDetailViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieReleaseData: UILabel!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieOriginalLanguage: UILabel!
    
    private let service = MovieDetailService()
    var urlMovie: String?
    
    private var viewModel: MovieDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = urlMovie {
            self.viewModel = MovieDetailViewModel(urlMovie: url, service: self.service, delegate: self)
            self.viewModel?.getMovie()
        }
        
    }
    private func setupView (){
        self.title = "Detalles de la Película"
        navigationItem.largeTitleDisplayMode = .never
    }
}

extension MovieDetailViewController: MovieDetailDelegate {
    
    func toogleLoading() {
        let today = Date()
        let formatter1 = DateFormatter()
        formatter1.dateFormat = "HH:mm E, d MMM y"
        print(formatter1.string(from: today))
        print("cargando")
    }
    
    func loadMovieData(movie: MovieDetail) {
        self.movieName.text = movie.title
        self.movieReleaseData.text = movie.releaseDate
        self.movieOriginalLanguage.text = movie.originalLanguage
        self.moviePopularity.text = "\(String(describing:movie.popularity!))"
        self.movieOverview.text = movie.overview
        if let url = movie.backdropPath, let fullUrl = URL(string: Constants().movieImageUrlBase + url){
            self.movieImage.load(url: fullUrl)
        }
        
    }
    
    func showError() {
        print("ha ocurrido un error")
    }
}

