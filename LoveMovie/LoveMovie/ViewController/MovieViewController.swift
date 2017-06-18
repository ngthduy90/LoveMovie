//
//  MovieViewController.swift
//  LoveMovie
//
//  Created by Duy Nguyen on 6/18/17.
//  Copyright © 2017 Duy Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import AFNetworking


class MovieViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var refreshControl: UIRefreshControl?
    
    fileprivate var isCollectionStyled = false
    fileprivate var movies: [MovieData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(fetchMovies), for: UIControlEvents.valueChanged)
        
        collectionView.insertSubview(refreshControl!, at: 0)
        fetchMovies()
    }
    
    fileprivate var metadatas = [MovieCellStyle:MovieCellMetadata]()
    
    override func viewDidAppear(_ animated: Bool) {
        generateMetadatas()
        cellMetadata = metadatas[.list]!
        isCollectionStyled = true
        
    }
    
    fileprivate var cellMetadata: MovieCellMetadata! {
        didSet {
            collectionView.isPagingEnabled = cellMetadata.isPaging
            
            if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.scrollDirection = cellMetadata.scrollDirection
            }
            
            collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var switchCellStyleButton: UIButton!
    
    @IBAction func switchCellStyle(_ sender: Any) {
        
        if cellMetadata.style == .list {
            cellMetadata = metadatas[.fitOne]
            switchCellStyleButton.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2.0)
        } else {
            cellMetadata = metadatas[.list]
            switchCellStyleButton.imageView?.transform = CGAffineTransform.identity
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MovieViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        let cell = collectionView.cellForItem(at: indexPath)
        
    }
}

extension MovieViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard isCollectionStyled else {
            return Int.allZeros
        }
        
        return self.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellMetadata.reuseId, for: indexPath)
        let movie = self.movies[indexPath.row]
        let posterUrl = MovieEndpoints.imageUrl(from: movie.posterPath, withQuality: .medium)
        
        let movieCell = cell as! MovieCollectionViewCell
        movieCell.renderCell(at: indexPath)
        movieCell.displayData(movie)
        
        if let imgUrl = posterUrl {
            movieCell.imageView.setImageWith(imgUrl)

        }
        return cell
    }
}

extension MovieViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                
        return cellMetadata.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return cellMetadata.insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return cellMetadata.minimumSpacing
    }
}

extension MovieViewController {
    
    fileprivate func setupCollectionView() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        
        cellMetadata = MovieCellMetadata()
    }
    
    fileprivate func generateMetadatas() {
        
        metadatas.updateValue(MovieCellServices.createListStyleCellMetadata(sizeOf: collectionView.bounds.size),
                              forKey: MovieCellStyle.list)
        metadatas.updateValue(MovieCellServices.createFitStyleCellMetadata(sizeOf: collectionView.bounds.size),
                              forKey: MovieCellStyle.fitOne)
    }
    
    func fetchMovies() {
        
        Alamofire.request(MovieEndpoints.nowPlaying, method: .get).validate().responseJSON { response in
            
            switch response.result {
                
            case .success(let value):
                let results = JSON(value)["results"]
                self.movies = MovieServices.parseMovieResult(results)
                
            case .failure(let error):
                print(error)
            }
            
            self.refreshControl?.endRefreshing()
        }
    }
}
