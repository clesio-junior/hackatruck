//
//  Zero50View.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 10/03/25.
//

import SwiftUI

struct Zero50View: View {
    @State private var currentTime: String = Self.getCurrentTime()
    @State private var selectedDirection: String = "Sentido UFU"
    @StateObject var vmPontos = PontoViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.telaFundo)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    Picker("Sentido", selection: $selectedDirection) {
                        Text("Sentido UFU").tag("Sentido UFU")
                        Text("Sentido Sesi Minas").tag("Sentido Sesi Minas")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    Spacer().frame(height: 20)
                    
//                    Colocar o sentido atraves do campo ponto da struct
                    
                    ScrollView {
                        if(selectedDirection == "Sentido UFU"){
                            ForEach(vmPontos.arrayPontos.filter { $0.rota == "050" }) { ponto in
                                if(ponto.tipo == "ida"){
                                    HStack {
                                        
                                        Text(ponto.hora)
                                            .bold()
                                            .foregroundColor(.white)
                                        
                                        Text(ponto.local.nome)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                        
                                        NavigationLink(destination: PontoOnibusDetailView(ponto: ponto)) {
                                            Text("Detalhes")
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 5)
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                                    }
                                    .padding(.vertical, 9)
                                    .padding(.horizontal, 20)
                                    .background(Color.azul)
                                    .cornerRadius(90)
                                }
                            }
                        }
                        if(selectedDirection == "Sentido Sesi Minas"){
                            ForEach(vmPontos.arrayPontos.filter { $0.rota == "050" }) { ponto in
                                if(ponto.tipo == "volta"){
                                    HStack {
                                        
                                        Text(ponto.hora)
                                            .bold()
                                            .foregroundColor(.white)
                                        
                                        Text(ponto.local.nome)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .foregroundColor(.white)
                                        
                                        NavigationLink(destination: PontoOnibusDetailView(ponto: ponto)) {
                                            Text("Detalhes")
                                                .padding(.horizontal, 10)
                                                .padding(.vertical, 5)
                                                .background(Color.blue)
                                                .foregroundColor(.white)
                                                .cornerRadius(8)
                                        }
                                    }
                                    .padding(.vertical, 9)
                                    .padding(.horizontal, 20)
                                    .background(Color.azul)
                                    .cornerRadius(90)
                                }
                            }
                        }
                    }
                    .onAppear(){
                        vmPontos.fetch()
                    }
                    .padding(.horizontal, 20)
                    
                }
            }
            .navigationTitle("050")
            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: SettingsView()) {
//                        Image(systemName: "gearshape.fill")
//                            .foregroundColor(.white)
//                    }
//                }
            }
        }
    }
    
    static func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: Date())
    }
}

#Preview {
    Zero50View()
}
