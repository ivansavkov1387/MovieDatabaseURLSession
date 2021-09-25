//
//  DetailsViewController.swift
//  MovieDatabaseURLSession
//
//  Created by Иван on 9/16/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    let posterImageView = UIImageView()
    let nameLabel = UILabel()
    let ratingLabel = UILabel()
    let descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePosterImageView()
        configureNameLabel()
        configureRatingLabel()
        configureDescriptionLabel()
        
        layout()
    }
    
    private func configurePosterImageView() {
        posterImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        posterImageView.contentMode = .scaleAspectFill
        
        
        
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(posterImageView)
        
    }
    
    private func configureNameLabel() {
        nameLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width - 24, height: 50)
        nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = .white
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.minimumScaleFactor = 0.2
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
    }
    
    private func configureRatingLabel() {
        ratingLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width - 24, height: 50)
        ratingLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 30)
        ratingLabel.textAlignment = .center
        ratingLabel.backgroundColor = .white
        
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(ratingLabel)
        
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width - 24, height: 50)
        descriptionLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        descriptionLabel.textAlignment = .justified
        descriptionLabel.numberOfLines = 0
        descriptionLabel.backgroundColor = .white
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.2
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(descriptionLabel)
        
    }
    
    private func layout() {
        posterImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        posterImageView.widthAnchor.constraint(equalToConstant: 275).isActive = true
        posterImageView.heightAnchor.constraint(equalToConstant: 450).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 12).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: ratingLabel.topAnchor, constant: -12).isActive = true
        
        ratingLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12).isActive = true
        ratingLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12).isActive = true
        ratingLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -12).isActive = true
        
        descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -75).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width - 24).isActive = true
        
    }

}
