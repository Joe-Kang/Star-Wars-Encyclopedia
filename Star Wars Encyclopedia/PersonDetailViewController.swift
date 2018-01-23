//
//  PeopleDetailViewController.swift
//  Star Wars Encyclopedia
//
//  Created by Jihun Kang on 1/22/18.
//  Copyright © 2018 Jihun Kang. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    weak var delegate: detailDelegate?
    var person: NSDictionary?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var birthLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBAction func returnButton(_ sender: UIButton) {
        delegate?.cancelButtonPressed(by: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = person!["name"] {
            nameLabel.text = "Name: \(name)"
        }
        if let gender = person!["gender"] {
            genderLabel.text = "Gender: \(gender)"
        }
        if let mass = person!["mass"] {
            massLabel.text = "Mass: \(mass)"
        }
        if let birth = person!["birth_year"] {
            birthLabel.text = "Birth Year: \(birth)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {super.didReceiveMemoryWarning()}
}
