//
//  SheetView.swift
//  Desafio10_API's
//
//  Created by Turma01-7 on 18/02/25.
//

import SwiftUI

struct SheetView: View {
    @State var imagem : String = ""
    @State var nome : String = "nome inicial"
    @State var frase : String = "frase padrao para iniciar"
    
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                    .frame(height: 120)
                HStack(content: {
                    
                    AsyncImage(url: URL(string: imagem)) { image in
                        image.resizable()
                            .scaledToFit()
                        //   .background(Color.white)
                            .frame(width:300, height:120)
                        //                                    .background(Color.white)
                    } placeholder: {
                        ProgressView()
                    }
                    .background(Color.white)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    
                })
                Spacer()
                    .frame(height: 50)
                VStack{
                    HStack(content: {
                        Text("Nome do personagem:")
                            .frame(alignment: .leading)
                    })
                    HStack(content: {
                        Text(nome)
                            .font(.title)
                    })
                }
                
                Spacer()
                    .frame(height: 50)
                VStack{
                    HStack(content: {
                        Text("Frase:")
                            .frame(alignment: .leading)
                    })
                    HStack(content: {
                        Text(frase)
                            .font(.system(size: 20))
                    })
                }
                .background(Color.amareloSimpson.opacity(1))
                .cornerRadius(8)
                .frame(width: 350)
                
                Spacer()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
        }
 //           .background(Color.amareloSimpson)

    }
    
}

#Preview {
    SheetView(imagem: "", nome: "", frase: "")
}
