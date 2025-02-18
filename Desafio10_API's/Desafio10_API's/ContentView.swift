//
//  ContentView.swift
//  Desafio10_API's
//
//  Created by Turma01-7 on 17/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @State var teste: String = ""
    
    @State var temp_img : String = "https://cdn.glitch.com/3c3ffadc-3406-4440-bb95-d40ec8fcde72%2FHomerSimpson.png?1497567511939"
    @State var temp_nome : String = "Homer Simpson"
    @State var temp_frase : String = "D'oh!"
    
    
    var linkImagem: String = "https://logos-world.net/wp-content/uploads/2023/02/The-Simpsons-Emblem.png"
    @StateObject var vmSimpsons = NomeViewModel()
    
    
    var body: some View {
        
        NavigationView{
        VStack {
            AsyncImage(url: URL(string: linkImagem)) { image in
                image.resizable()
                    .frame(width:300, height:160)
//                    .offset(CGSize(width: 10.0, height: -40.0))
            } placeholder: {
                ProgressView()
            }
            
            
            //            Text("\(vmSimpsons.arraySimpsons.count)")
            ScrollView{
                VStack{
                    ForEach(vmSimpsons.arraySimpsons, id:\.self){ m in

                        HStack(content: {
                            
                            VStack(content: {
                                AsyncImage(url: URL(string: m.image)) { image in
                                    image.resizable()
                                        .scaledToFit()
                                    //   .background(Color.white)
                                        .frame(width:120, height:100)
                                    //                                    .background(Color.white)
                                } placeholder: {
                                    ProgressView()
                                }
                                .background(Color.white)
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
                            Spacer()
                            VStack(content: {
                                Button(action: {
                                    temp_nome = m.character
                                    temp_frase = m.quote
                                    temp_img = m.image
                                    
                                    showSheet.toggle()
                                }, label: {
                                    Text("Ver mais")
                                        .foregroundStyle(Color.blue)
                                        .frame(width:80, height:150)
                                        .cornerRadius(10)
                                    //
                                })
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
        }.sheet(isPresented: $showSheet) {
            SheetView(imagem: temp_img, nome: temp_nome, frase: temp_frase)
        }
        .background(Color.amareloSimpson)
        }
    }
}

#Preview {
    ContentView()
    
}
