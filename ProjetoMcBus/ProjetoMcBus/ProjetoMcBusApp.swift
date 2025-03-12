//
//  ProjetoMcBusApp.swift
//  ProjetoMcBus
//
//  Created by Turma01-7 on 12/03/25.
//

import SwiftUI

@main
struct ProjetoMcBusApp: App {
    var settings = ComentariosViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
