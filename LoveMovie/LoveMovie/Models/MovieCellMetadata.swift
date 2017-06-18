//
//  MovieCellMetadata.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/18/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit


enum MovieCellStyle {
    case list, fitOne
}

class MovieCellMetadata {
    
    let insets: UIEdgeInsets
    let minimumSpacing: CGFloat
    let size: CGSize
    
    var isPaging: Bool = false
    var style = MovieCellStyle.list
    
    var reuseId: String {
        get {
            switch style {
            case .fitOne:
                return "FItOneCell"
            default:
                return "ListCell"
            }
        }
    }
    
    var scrollDirection: UICollectionViewScrollDirection {
        get {
            switch style {
            case .fitOne:
                return .horizontal
            default:
                return .vertical
            }
        }
    }
    
    init() {
        self.size = .zero
        self.insets = .zero
        self.minimumSpacing = 0.0
    }
    
    init(size: CGSize, insets: UIEdgeInsets, minimumSpacing: CGFloat) {
        
        self.size = size
        self.insets = insets
        self.minimumSpacing = minimumSpacing
    }
    
}
