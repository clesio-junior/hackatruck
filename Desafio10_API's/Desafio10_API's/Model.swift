//
//  Model.swift
//  Desafio10_API's
//
//  Created by Turma01-7 on 17/02/25.
//

import Foundation

struct Moeda: Decodable, Identifiable{
    var id: String
    var rank: String
    var symbol: String
    var name: String
}



struct Simpsons: Codable, Hashable{
    var quote: String
    var character: String
    var image : String
    var characterDirection : String
}

//struct API: Decodable{
//    var data: [Simpsons]
//}
