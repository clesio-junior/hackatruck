//
//  ContentView.swift
//  Desafio06
//
//  Created by Turma01-7 on 11/02/25.
//

import SwiftUI

struct ContentView: View {
    @State private var corFundo :Color = .gray

    var body: some View {
        
            TabView{
                    RosaView()
                        .badge("oi")
                        .tabItem {
                            Image(systemName:"paintbrush.fill")
                            Text("Rosa")
                        }
                    AzulView()
                        .tabItem {
                            Image(systemName:"paintbrush.pointed.fill")
                            Text("Azul")
                        }
                    CinzaView()
                        .tabItem {
                            Image(systemName:"paintpalette.fill")
                            Text("Cinza")
                        }
                    ListaView()
                        .tabItem {
                            Image(systemName:"list.bullet")
                            Text("Lista")
                        }
                }
    }
}

#Preview {
    ContentView()
}
