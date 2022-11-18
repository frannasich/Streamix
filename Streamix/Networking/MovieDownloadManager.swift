//
//  MovieDownloadManager.swift
//  Streamix
//
//  Created by Francisco Tomas Nasich on 17/11/2022.
//

import SwiftUI

final class MovieDownloadManager: ObservableObject {
    @Published var movies = [Movie]()
    @Published var cast = [Cast]()
    
    static var baseURL = "https://api.themoviedb.org/3/movie/"
    
    func getNowPlaying() {
        getMovie(movieUrl: .nowPlaying)
    }
    
    func getUpcoming() {
        getMovie(movieUrl: .upcoming)
    }
    
    func getPopular() {
        getMovie(movieUrl: .popular)
    }
    
    func getCast(for movie: Movie) {
        let urlString = "\(Self.baseURL)\(movie.id ?? 100)/credits?api_key=\(API.key)&language=en-US"
        NetworkManager<CastResponse>.fetch(from: urlString) { result in
            switch result {
            case .success(let response):
                self.cast = response.cast
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func getMovie(movieUrl: MovieURL) {
        NetworkManager<MovieResponse>.fetch(from: movieUrl.urlString) { result in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let err):
                print(err)
            }
        }
    }
}
 
