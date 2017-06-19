//
//  MovieEndpoints.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/19/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation

enum ImageQuality: String {
    case low = "/w45"
    case medium = "/w342"
    case high = "/original"
}

class MovieEndpoints {
    
    static let movieBaseUrl = "https://api.themoviedb.org/3/movie"
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    
    static let imageBaseUrl = "https://image.tmdb.org/t/p"
    
    static var nowPlaying: String {
        get {
            return "\(movieBaseUrl)/now_playing?api_key=\(apiKey)"
        }
    }
    
    static var topRated: String {
        get {
            return "\(movieBaseUrl)/top_rated?api_key=\(apiKey)"
        }
    }
    
    static func imageUrl(from imgId: String, withQuality imgQuality: ImageQuality) -> URL? {
        return URL(string: "\(imageBaseUrl)\(imgQuality.rawValue)\(imgId)")
    }
    
}
