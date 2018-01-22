//
//  SuperheroViewController.swift
//  flixApp
//
//  Created by Rahul Balla on 1/21/18.
//  Copyright © 2018 Rahul Balla. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var movies: [[String: Any]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(movies[0]["poster_path"]!)
        fetchMovies()
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = layout.minimumInteritemSpacing
        
        let cellPerLine: CGFloat = 2
        let interItemSpacingTotal = layout.minimumInteritemSpacing * (cellPerLine - 1)
        let width = collectionView.frame.size.width / cellPerLine - interItemSpacingTotal / cellPerLine
        
        layout.itemSize = CGSize(width: width, height: width * 3 / 2)
        
//        print("after fetchmovies()")
        
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("total movies in SuperheroViewController are ", movies.count)
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("went into collectionView function")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell
        let movie = movies[indexPath.item]
        if let posterPathString = movie["poster_path"] as? String{
//            print("got into URL")
            let baseURL = "https://image.tmdb.org/t/p/w500"
            let posterURL = URL(string: baseURL + posterPathString)!
            cell.posterImageView.af_setImage(withURL: posterURL)
        }
        return cell
    }
    
    func fetchMovies(){
//        print("It went into fetchmovies() function")
        //        activityIndicator.startAnimating()
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        //        print("url--",url,"--")
//        print("failing after url")
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        //        print("request--",request,"--")
//        print("failing after request")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        //        print("--session",url,"--")
//        print("failing after session")
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error--", error.localizedDescription)
//                self.createAlert(title: "No Network!", message: "Please check if you are connected to the internet")
                self.collectionView.reloadData()
//                self.refreshControl.endRefreshing()
//                self.activityIndicator.stopAnimating()
            }
            else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = movies
                self.collectionView.reloadData()
//                self.refreshControl.endRefreshing()
//                self.activityIndicator.stopAnimating()

                //                print(dataDictionary)
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let movie = movies[indexPath.item]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
        }
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
