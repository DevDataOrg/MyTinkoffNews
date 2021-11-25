//
//  Model.swift
//  MyTinkoffNews
//
//  Created by Artyom Romanchuk on 25.11.2021.
//

import Foundation

//Hashable,Identifiable
struct Post:  Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}

