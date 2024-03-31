//
//  ViewController.swift
//  LearningUIKit
//
//  Created by Ritesh Yadav on 27/03/24.
//  uiview controller and uiview both are different
/// simply take care of view
/// controller own a view and take care of life cycle
/// info have configurations 


import UIKit

class MoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MoviesViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        viewModel.movies.onUpdate = { [weak self] movies in
            self?.tableView.reloadData()
        }
        
        viewModel.fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            if let selectedRowIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedRowIndexPath, animated: true)
            }
        }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)  as! MovieCell //ctrl + M to format
        let movie = viewModel.movies.value[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.overviewLable.text = movie.overview
        
        return cell
    }
    
}

extension MoviesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies.value[indexPath.row]
                let movieDetailsViewController = MovieDetailsViewController(with: movie)
                
                self.navigationController?.pushViewController(
                    movieDetailsViewController,
                    animated: true
                )
    }
}
