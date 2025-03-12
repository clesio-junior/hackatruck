//
//  Model.swift
//  teste_ProjetoFinal
// Clesio
//  Created by Turma01-7 on 28/02/25.
//

import Foundation



struct Ponto: Codable, Hashable{
    var rota: String
    var hora: String
    var local: Localizacao
    var tipo: String
}

struct Localizacao: Codable, Hashable{
    var nome: String
    var latitude: Double
    var longitude : Double
    var endereco : String
    var foto : String
}
extension Ponto: Identifiable {
        var id: String { UUID().uuidString }
    }
