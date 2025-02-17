//
//  ContentView.swift
//  Desafio09_Mapas
//
//  Created by Turma01-7 on 13/02/25.
//

import SwiftUI
import MapKit

struct Location: Hashable {
    let name: String
    let latitude: Double
    let longitude: Double
    let flag: String
    let description: String
}


var arrayLocais = [
    Location(name: "Belo Horizonte", latitude: -19.924557, longitude: -43.991597, flag: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRd1xUGRXQasF8kD8wuJKoKPpUdz8vJ3Y-dJA&s", description: "Belo Horizonte é um municipio brasileiro e capital do estado de Minas Gerais. Sua população é de 2.315.560 habitantes, segundo o censo de 2022, sendo o sexto município mais populoso do país, o terceiro da região sudeste e o primeiro de seu estado."),
    
    Location(name: "Monte Carmelo", latitude: -18.719261, longitude: -47.495074, flag: "https://s2-g1.glbimg.com/c0g2gV-UstHMDxbO0crObZ9G3Oc=/0x0:2048x1365/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2021/x/r/LActsASpCagcrjB5HzNg/monte-carmelo.jpg", description: "Monte Carmelo é uma cidade no estado de Minas Gerais, com uma população de aproximadamente 49.000 habitantes. A cidade é conhecida pela agricultura, especialmente no cultivo de grãos como soja e milho, e pelo seu acolhimento e belas paisagens naturais."),
    
    Location(name: "Uberlândia", latitude: -18.918345, longitude: -48.276648, flag: "https://www.guiadoturismobrasil.com/up/img/1702330140.jpg", description: "Uberlândia é uma das maiores cidades do interior de Minas Gerais, com uma população de cerca de 700.000 habitantes. É um importante centro comercial, industrial e educacional do estado, além de ter uma grande influência econômica e cultural na região."),
    
    Location(name: "Viçosa", latitude: -20.758844, longitude: -42.879093, flag: "https://blog.habitarvicosa.com.br/wp-content/uploads/2019/10/Onde-morar-em-Vi%C3%A7osa.jpg", description: "Viçosa é uma cidade universitária conhecida por ser sede da Universidade Federal de Viçosa (UFV). Com aproximadamente 75.000 habitantes, a cidade tem grande relevância no ensino e na pesquisa científica no Brasil."),
    
    Location(name: "Uberaba", latitude: -19.748626, longitude: -47.938279, flag: "https://blog.bild.com.br/wp-content/uploads/2022/08/Morar-em-Uberaba.jpeg", description: "Uberaba é um importante polo agropecuário de Minas Gerais, localizada no Triângulo Mineiro. A cidade é conhecida pela realização da Expozebu, a maior feira de gado zebu do mundo, e pela sua história ligada à produção rural e à cultura regional.")
]




struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))

    @State private var selectedPlace = 0
    
    @State private var color: Color = .marromClaro
    @State private var showSheet = false

    @State private var selectedItem: Location = Location(name: "", latitude: -19.924557, longitude: -43.991597, flag: "", description: "")
    
    
    @State private var localAlfinete = CLLocationCoordinate2D()
    
    @State private var posicao = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.2350, longitude: -51.9253), span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
        )
    )
    
    var body: some View {
        
        ZStack {
            Map(position: $posicao) {

                ForEach(arrayLocais, id: \.self) { item in
                    Annotation(item.name, coordinate: CLLocationCoordinate2D(latitude: item.latitude, longitude: item.longitude)) {
                        Image(systemName: "mappin.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(.red)
                            .onTapGesture {
                                selectedItem = item
                                showSheet.toggle()
                            }
                            .sheet(isPresented: $showSheet) {
                              // if let item = selectedItem {
                                    SheetView(recebe: selectedItem)
                              //  }
                            }
                    } //fim do annotation
                } //fim do 
                
                
                }
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
                    
                    
                            .onChange(of: selectedPlace) { _ in
                                let newLocation = arrayLocais[selectedPlace]
                                posicao = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: newLocation.latitude, longitude: newLocation.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                                    )
                                )
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
