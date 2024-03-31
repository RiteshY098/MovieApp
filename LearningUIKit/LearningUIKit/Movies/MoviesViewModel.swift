//
//  MoviesViewModel.swift
//  LearningUIKit
//
//  Created by Ritesh Yadav on 27/03/24.
//

class MoviesViewModel {
    
    let movies = Variable<[Movie]>([])
    
    private let service = MoviesService()
    
    func fetchData() {
        service.getMovies { [weak self] result in
            switch result {
            case .success(let response):
                self?.movies.value = response.results
            case .failure:
                break
            }
        }
    }
}
