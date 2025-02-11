//
//  PrimeiraView.swift
//  Desafio07
//
//  Created by Turma01-7 on 11/02/25.
//

import SwiftUI

struct PrimeiraView: View {
    @State private var cor :Color = .azulescuro
    var body: some View {

        ZStack(content: {
            
            cor.ignoresSafeArea()
            Text("Modo 1")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
                .frame(height:200)
            VStack(content: {
                
                HStack{
                    Text("Nome: Clésio\nSobrenome: Júnior")
                        .frame(width: 250, height:80)
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            })
        })
        
    }
}

#Preview {
    PrimeiraView()
}
