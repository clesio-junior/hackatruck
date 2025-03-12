//
//  ComentariosViewModel.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 11/03/25.
//

//import SwiftUI

import Foundation
import SwiftUI

class ComentariosViewModel: ObservableObject {
    @Published var comentarios: [Comentario] = []
    @Published var novoComentario: String = ""
    @Published var statusMensagem: String = ""
    
    @Published var user : String  = ""

    private let nodeRedURL = "http://192.168.128.16:1880"

    // Função para adicionar um novo comentário
    func adicionarComentario(usuario: String) {
        let comentario = Comentario(id: UUID(), userName: usuario, data: Date(), texto: novoComentario)
        comentarios.append(comentario)
        novoComentario = ""

        // Enviar o comentário para o Node-RED
        enviarComentario(comentario: comentario)
    }

    // Função para enviar o comentário para o Node-RED
    func enviarComentario(comentario: Comentario) {
        guard let url = URL(string: "\(nodeRedURL)/postComentarios") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        do {
            let jsonData = try JSONEncoder().encode(comentario)
            request.httpBody = jsonData
        } catch {
            statusMensagem = "Erro ao codificar comentário: \(error.localizedDescription)"
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.statusMensagem = "Erro ao enviar comentário: \(error.localizedDescription)"
                }
                return
            }
            DispatchQueue.main.async {
             self.fetchComentarios()
                self.statusMensagem = "Comentário enviado com sucesso!"
            }
        }
        task.resume()
    }

    // Função para buscar comentários do Node-RED
    func fetchComentarios() {
        guard let url = URL(string: "\(nodeRedURL)/getComentarios") else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.statusMensagem = "Erro ao buscar comentários: \(error.localizedDescription)"
                }
                return
            }

            if let data = data {
                do {
                    let comentarios = try JSONDecoder().decode([Comentario].self, from: data)
                    DispatchQueue.main.async {
                        self.comentarios = comentarios.sorted { $0.data > $1.data }
                        self.statusMensagem = "Comentários carregados com sucesso!"
                    }
                } catch {
                    DispatchQueue.main.async {
                        self.statusMensagem = "Erro ao decodificar comentários: \(error.localizedDescription)"
                    }
                }
            }
        }
        task.resume()
    }
}

