//
//  MovieServices.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/19/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieServices {
    
    static func parseMovieResult(_ results: JSON) -> [MovieData] {
        
        return results.arrayValue.map {
            MovieData(movie: $0)!
        }
    }
}
