//
//  MovieCell.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/18/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import ChameleonFramework

class MovieCellServices {
    
    static let colors: [[UIColor]] = [
        [HexColor("48C6EF")!, HexColor("6F86D6")!],
        [HexColor("A7A6CB")!, HexColor("8989BA")!]
    ]
    
    static let DefaultMargin: CGFloat = 20.0
    
    static func createListStyleCellMetadata(sizeOf collectionSize: CGSize) -> MovieCellMetadata {
        
        let contentInsets = UIEdgeInsets(top: DefaultMargin,
                                         left: DefaultMargin - 1.0,
                                         bottom: DefaultMargin,
                                         right: DefaultMargin - 1.0)
        
        let contentSize = CGSize(width: collectionSize.width + 2.0 - (DefaultMargin * 2),
                                 height: 182.0)
        
        return MovieCellMetadata(size: contentSize,
                                 insets: contentInsets,
                                 minimumSpacing: 20.0)
    }
    
    static func createFitStyleCellMetadata(sizeOf collectionSize: CGSize) -> MovieCellMetadata {
        
        let cellMetadata = MovieCellMetadata(size: collectionSize, insets: .zero, minimumSpacing: 0.0)
        cellMetadata.isPaging = true
        cellMetadata.style = .fitOne
        
        return cellMetadata
    }
}
