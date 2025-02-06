//
//  ContentView.swift
//  Desafio02
//
//  Created by Turma01-7 on 06/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack(content: {
            VStack(content: {
                Image("hackatruck")
                    .resizable()
                    .foregroundStyle(.tint)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
            })
            
            
            VStack(content: {
                Text("HackaTruck")
                    .foregroundColor(Color.red)
                Text("77 universidades")
                    .foregroundColor(Color.blue)
                Text("5 regiões do Brasil")
                    .foregroundColor(Color.yellow)
            })
            
            
            
        })
        

    }
}

#Preview {
    ContentView()
}
