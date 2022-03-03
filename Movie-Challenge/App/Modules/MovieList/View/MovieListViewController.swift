

import UIKit

protocol MovieListDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}


class MovieListViewController: UIViewController {

    @IBOutlet weak var tablewView: UITableView!
    
    private var service = MovieListService()
    private var viewModel : MovieListViewModel?
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MovieListViewModel(service: self.service, delegate: self)
        self.viewModel?.getMovies()
        setupView()
    }
    
    private func setupView(){
        self.title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.tablewView.register(UINib(nibName: "MovieListTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListTableViewCell")
        self.tablewView.delegate = self
        self.tablewView.dataSource = self
    }
}


extension MovieListViewController: MovieListDelegate {
    func toogleLoading() {
        
    }
    
    func reloadTable() {
        self.tablewView.reloadData()
    }
    
    func showError() {
        
    }
}



extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = self.viewModel?.getMovie(at: indexPath.row)
        let movieIdEntero = movie?.id
        let extraerID = movieIdEntero.self!
        let movieId = "\(String(describing: extraerID))"
        let vcDetail = MovieDetailViewController()
        let urlDetailMovieSelected = Constants().baseUrlDetail + movieId + Constants().api_key
        vcDetail.urlMovie = urlDetailMovieSelected
        self.navigationController?.pushViewController(vcDetail, animated: true)
        
    }
}

extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getMovieCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListTableViewCell", for: indexPath) as! MovieListTableViewCell
        
        cell.movieName.text = self.viewModel?.getMovie(at: indexPath.row).title
//        cell.movieImage.image = self.
        
        return cell

    }
    
    
}


