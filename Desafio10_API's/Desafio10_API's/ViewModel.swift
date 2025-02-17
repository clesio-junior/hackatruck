//
//  ViewModel.swift
//  Desafio10_API's
//
//  Created by Turma01-7 on 17/02/25.
//

import Foundation

class NomeViewModel: ObservableObject{
    
    @Published var arraySimpsons : [Simpsons] = []
    
    func fetch1(){
        let urlSimpsons = "https://thesimpsonsquoteapi.glitch.me/quotes?count=10"
        
        let taskSimpsons = URLSession.shared.dataTask(with: URL(string: urlSimpsons)!){data, response, error in
           
        
        do{
            self.arraySimpsons = try JSONDecoder().decode([Simpsons].self, from: data!)
            
        }catch{
            print(error)
        }
        }
        taskSimpsons.resume()
    }
    
    
}
