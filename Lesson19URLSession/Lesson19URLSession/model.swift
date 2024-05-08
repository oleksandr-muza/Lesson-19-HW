//
//  model.swift
//  Lesson19URLSession
//
//  Created by Oleksandr Muza on 08.05.2024.
//

import Foundation

// MARK: ListResource
struct ListResource: Decodable {
    let page: Int
    let total: Int
    let data: [KeyData]
    let support: Support
    
    enum CodingKeys: CodingKey {
        case page
        case total
        case data
        case support
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.total = try container.decode(Int.self, forKey: .total)
        self.data = try container.decode([KeyData].self, forKey: .data)
        self.support = try container.decode(Support.self, forKey: .support)
    }

}

// MARK: - KeyData
struct KeyData: Decodable {
    let id: Int
    let name: String
    let year: Int
    let color: String

    enum CodingKeys: CodingKey {
        case id
        case name
        case year
        case color
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.year = try container.decode(Int.self, forKey: .year)
        self.color = try container.decode(String.self, forKey: .color)
    }

}

// MARK: - Support
struct Support: Decodable {
    let url: String
    let text: String
    
    enum CodingKeys: CodingKey {
        case url
        case text
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.text = try container.decode(String.self, forKey: .text)
    }
}





/*
 
 "page": 1,
     "per_page": 6,
     "total": 12,
     "total_pages": 2,
     "data": [
         {
             "id": 1,
             "name": "cerulean",
             "year": 2000,
             "color": "#98B2D1",
             "pantone_value": "15-4020"
         },
         {
             "id": 2,
             "name": "fuchsia rose",
             "year": 2001,
             "color": "#C74375",
             "pantone_value": "17-2031"
         },
         {
             "id": 3,
             "name": "true red",
             "year": 2002,
             "color": "#BF1932",
             "pantone_value": "19-1664"
         },
         {
             "id": 4,
             "name": "aqua sky",
             "year": 2003,
             "color": "#7BC4C4",
             "pantone_value": "14-4811"
         },
         {
             "id": 5,
             "name": "tigerlily",
             "year": 2004,
             "color": "#E2583E",
             "pantone_value": "17-1456"
         },
         {
             "id": 6,
             "name": "blue turquoise",
             "year": 2005,
             "color": "#53B0AE",
             "pantone_value": "15-5217"
         }
     ],
     "support": {
         "url": "https://reqres.in/#support-heading",
         "text": "To keep ReqRes free, contributions towards server costs are appreciated!"
     }
 
 */
