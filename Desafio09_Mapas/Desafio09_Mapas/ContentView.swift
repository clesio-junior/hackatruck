//
//  ContentView.swift
//  Desafio09_Mapas
//
//  Created by Turma01-7 on 13/02/25.
//

import SwiftUI
import MapKit

struct Location : Identifiable{
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
    let flag: String
    let description: String
}

var arrayLocais = [
    Location(name: "Belo Horizonte", coordinate: CLLocationCoordinate2D(latitude: -19.924557, longitude: -43.991597), flag: "https://upload.wikimedia.org/wikipedia/commons/9/9c/Bandeira-de-Belo-Horizonte.svg", description: "Belo Horizonte é um municipio brasileiro e capital do estado de Minas Gerais. Sua população é de 2.315.560 habitantes, segundo o censo de 2022, sendo o sexto município mais populoso do país, o terceiro da região sudeste e o primeiro de seu estado."),
    
    Location(name: "Monte Carmelo", coordinate: CLLocationCoordinate2D(latitude: -18.719261, longitude: -47.495074), flag: "https://upload.wikimedia.org/wikipedia/commons/5/5f/Bandeira_de_Monte_Carmelo_MG.svg", description: "Monte Carmelo é uma cidade no estado de Minas Gerais, com uma população de aproximadamente 49.000 habitantes. A cidade é conhecida pela agricultura, especialmente no cultivo de grãos como soja e milho, e pelo seu acolhimento e belas paisagens naturais."),
    
    Location(name: "Uberlândia", coordinate: CLLocationCoordinate2D(latitude: -18.918345, longitude: -48.276648), flag: "https://upload.wikimedia.org/wikipedia/commons/e/e6/Bandeira_de_Uberl%C3%A2ndia.svg", description: "Uberlândia é uma das maiores cidades do interior de Minas Gerais, com uma população de cerca de 700.000 habitantes. É um importante centro comercial, industrial e educacional do estado, além de ter uma grande influência econômica e cultural na região."),
    
    Location(name: "Viçosa", coordinate: CLLocationCoordinate2D(latitude: -20.758844, longitude: -42.879093), flag: "https://upload.wikimedia.org/wikipedia/commons/7/73/Bandeira_de_Vi%C3%A7osa_MG.svg", description: "Viçosa é uma cidade universitária conhecida por ser sede da Universidade Federal de Viçosa (UFV). Com aproximadamente 75.000 habitantes, a cidade tem grande relevância no ensino e na pesquisa científica no Brasil."),
    
    Location(name: "Uberaba", coordinate: CLLocationCoordinate2D(latitude: -19.748626, longitude: -47.938279), flag: "https://upload.wikimedia.org/wikipedia/commons/2/23/Bandeira_de_Uberaba.svg", description: "Uberaba é um importante polo agropecuário de Minas Gerais, localizada no Triângulo Mineiro. A cidade é conhecida pela realização da Expozebu, a maior feira de gado zebu do mundo, e pela sua história ligada à produção rural e à cultura regional.")
]




struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

    @State private var selectedPlace = 0
    
    @State private var color: Color = .marromClaro

    @State private var posicao = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        )
    )
    
    var body: some View {
        
        ZStack {
            Map(position: $posicao)
                .ignoresSafeArea()

            VStack(content: {
                HStack(content: {
                    Picker("Selecione o Local", selection: $selectedPlace) {
                            ForEach(arrayLocais.indices, id: \.self) { index in
                                Text(arrayLocais[index].name).tag(index)
                                        }
                                    }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 200, height: 20)
                            .padding()
                            .background(Color.amareloClaro.opacity(0.8))
                            .cornerRadius(8)
                    
                    
                            .onChange(of: selectedPlace){ newIndex in
                                        posicao = MapCameraPosition.region(
                                            MKCoordinateRegion(
                                                center: arrayLocais[newIndex].coordinate,
                                                span: MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
                                            )
                                        )
                                Annotation("Teste", coordinate: posicao){
                                    Image(systemName: "mapping")
                                }
                                    
                                
                                
                                    }
                })
                .frame(width:500)
                Spacer()
                    
                HStack(content: {
                    Text("Cidades de MG")
                        .frame(width: 200, height: 20)
                        .padding()
                        .background(Color.amareloClaro.opacity(0.8))
                        .cornerRadius(8)
                })
            })
        }
    }
}

#Preview {
    ContentView()
}
