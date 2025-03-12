//
//  OcorrenciasView.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 10/03/25.
//

//COLOQUEI A PARTE DA CAMILLY ERRADO. ANALISAR MELHOR O COD DELA
import SwiftUI

struct OcorrenciasView: View {

        var body: some View {
            ZStack {
                Image("telaFundo")
                    .ignoresSafeArea()
                
                VStack{
                    Image("logo3")
                        .resizable()
                    
                        .frame(width: 150, height: 80)
                        .padding(65)
                        .overlay(
                            VStack{
                                Spacer()
                                Text("--------------")
                                    .bold()
                                    .foregroundColor(.azul)
                                    .font(Font.custom("", size: 30))
                            }.padding(60)
                        )
                    Spacer()
                    ZStack{
                        Rectangle()
                            .frame(width: 400, height:700)
                            .foregroundColor(.azul)
                            .cornerRadius(45)
                            .overlay(
                                VStack{
                                    HStack{
                                        Text("Comentários")
                                            .foregroundColor(.white)
                                            .font(Font.custom("MyFont", size: 25))
                                            .bold()
                                            .padding(20)
                                        Spacer()
                                        Image(systemName: "chart.bar.doc.horizontal.fill")
                                            .resizable()
                                            .foregroundColor(.white)
                                            .frame(width: 25, height: 30)
                                            .padding(10)
                                    }.padding(10)
                                    Spacer()
                                    NavigationView{
                                        ComentariosView()
                                            .background(.azul)
                                            .ignoresSafeArea()
                                            .scrollContentBackground(.hidden)
                                        
                                        
                                    }
                                    .padding(.bottom, 100)
                                }
                            )
                    }
                }
            }
        }
    }


#Preview {
    OcorrenciasView()
}

