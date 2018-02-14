//
//  Movie.swift
//  flixApp
//
//  Created by Rahul Balla on 2/14/18.
//  Copyright © 2018 Rahul Balla. All rights reserved.
//

import Foundation

class Movie{
    var title: String
    var posterUrl: URL?
    var backdropURL: URL?
    var overview: String
    var releaseDate: String
    
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No Title"
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as?  String ?? "No Release Date"
        let backdropPathString = dictionary["backdrop_path"] as? String
        let posterPathString = dictionary["poster_path"] as? String
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        
        posterUrl = URL(string: baseURLString + posterPathString!)
        backdropURL = URL(string: baseURLString + backdropPathString!)
    }
    
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
    
}
