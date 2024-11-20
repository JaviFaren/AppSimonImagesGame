//
//  MenuController.swift
//  TareaIOS
//
//  Created by alumnos on 7/11/24.
//

import UIKit

class MenuController: UIViewController{
    
    @IBOutlet weak var puntosText: UILabel!
    
    var puedeProceder = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Esto resetea nombre y puntuacion del usuario
        //UserDefaults.standard.set(nil, forKey: "usernamelocal")
        //UserDefaults.standard.set(nil, forKey: "PuntuacionMax")
        
        checkUsername()
        
        checkPuntos()
        
        PeticionesAPI.peticionGet(username: "") { puntuaciones in
            contenidosMarcadores.removeAll()
            for x in puntuaciones{
                let contenido = x.name + ": " + String(x.score) + " puntos"
                contenidosMarcadores.append(contenido)
            }
            self.puedeProceder = true
        }
    }
    
    func checkPuntos(){
        if let puntosprevios = UserDefaults.standard.value(forKey: "PuntuacionMax")
        {
            puntosFinales = String(describing: puntosprevios)
            print("puntos: ",puntosFinales)
            puntosText.text = "Tu puntuacion máxima es: \n" + String(describing: puntosprevios)
        }
        else {
            puntosText.text = "Tu puntuacion máxima es: \n0"
        }
        
    }
    
    func checkUsername(){
        if let nombre = UserDefaults.standard.value(forKey: "usernamelocal")
        {
            username = String(describing: nombre)
            puntosText.text = "Bienvenido " + username + "!\n" + puntosText.text!
            print("nombre: ",username)
        }
    }
    
    @IBAction func IrMarcadores(_ sender: Any) {
        if puedeProceder{
            performSegue(withIdentifier: "IrMarcadores", sender: nil)
        }
    }
    
    
}
