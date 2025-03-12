//
//  arrayComentarios.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 11/03/25.
//

import SwiftUI

//@Published var arrayComentarios: [Comentario] = []
//
//    func buscarComentarios() {
//
//        let urlComentarios = "http://192.168.128.16:1880/getComentarios"
//
//        let taskComentarios = URLSession.shared.dataTask(with: URL(string: urlComentarios)!){data, response, error in
//
//            do{
//                self.arrayComentarios = try JSONDecoder().decode([Comentario].self, from: data!)
//                self.arrayComentarios.sort(by: { $0.data > $1.data })
//
//            }
//            catch{
//                print(error)
//            }
//        }
//            taskComentarios.resume()
//    }
//
//
//
//func enviarComentario(comentario: Comentario) {
//    guard let url = URL(string: "http://192.168.128.16:1880/postComentarios") else { return }; else {
//        print("URL inválida")
//        return
//    }
//
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//    do {
//        let jsonData = try JSONEncoder().encode(comentario)
//        request.httpBody = jsonData
//
//        URLSession.shared.dataTask(with: request) { _, response, error in
//            if let error = error {
//                print("Erro ao enviar comentário: \(error.localizedDescription)")
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
//                print("Comentário enviado com sucesso!")
//            }
//        }.resume()
//
//    } catch {
//        print("Erro ao enviar o comentário: \(error)")
//    }
//}
