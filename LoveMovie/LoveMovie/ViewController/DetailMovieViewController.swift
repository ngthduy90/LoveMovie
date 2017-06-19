//
//  DetailMovieViewController.swift
//  LoveMovie
//
//  Created by Nguyen Thanh Duy on 6/19/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import AFNetworking

class DetailMovieViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var dateIconLabel: IconLabel!
    @IBOutlet weak var ratingIconLabel: IconLabel!
    @IBOutlet weak var movieHeaderImageView: UIImageView!
    
    var movie: MovieData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieTitle.text = movie?.title
        self.overviewLabel.text = movie?.overView
        self.dateIconLabel.textLabel.text = movie?.releaseDate
        self.ratingIconLabel.textLabel.text = "\(String(describing: movie?.vote))"

        if let poster = movie?.posterPath {
            let posterUrl = MovieEndpoints.imageUrl(from: poster, withQuality: .low)
            backgroundImageView.setImageWith(posterUrl!)
        }
        
        if let backdrop = movie?.backdropPath {
            let backdropUrl = MovieEndpoints.imageUrl(from: backdrop, withQuality: .medium)
            self.movieHeaderImageView.setImageWith(backdropUrl!)
        } else {
            self.movieHeaderImageView.isHidden = true
        }
    }
}
