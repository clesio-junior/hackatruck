//
//  modo3.swift
//  desafio7
//
//  Created by Turma01-07 on 11/02/25.
//

import SwiftUI

struct TerceiraView: View {
    @State var nome: String = ""
    @State private var color: Color = .azulescuro
    var body: some View {
        ZStack{
            color.ignoresSafeArea()
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 340, height: 190)
                .foregroundColor(.pink)
            VStack{
                Text("Volte, \(nome)")
                    .padding()
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    TerceiraView()
}
