//
//  peticionesAPI.swift
//  TareaIOS
//
//  Created by alumnos on 13/11/24.
//

import Foundation



class PeticionesAPI{
    
    static func peticionGet(username: String,  completion: @escaping ([Puntuacion])-> Void){
        finDePeticion = false
        let scoresURL = URL(string: APIURL + "?name=eq." + username)
        if let unwrappedURL = scoresURL {
            var request = URLRequest(url: unwrappedURL)
            request.addValue(apiKEY, forHTTPHeaderField: "apikey")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let arrayDatos = try JSONDecoder().decode([Puntuacion].self, from: data) as [Puntuacion]
                        print(arrayDatos)
                        finDePeticion = true
                        completion(arrayDatos)
                        
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
    static func peticionPost(datos: Puntuacion){
        finDePeticion = false
        let url = URL(string: APIURL)

        var peticionPOST = URLRequest(url: url!)
        peticionPOST.httpMethod = "POST"

        peticionPOST.setValue("application/json", forHTTPHeaderField: "Content-Type")
        peticionPOST.addValue(apiKEY, forHTTPHeaderField: "apikey")

        do {
            let user = try JSONEncoder().encode(datos)
            peticionPOST.httpBody = user
            let dataTask = URLSession.shared.dataTask(with: peticionPOST) { (data, response, error) in
                if error == nil {
                    print(response!)
                    finDePeticion = true
                } else {
                    print(error!)
                }
            }
            dataTask.resume()
        } catch let errorJson {
            print(errorJson)
        }

        
    }
    
}
