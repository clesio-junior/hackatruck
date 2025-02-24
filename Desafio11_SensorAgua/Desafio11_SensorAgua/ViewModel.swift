//
//  ViewModel.swift
//  Desafio11_SensorAgua
//
//  Created by Turma01-7 on 24/02/25.
//

import Foundation

class NomeViewModel: ObservableObject{
    
    @Published var arrayUmidade : [SensorUmidade] = []
    
    func fetch1(){
        let urlSensor = "http://192.168.128.16:1880/getSensorAgua"
        
        let taskUmidade = URLSession.shared.dataTask(with: URL(string: urlSensor)!){data, response, error in
           
        
        do{
            self.arrayUmidade = try JSONDecoder().decode([SensorUmidade].self, from: data!)
            
        }catch{
            print(error)
        }
        }
        taskUmidade.resume()
    }
    
    
}
