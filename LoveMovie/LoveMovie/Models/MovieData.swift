//
//  MovieData.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/19/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieData {
    
    var id: Int = 0
    var vote: Float = 0.0
    var title = ""
    var overView = ""
    
    var releaseDate = ""
    var backdropPath = ""
    var posterPath = ""
    
    private init() {}
    
    init?(movie json: JSON?) {
        
        guard let movieRecord = json else {
            return nil
        }
        
        self.id = movieRecord["id"].int!
        self.vote = movieRecord["vote_average"].float!
        self.title = movieRecord["title"].string!
        self.overView = movieRecord["overview"].string!
        self.posterPath = movieRecord["poster_path"].string!
        self.releaseDate = movieRecord["release_date"].string!
        self.backdropPath = movieRecord["backdrop_path"].string!
    }
    
}
