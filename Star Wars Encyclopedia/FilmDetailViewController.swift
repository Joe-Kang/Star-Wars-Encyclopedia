//
//  FilmDetailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Jihun Kang on 1/22/18.
//  Copyright © 2018 Jihun Kang. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

    weak var delegate: detailDelegate?
    var film: NSDictionary?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var openingCrawlLabel: UILabel!
    @IBAction func returnButton(_ sender: UIButton) {
        delegate?.cancelButtonPressed(by: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let title = film!["title"] {
            titleLabel.text = "Title: \(title)"
        }
        if let releaseDate = film!["release_date"] {
            releaseDateLabel.text = "Release Date: \(releaseDate)"
        }
        if let director = film!["director"] {
            directorLabel.text = "Director: \(director)"
        }
        if let openingCrawl = film!["opening_crawl"] {
            openingCrawlLabel.text = "Opening Crawl: \(openingCrawl)"
        }
    }

    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
}
