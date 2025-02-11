//
//  modo2.swift
//  desafio7
//
//  Created by Turma01-07 on 11/02/25.
//

import SwiftUI

struct SegundaView: View {
    @State private var color: Color = .azulescuro
    @State private var nome: String = ""
    var body: some View {
        NavigationStack{
            ZStack{
                color.ignoresSafeArea()
                RoundedRectangle(cornerRadius: 40)
                    .frame(width: 340, height: 190)
                    .foregroundColor(.pink)
                VStack{
                    TextField("Digite o seu nome", text: $nome)
                        .background(.white)
                        .frame(width: 200, height: 40)
                        .foregroundColor(.black)
                    
                    Text("Bem-Vindo, \(nome)")
                        .padding()
                        .foregroundColor(.white)
                        
                    NavigationLink(destination: TerceiraView(nome: nome)){
                        Text("Acessar Tela")
                            .foregroundColor(.white)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .frame(width: 200, height: 50)
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
            }
        }
    }
}

#Preview {
    SegundaView()
}
