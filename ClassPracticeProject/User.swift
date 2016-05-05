//
//  User.swift
//  ImagePicker
//
//  Created by zaktech on 5/3/16.
//  Copyright © 2016 zaktech. All rights reserved.
//

import Foundation

class User {
    
    let name: String
    let company: String
    let login: String
    let password: String
    
    init(name: String, company: String, login: String, password: String) {
       self.name = name
        self.company = company
        self.login = login
        self.password = password
    }
    
    
    static func login (login: String, password: String) -> User? {
        if let user = database[login] {
            if user.password == password {
                return user
            }
        }
        return nil
    }
    
    static let database : [String: User]  = {
     
        var theDatabase = [String: User]()
        
        let usersArray = [
            User(name: "Hanny Tufail", company: "CitrusBits", login: "hanny", password: "123"),
            User(name: "Awais Toor", company: "MATSOL", login: "awais", password: "123"),
            User(name: "Shams Tufail", company: "Mehr Associates", login: "shams", password: "123"),
            User(name: "Hussain Tufail", company: "Jatola Tech", login: "hussain", password: "123"),
            User(name: "Shoaib Ali", company: "Datumsquare IT Services", login: "shoaib", password: "123")
        ]
        
        for user in usersArray {
            theDatabase[user.login] = user
        }
        return theDatabase
        
    }()
}