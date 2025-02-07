//
//  ContentView.swift
//  Desafio04_ZStacks
//
//  Created by Turma01-7 on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = "Fulano"
    var body: some View {
        
        VStack(content: {

            
            ZStack(content: {
                Image("img")
                    .ignoresSafeArea()
                    .opacity(0.2)

                VStack(content: {
                    HStack(content: {
                        Text("Bem vindo, \(name)!")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    })
                    HStack(content: {
                        TextField("Digite o seu nome:", text: $name)
                            .multilineTextAlignment(.center)
                    
                    })

                    HStack(content: {
                        Image("logo")
                            .resizable()
                            .frame(width:160, height:100)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    })
                    HStack(content: {
                        Image("truck")
                            .resizable()
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            .frame(width:190, height:100)
                    })
                    
                    HStack(content: {
                        Button("Entrar") {
                            /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                        }
                        .font(.title2)
                        .offset(CGSize(width: 10.0, height: 220.0))
                    })
                })

                    Spacer()
                
                    .padding()
                
                
            })
            
            
            
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
