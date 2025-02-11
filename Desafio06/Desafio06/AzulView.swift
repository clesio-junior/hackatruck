//
//  AzulView.swift
//  Desafio06
//
//  Created by Turma01-7 on 11/02/25.
//

import SwiftUI

struct AzulView: View {
    @State private var corFundo :Color = .blue

    var body: some View {
        ZStack {
            corFundo.edgesIgnoringSafeArea(.top)

            Image(systemName: "paintbrush.pointed.fill")
                .resizable()
                .foregroundStyle(.blue)
                .background(.black)
                .frame(width:300, height:300)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    AzulView()
}
