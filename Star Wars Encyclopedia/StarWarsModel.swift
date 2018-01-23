//
//  StarWarsModel.swift
//  Star Wars Encyclopedia
//
//  Created by Jihun Kang on 1/22/18.
//  Copyright © 2018 Jihun Kang. All rights reserved.
//

import Foundation
class StarWarsModel {
    static func getAllPeople(url: String, completionHandler:@escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        if let text = URL(string: url) {
            let session = URLSession.shared
            let task = session.dataTask(with: text, completionHandler: completionHandler)
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

