//
//  MovieCollectionViewCell.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/19/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentBackgroundView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateIconLabel: IconLabel!
    @IBOutlet weak var ratingIconLabel: IconLabel!
    
    func renderCell(at indexPath: IndexPath) {
        self.layoutIfNeeded()
        
        contentBackgroundView.backgroundColor = UIColor.clear
        contentBackgroundView.layer.cornerRadius = 20.0
        contentBackgroundView.clipsToBounds = true
        contentBackgroundView.applyGradient(colours: colorAtIndexPath(indexPath), direction: .horizontal)
        
        imageView.layer.cornerRadius = 20.0
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.clipsToBounds = true
    }
    
    func displayData(_ movie: MovieData) {
        titleLabel.text = movie.title
        dateIconLabel.text = movie.releaseDate
        ratingIconLabel.text = "\(movie.vote)"
    }
    
    private func colorAtIndexPath(_ indexPath: IndexPath) -> [UIColor] {
        return (indexPath.row % 2 == 0) ? MovieCellServices.colors[0] : MovieCellServices.colors[1]
    }
    
}
