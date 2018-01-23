//
//  StarWarsModel.swift
//  Star Wars Encyclopedia
//
//  Created by Jihun Kang on 1/22/18.
//  Copyright © 2018 Jihun Kang. All rights reserved.
//

import Foundation
class StarWarsModel {
    static func getAllPeople(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        if let url = URL(string: "https://swapi.co/api/people/") {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: completionHandler)
            task.resume()
        }
    }
    static func getAllFilms(completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        if let url = URL(string: "https://swapi.co/api/films/") {
            let session = URLSession.shared
            let task = session.dataTask(with: url, completionHandler: completionHandler)
            task.resume()
        }
    }
}

