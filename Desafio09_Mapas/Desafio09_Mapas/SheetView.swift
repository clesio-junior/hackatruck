//
//  SheetView.swift
//  Desafio09_Mapas
//
//  Created by Turma01-7 on 13/02/25.
//

import SwiftUI

struct SheetView: View {
    @State private var color: Color = .amareloClaro
    @State private var imagemURL: String = "URL DA IMAGEM"
    @State private var titulo: String = "TÍTULO AQUI"
    @State private var descricao: String = "DESCRIÇÃO AQUI"

    
    var body: some View {
        ZStack{
            color.ignoresSafeArea()
            
            VStack{
                
                HStack{
                                        
                    AsyncImage(url: URL(string: imagemURL)) { image in image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 300, height: 200, alignment: .leading)
                    
                    
                    
                    
                }
                Spacer()
                    .frame(height: 50)
                HStack{
                    Text(titulo)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.marromClaro)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                    .frame(height: 50)
                HStack{
                    Text(descricao)
                }
                .frame(width: 320, height: 380)
                .padding()
                .background(Color.marromClaro.opacity(0.8))
                .cornerRadius(8)
                
                
                
            }
            
            
            VStack{
                
            }
            
            
            
            
            
            
            
            
            
            
            
        }




    }
}

#Preview {
    SheetView()
}
