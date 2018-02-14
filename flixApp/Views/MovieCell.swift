//
//  MovieCell.swift
//  flixApp
//
//  Created by Rahul Balla on 1/10/18.
//  Copyright © 2018 Rahul Balla. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    var movie: Movie!{
        didSet{
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
            let posterURL = movie.posterUrl
            
            posterImageView.af_setImage(withURL: posterURL!)
        }
    }
    
    let baseURL = "https://image.tmdb.org/t/p/w500"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
