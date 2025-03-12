//
//  ContentView.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 26/02/25.
//

import SwiftUI
 
struct ContentView: View {

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.azul
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Início")
                }
            LinhasView()
                .tabItem {
                    Image(systemName: "bus.fill")
                    Text("Linhas")
                }
            
//            Zero50View()
//                .tabItem {
//                    Image(systemName: "bus.fill")
//                    Text("050")
//                }
//
//            IntercampiView()
//                .tabItem {
//                    Image(systemName: "tram.fill")
//                    Text("Intercampi")
//                }
            
            GPSView()
                .tabItem {
                    Image(systemName: "map.fill")
                    Text("GPS")
                }
            
            OcorrenciasView()
                .tabItem {
                    Image(systemName: "bubble.left.and.bubble.right.fill")
                    Text("Ocorrencias")
                }
        }
        .tint(.white)
    }
}
struct HomeView: View {

    
    @EnvironmentObject var vm : ComentariosViewModel
    
    @State private var userName: String = ""
    @State private var isLoggedIn: Bool = false
    var body: some View {
        ZStack {
            // Imagem de fundo
            // Image(.telaFundo)
            //     .resizable()
            //     .ignoresSafeArea()

            VStack {
                Spacer()

                VStack {
                    AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/7/76/UFU_LOGO.png")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 60)
                            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    } placeholder: {
                        ProgressView()
                    }

                    Text("U - FUI")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color.azul.opacity(0.8))
                        )
                }

                Spacer()

                ZStack {
                    Circle()
                        .fill(Color.azul.opacity(0.8))
                        .frame(width: 500, height: 350)
                        .offset(x: 180)

                    VStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .offset(x: 180, y: -50)

                        Image(systemName: "bus.fill")
                            .foregroundColor(.white)
                            .font(.largeTitle)
                            .offset(x: 230, y: 70)
                    }
                    .offset(x: -80)
                }
                .frame(maxHeight: .infinity)

                Spacer()

                if !isLoggedIn {
                    VStack(spacing: 16) {
                        
                        TextField("Digite seu nome", text: $userName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal, 40)
                           

                        Button(action: {
                            if !userName.isEmpty {
                                vm.user = userName
                                isLoggedIn = true // Marca como logado
                                
                            } else {
                                print("Por favor, insira um nome.")
                            }
                        }) {
                            HStack {
                                Image(systemName: "person.circle.fill")
                                    .foregroundColor(.white)
                                Text("Logar")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color.azul.opacity(0.9))
                            .clipShape(Capsule())
                        }
                    }
                    .padding()
                } else {
                   // userName = settings.nomeUsuario
                    NextView(userName: userName)
                }

                Spacer()
            }
            Spacer()
        }
    }
}

struct NextView: View {
    var userName: String

    var body: some View {
        VStack {
            Text("Bem-vindo, \(userName)!")
                .font(.largeTitle)
                .padding()

            
        }
    }
}
//struct GPSView: View {
//    var userName: String
//
//    var body: some View {
//        VStack {
//            Text("Bem-vindo, \(userName)!")
//                .font(.largeTitle)
//                .padding()
//
//
//        }
//    }
//}
struct LinhasView: View {
    @State private var selectedLine: String = "050"
    
    var body: some View {
        NavigationView {
            ZStack {
                Image(.telaFundo)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Picker para escolher entre 050 e Intercampi
                    Picker("Linha", selection: $selectedLine) {
                        Text("050").tag("050")
                        Text("Intercampi").tag("Intercampi")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    
                    if selectedLine == "050" {
                        Zero50View()
                    } else {
                        IntercampiView()
                    }
                    
                    Spacer()
                }
                .navigationTitle("Linhas")
                .toolbar {
                    // Botão de engrenagem no canto superior direito
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}
//struct BusStop: Identifiable {
//    let id = UUID()
//    let time: String
//    let name: String
//}





struct PontoOnibusDetailView: View {
    let ponto: Ponto
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack(alignment: .leading, spacing: 15) {
                    Text(ponto.local.nome)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Horário: \(ponto.hora)")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    
                    Text("Endereço: \(ponto.local.endereco)")
                        .foregroundColor(.primary)
                    
                    Text("Coordenadas: \(ponto.local.latitude), \(ponto.local.longitude)")
                        .foregroundColor(.primary)
                    
                    if let url = URL(string: ponto.local.foto) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .padding(.top, 10)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                }
            }
            .padding()
            .background(Color(UIColor.systemBackground))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
        .accentColor(.blue)
        .edgesIgnoringSafeArea(.all)
    }
}




 
 struct GPSView: View {
     var body: some View {
         VStack {
             Text("Página GPS")
                 .font(.largeTitle)
         }
         .background(Color.red.opacity(0.1))
     }
 }


 

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }


