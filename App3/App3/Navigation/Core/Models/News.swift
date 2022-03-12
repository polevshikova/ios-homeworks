//
//  News.swift
//  Navigation
//
//  Created by Юлия Полевщикова on 08.03.2022.
//

struct News: Decodable {

    struct Article: Decodable {
        let author, description, image, likes, views: String

        enum CodingKeys: String, CodingKey {
            case author, description, image, likes, views
        }
    }

    let articles: [Article]
}

