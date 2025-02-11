//
//  RosaView.swift
//  Desafio06
//
//  Created by Turma01-7 on 11/02/25.
//

import SwiftUI

struct RosaView: View {
    @State private var corFundo :Color = .pink

    var body: some View {
        ZStack {
            corFundo.edgesIgnoringSafeArea(.top)

            Image(systemName: "paintbrush")
                .resizable()
                .foregroundStyle(.pink)
                .background(.black)
                .frame(width:300, height:300)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    RosaView()
}

