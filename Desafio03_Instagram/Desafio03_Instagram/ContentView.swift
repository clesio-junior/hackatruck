//
//  ContentView.swift
//  Desafio03_Instagram
//
//  Created by Turma01-7 on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    
    VStack(content: {
        
        HStack(content: {
            ZStack(content: {
                Image("hackatruck")
                    .resizable()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 150, height: 120)
                
                Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.blue)
                        .offset(x: 55, y: 55)
            })
            
                
            VStack(content: {
                HStack(content: {
                    Text("8")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                HStack(content: {
                    Text("Posts")
                })
            })
            
            VStack(content: {
                HStack(content: {
                    Text("12k")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                HStack(content: {
                    Text("Seguidores")
                })
            })
            
            VStack(content: {
                HStack(content: {
                    Text("2k")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                })
                HStack(content: {
                    Text("Seguindo")
                })
            })
            
        })
           Button("Editar Perfil") {
           }
           .background(Color.gray.opacity(0.6))
           .buttonStyle(.bordered)
           .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.center)
           .cornerRadius(8)

        
        
    })
    .padding()
        VStack(content: {
            HStack(content: {
                Text("Nome Sobrenome")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)
            })
            HStack(content: {
                Text("Esta é a biografia do perfil do usuário.")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,  alignment:.leading)

                    .font(.footnote)
            })
        })
        .padding()
        
        HStack(content: {
            VStack(content: {
                Image(systemName: "square.grid.3x3.fill")
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            })
            
            VStack(content: {
                Image(systemName: "laptopcomputer")
            })
            VStack(content: {
                Image(systemName: "person.crop.circle.fill")
            })
        })
        

        
    HStack(content: {
                    
        VStack {
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
        }
        
        VStack {
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
        }
        
        VStack {
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
            
            HStack(content: {
                Rectangle()
                    .frame(width: 120, height: 120)
                    .foregroundColor(.gray)
            })
        }
        
            
    })
        
        .padding()
    }
}


#Preview {
    ContentView()
}
