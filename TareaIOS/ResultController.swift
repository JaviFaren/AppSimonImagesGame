//
//  ResultController.swift
//  TareaIOS
//
//  Created by user257494 on 30/10/2024.
//

import UIKit

var puntuacionFinal = 0
var perfectscore = false
let apiKEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFoYXZydmtobGJtc2xqZ21ia25yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA3MjY5MTgsImV4cCI6MjAxNjMwMjkxOH0.Ta-_lXGGwSiUGh0VC8tAFcFQqsqAvB8vvXJjubeQkx8"

class ResultController: UIViewController {
    
    var respuestasUser = [Int]()
    var imagenSeleccionado = [Bool]()
    
    @IBOutlet weak var ConfirmarButton: UIButton!
    @IBOutlet weak var TextoPuntuacion: UILabel!
    
    @IBOutlet weak var BotonMarcadoresNo: UIButton!
    @IBOutlet weak var BotonMarcadoresSi: UIButton!
    
    @IBOutlet var checkboxes: [UIImageView]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserDefaults.standard.set(0, forKey: "PuntuacionMax")
        
        for (index, _) in imagenesOrigen.enumerated(){
            imagenSeleccionado.append(false)
            checkboxes[index].alpha = 0
        }
        ConfirmarButton.alpha = 0
        TextoPuntuacion.alpha = 0
        BotonMarcadoresNo.alpha = 0
        BotonMarcadoresSi.alpha = 0
    }
    
    @IBAction func Botones(_ sender: UIButton) {
        ButtonAction(tag: sender.tag)
    }
    
    @IBAction func ConfirmButton(_ sender: Any) {
        var streak = 0
        for (index, _) in respuestasUser.enumerated(){
            if respuestasUser[index] == imagenesPos[index]{
                streak = streak + 1
            }
            else{
                break
            }
        }
        
        puntuacionFinal = 125 * streak
        TextoPuntuacion.text = "Has acertado " + String(streak) + " de " + String(imagenesPos.count) + "\nTu puntuación es de: " + String(puntuacionFinal)
        TextoPuntuacion.alpha = 1
        
        if(streak == respuestasUser.count-1){
            perfectscore = true
        }
        else{
            perfectscore = false
        }
        
        if let puntosAlm = UserDefaults.standard.value(forKey: "PuntuacionMax")
        {
            UserDefaults.standard.set(puntuacionFinal, forKey: "PuntuacionMax")
            if puntuacionFinal > puntosAlm as! Int{
                TextoPuntuacion.text = TextoPuntuacion.text! + "\nNuevo Record! ¿Quieres subirlo a marcadores?"
                
                BotonMarcadoresNo.alpha = 1
                BotonMarcadoresSi.alpha = 1
            }
        } else {
            UserDefaults.standard.set(puntuacionFinal, forKey: "PuntuacionMax")
        }
        
        ConfirmarButton.alpha = 0
    }
    
    @IBAction func NoSubir(_ sender: Any) {
        if perfectscore{
            TextoPuntuacion.text = "¿Quieres seguir jugando? (acumula mas puntos)"
        }
        else{
            TextoPuntuacion.text = "¿Quieres iniciar otra partida?"
        }
        
    }
    
    @IBAction func SiSubir(_ sender: Any) {
        if perfectscore{
            //Subir datos a api
            peticionApi()
            TextoPuntuacion.text = "¿Quieres seguir jugando? (acumula mas puntos)"
        }
        else{
            TextoPuntuacion.text = "¿Quieres iniciar otra partida?"
        }
        peticionApi()
    }
    
    
    func ButtonAction(tag: Int){
        if !respuestasUser.isEmpty && respuestasUser[respuestasUser.count-1] == tag{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[tag] = false
            
            ConfirmarButton.alpha = 0
            checkboxes[tag].alpha = 0
        }
        else if !imagenSeleccionado[tag]{
            respuestasUser.append(tag)
            imagenSeleccionado[tag] = true
            checkboxes[tag].alpha = 1
            
            if respuestasUser.count == imagenesOrigen.count{
                ConfirmarButton.alpha = 1
            }
        }
    }
    
    func peticionApi(){
        

        struct Puntuacion: Codable {
            let name: String
            let score: Int
        }
        
        
        let scoresURL = URL(string: "https://qhavrvkhlbmsljgmbknr.supabase.co/rest/v1/scores?select=*")
        if let unwrappedURL = scoresURL {
            var request = URLRequest(url: unwrappedURL)
            request.addValue(apiKEY, forHTTPHeaderField: "apikey")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                // you should put in error handling code, too
                if let data = data {
                    do {
                        let arrayDatos = try JSONDecoder().decode([Puntuacion].self, from: data) as [Puntuacion]
                        // HERE'S WHERE YOUR DATA IS
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            dataTask.resume()
        }
    }
    
}
