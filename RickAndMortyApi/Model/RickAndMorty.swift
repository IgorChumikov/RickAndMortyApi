//
//  Character.swift
//  RickAndMortyApi
//
//  Created by Игорь Чумиков on 26.09.2021.
//

import Foundation

struct Character: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}
