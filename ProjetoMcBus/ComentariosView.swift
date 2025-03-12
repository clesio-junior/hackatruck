//
//  ComentariosView.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 11/03/25.
//

//
//  ComentariosView.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 11/03/25.
//

import SwiftUI

struct ComentariosView: View {
    @EnvironmentObject var viewModel : ComentariosViewModel
    @State var usuario: String = "Usuário"
    //@EnvironmentObject var settings: GlobalSettings


    var body: some View {
        VStack {
            List(viewModel.comentarios) { comentario in
                VStack(alignment: .leading) {
                    Text(comentario.userName)
                        .font(.headline)
                    Text(comentario.texto)
                        .font(.body)
                    Text("\(comentario.data, formatter: itemFormatter)")
                        .font(.caption)
                }
                .listRowBackground(Color(white: 1, opacity: 0.70))
                .padding(.vertical, 4)
            }
            .listRowSpacing(10)

            Spacer()

            HStack {
                TextField("Escreva seu comentário...", text: $viewModel.novoComentario)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .cornerRadius(20)

                Button(action: {
                    usuario = viewModel.user
                    viewModel.adicionarComentario(usuario: usuario)
                }) {
                    Text("Comentar")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.blue)
                        .cornerRadius(20)
                }
            }
            .padding()

            Text(viewModel.statusMensagem)
                .padding()
                .foregroundColor(viewModel.statusMensagem.contains("Erro") ? .red : .green)
        }
        .onAppear {
            viewModel.fetchComentarios()
        }
//        .navigationTitle("Comentários")
        .toolbarColorScheme(.light, for: .navigationBar)
    }
}

let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

