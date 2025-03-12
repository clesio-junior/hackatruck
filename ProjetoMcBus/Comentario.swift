//
//  Comentario.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 11/03/25.
//

import SwiftUI

struct Comentario: Identifiable, Decodable, Encodable{
    var id = UUID()
    var userName: String
    var data: Date
    var texto: String
}
