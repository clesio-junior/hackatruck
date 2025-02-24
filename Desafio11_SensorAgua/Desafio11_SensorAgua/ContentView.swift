//
//  ContentView.swift
//  Desafio11_SensorAgua
//
//  Created by Turma01-7 on 24/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    @State var teste: String = ""
    
    @State var temp_img : String = "https://cdn.glitch.com/3c3ffadc-3406-4440-bb95-d40ec8fcde72%2FHomerSimpson.png?1497567511939"
    @State var temp_nome : String = "Homer Simpson"
    @State var temp_frase : String = "D'oh!"
    
    
    var linkImagem: String = "https://logos-world.net/wp-content/uploads/2023/02/The-Simpsons-Emblem.png"
    @StateObject var vmUmidade = NomeViewModel()
    
    
    var body: some View {
        
        NavigationView{
        VStack {
            //Text("\(vmSimpsons.arraySimpsons.count)")
            ScrollView{
                VStack{
                    ForEach(vmUmidade.arrayUmidade.sorted{ $0.data < $1.data}, id:\.self){ m in

                        HStack(content: {
                             VStack(content: {
                                HStack(alignment: .center,  content: {
                                    Text(m.umidade)
                                })
                                .frame(alignment: .leading)
                                HStack(alignment: .center,content: {
                                    Text("")
                                        .font(.footnote)
                                })
                                .frame(alignment: .leading)
                            })
                            VStack(content: {
                                Button(action: {
                             //       temp_nome = m.character
                             //       temp_frase = m.quote
                             //       temp_img = m.image
                                    
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
            vmUmidade.fetch1()
        }.sheet(isPresented: $showSheet) {
            SheetView()
        }
//        .background(Color.yellow)
        }
    }
}

#Preview {
    ContentView()
    
}
