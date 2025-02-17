//
//  ContentView.swift
//  Desafio10_API's
//
//  Created by Turma01-7 on 17/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var teste: String = ""
    var linkImagem: String = "https://logos-world.net/wp-content/uploads/2023/02/The-Simpsons-Emblem.png"
    @StateObject var vmSimpsons = NomeViewModel()
    
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: linkImagem)) { image in
                image.resizable()
                    .frame(width:300, height:160)
            } placeholder: {
                ProgressView()
            }
            
            Text("\(vmSimpsons.arraySimpsons.count)")
            ScrollView{
            VStack{
                ForEach(vmSimpsons.arraySimpsons, id:\.self){ m in
                    HStack(content: {
                        VStack(content: {
                            AsyncImage(url: URL(string: m.image)) { image in
                                image.resizable()
                                    .frame(width:100, height:120)
                            } placeholder: {
                                ProgressView()
                            }
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        })
                        Spacer()
                        VStack(content: {
                            HStack(alignment: .center,  content: {
                                Text(m.character)
                            })
                            .frame(alignment: .leading)

                            HStack(alignment: .center,content: {
                                Text(m.quote)
                                    .font(.footnote)
                            })
                            .frame(alignment: .leading)
                        })
                    })
//                    .frame(width: 200, height: 20)
//                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(8)
                }
            }
        }
                    
        }.onAppear(){
            vmSimpsons.fetch1()
        }
        .background(Color.amareloSimpson)
    }
}

#Preview {
    ContentView()
}
