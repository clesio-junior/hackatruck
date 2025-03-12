//
//  PontoView.swift
//  ProjetoMcBus
//
//  Created by Turma01-26 on 10/03/25.
//

import Foundation

class PontoViewModel: ObservableObject{
    
    @Published var arrayPontos: [Ponto] = []
    
    func fetch(){
        let urlPontos = "http://192.168.128.16:1880/getHorarios"
        
        let taskPontos = URLSession.shared.dataTask(with: URL(string: urlPontos)!){data, response, error in
           
      
        do{
            self.arrayPontos = try JSONDecoder().decode([Ponto].self, from: data!)
            self.arrayPontos.sort(by: { $0.hora < $1.hora })
             
        }catch{
            print(error)
        }
        }
        taskPontos.resume()
    }
    
}
