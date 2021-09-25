//
//  ViewController.swift
//  MovieDatabaseURLSession
//
//  Created by Иван on 9/9/21.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    private let networkManager = NetworkManager()
    private var moviesArray = [Movie]()
    private var cellPostersURLArray = [String]()
    private var detailsPostersURLArray = [String]()
    private var backgroundsURLArray = [String]()
    
    private var cellPostersArray = [Data]()
    private var detailsPostersArray = [Data]()
    private var backgroundsArray = [Data]()
    
    private var tableView = UITableView()
    private let cellIdentifire = "myCell"
    
    private let baseCellPosterURL = "https://image.tmdb.org/t/p/w45"
    private let baseDetailsPosterURL = "https://image.tmdb.org/t/p/w342"
    private let baseBackgroundsURL = "https://image.tmdb.org/t/p/original"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        fetchMoviesInfo()
        
        configureTableView()
        
    }
    
    func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifire)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    private func fetchMoviesInfo() {
        
        self.networkManager.makeSearchRequest { (movies) in
            self.moviesArray = movies.results
            
            for movie in self.moviesArray {
                
                let imageURL = movie.poster_path ?? ""
                let backgroundImageURL = movie.backdrop_path ?? ""
                
                let cellPosterURL = self.baseCellPosterURL + imageURL
                let detailsPosterURL = self.baseDetailsPosterURL + imageURL
                
                let backgroundURL = self.baseBackgroundsURL + backgroundImageURL
                
                self.cellPostersURLArray.append(cellPosterURL)
                self.detailsPostersURLArray.append(detailsPosterURL)
                self.backgroundsURLArray.append(backgroundURL)
            }
        }
    }
    
    private func fetchPosters(for cell: UITableViewCell, indexPath: Int) {
        networkManager.fetchImageForCell(url: cellPostersURLArray[indexPath]) { (data) in
            DispatchQueue.main.async {
                cell.imageView?.image = UIImage(data: data)
            }
        }
    }
    
    private func showDetails(for indexPath: Int) {
        let detailsVC = DetailsViewController()
        detailsVC.descriptionLabel.text = moviesArray[indexPath].overview
        detailsVC.ratingLabel.text = String("Rating - \(moviesArray[indexPath].vote_average ?? 0)")
        detailsVC.nameLabel.text = moviesArray[indexPath].title
        
        networkManager.fetchImageForCell(url: detailsPostersURLArray[indexPath]) { (data) in
            DispatchQueue.main.async {
                detailsVC.posterImageView.image = UIImage(data: data)
                
            }
        }
        
        networkManager.fetchImageForCell(url: backgroundsURLArray[indexPath]) { (data) in
            DispatchQueue.main.async {
                detailsVC.view.backgroundColor = UIColor(patternImage: UIImage(data: data) ?? .checkmark)
                
            }
        }
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifire, for: indexPath)
        DispatchQueue.main.async {
            cell.textLabel?.text = self.moviesArray[indexPath.row].title
            self.fetchPosters(for: cell, indexPath: indexPath.row)
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showDetails(for: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 12
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.imageView?.clipsToBounds = true
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.layer.cornerRadius = 10
    }
    
    
}
