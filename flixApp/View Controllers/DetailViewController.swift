//
//  DetailViewController.swift
//  flixApp
//
//  Created by Rahul Balla on 1/17/18.
//  Copyright © 2018 Rahul Balla. All rights reserved.
//

import UIKit

enum MovieKeys{
    static let title = "title"
    static let backdropPath = "backdrop_path"
    static let posterPath = "poster_path"
    static let releaseDate = "release_date"
    static let overview = "overview"
}

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var backDropImageView: UIImageView!
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: [String: Any ]?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movie = movie {
            titleLabel.text = movie[MovieKeys.title] as? String
            releaseDateLabel.text = movie[MovieKeys.releaseDate] as? String
            overviewLabel.text = movie[MovieKeys.overview] as? String
            
            let backdropPathString = movie[MovieKeys.backdropPath] as! String
            let posterPathString = movie[MovieKeys.posterPath] as! String
            let baseURL = "https://image.tmdb.org/t/p/w500"
            
            let backdropImageURL = URL(string: baseURL + backdropPathString)!
            let posterImageURL = URL(string: baseURL + posterPathString)!
            
            backDropImageView.af_setImage(withURL: backdropImageURL)
            posterImageView.af_setImage(withURL: posterImageURL)
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
