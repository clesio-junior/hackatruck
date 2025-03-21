//
//  ContentView.swift
//  desafio01
//
//  Created by Turma01-7 on 06/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack(content: {
                Rectangle()
                    .fill(Color.red)
                    .frame(width:100, height:100)
                
                Spacer()
                Rectangle()
                    .fill(Color.blue)
                    .frame(width:100, height:100)
            })
            Spacer()
            HStack(content: {
                Rectangle()
                    .fill(Color.green)
                    .frame(width:100, height:100)
                
                Spacer()
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width:100, height:100)
            })

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
