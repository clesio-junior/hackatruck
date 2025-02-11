//
//  sheetview.swift
//  desafio7
//
//  Created by Turma01-07 on 11/02/25.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @State private var color: Color = .azulescuro
    var body: some View {
        ZStack{
            color.ignoresSafeArea()
            
            Button("Nome: Clésio \nSobrenome: Júnior"){
                dismiss()
            }   .frame(width: 300)
                .foregroundColor(.white)
                .padding()
                .background(Color.pink)
                .cornerRadius(30)
        }
    }
}

#Preview {
    SheetView()
}
