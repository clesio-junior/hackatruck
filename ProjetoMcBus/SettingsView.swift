//
//  SettingsView.swift
//  ProjetoMcBus
//Marcelo
//  Created by Turma01-26 on 28/02/25.
//
import SwiftUI

struct SettingsView: View {
    @State private var selectedIssues: [String] = []
    private let issues = [
        "Sempre atrasado", // os problemas do busao
        "Ônibus quebrado",
        "Motorista dirige mal",
        "Lotação excessiva",
        "Ar-condicionado não funciona",
        "Não para no ponto certo"
    ]
    
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false // claro e escuro
    @AppStorage("userName") private var savedUserName: String = "Usuário"// guarda o nome do ccara
    @AppStorage("fontSize") private var fontSize: Double = 16 // tamanaho da fonte
    
    @State private var newUserName: String = ""
    @State private var newIssue: String = ""

    var body: some View {
        ZStack {
            Image("telaFundo")
                            .resizable()
                            .ignoresSafeArea()
            VStack {
                Image("logo3")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 50)
                    .padding(.top, 20)
                
                Text("CONFIGURAÇÕES")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.top, 5)
                
                Spacer()
                
                List {
                    // Personalizar
                    NavigationLink {
                        VStack {
                            Text("Modo de Exibição")
                                .font(.headline)
                                .padding()
                            
                            Toggle("Modo Escuro", isOn: $isDarkMode)
                                .toggleStyle(SwitchToggleStyle())
                                .padding() // switch de claro e escuro
                            // ignorar essa parte de fonte , nao acho que vai ficar bom
                            VStack {
                                Text("Tamanho da fonte")
                                Slider(value: $fontSize, in: 12...24, step: 1)
                                    .padding()
                                Text("Prévia da Fonte")
                                    .font(.system(size: fontSize))
                            }
                            .padding()
                            
                            Spacer()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "paintbrush")
                                .foregroundColor(.blue)
                            Text("Personalizar")
                        }
                    }
                    
                    // Alterar Nome
                    NavigationLink {
                        VStack(spacing: 20) {
                            Text("Alterar Nome")
                                .font(.headline)
                            
                            Text("Nome atual: \(savedUserName)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            TextField("Digite seu novo nome", text: $newUserName)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Button(action: {
                                if !newUserName.isEmpty {
                                    savedUserName = newUserName
                                    newUserName = ""
                                }
                            }) {
                                Text("Salvar")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        .padding()
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.blue)
                            Text("Alterar dados")
                        }
                    }
                    
                    // Ocorrências
                    NavigationLink {
                        VStack {
                            Text("Selecione ou descreva os problemas")
                                .font(.headline)
                                .padding()
                            
                            ForEach(issues, id: \.self) { issue in
                                Toggle(issue, isOn: Binding(
                                    get: { selectedIssues.contains(issue) },
                                    set: { isSelected in
                                        if isSelected {
                                            selectedIssues.append(issue)
                                        } else {
                                            selectedIssues.removeAll { $0 == issue }
                                        }
                                    }
                                ))
                                .toggleStyle(SwitchToggleStyle())
                                .padding(.horizontal)
                            }
                            // aqui eu nao sei se vai ser necessario já que tem a tela de feedback
                            TextField("Outro problema...", text: $newIssue)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            
                            Button(action: {
                                if !newIssue.isEmpty {
                                    selectedIssues.append(newIssue)
                                    newIssue = ""
                                }
                            }) {
                                Text("Adicionar Problema")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.red)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            
                            Spacer()
                        }
                        .padding()
                    } label: {
                        HStack {
                            Image(systemName: "exclamationmark.bubble")
                                .foregroundColor(.blue)
                            Text("Ocorrências")
                        }
                    }
                    
                    // Sobre Nós
                    NavigationLink {
                        VStack {
                            Text("Equipe U-FUI")
                                .font(.headline)
                                .padding()
                            
                            Text("Versão 1.0")
                                .padding(.bottom)
                            // botao que envia a sugstao para a gente// nao funcional, pois nao é necessario
                            Button(action: {
                                let email = "suporte@ufui.com"
                                let subject = "Sugestão para o U-FUI"
                                let body = "Olá, tenho uma sugestão para o app..."
                                let emailLink = "mailto:\(email)?subject=\(subject)&body=\(body)"
                                
                                if let url = URL(string: emailLink) {
                                    UIApplication.shared.open(url)
                                }
                            }) {
                                Text("Enviar Sugestão 📩")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                            }
                            .padding(.horizontal)
                            
                            VStack(spacing: 10) {
                                Text("Nos siga:")
                                    .font(.headline)
                                // apenas para enxer a tela
                                // nao tem os incones oficial
                                Link("Instagram 📷", destination: URL(string: "https://instagram.com/ufui_app")!)
                                Link("Twitter 🐦", destination: URL(string: "https://twitter.com/ufui_app")!)
                            }
                            .padding()
                            
                            Spacer()
                        }
                        .padding()
                    } label: {
                        HStack {
                            Image(systemName: "info.circle")
                                .foregroundColor(.blue)
                            Text("Sobre nós")
                        }
                    }
                }
                .scrollContentBackground(.hidden)
            }
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}

//
