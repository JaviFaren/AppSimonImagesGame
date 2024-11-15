//
//  DBUploadController.swift
//  TareaIOS
//
//  Created by alumnos on 6/11/24.
//

import UIKit



class DBUploadController: UIViewController{
    
    var puntuacionsubida = false
    
    @IBOutlet weak var UsernameInput: UITextField!
    
    @IBOutlet weak var botonSubida: UIButton!
    
    @IBAction func SubirPuntos(_ sender: Any) {
        UserDefaults.standard.set("PruebaJavi", forKey: "usernamelocal")
        if finDePeticion == true && !puntuacionsubida{
            botonSubida.alpha = 0
            
            
            if let nombre = UserDefaults.standard.value(forKey: "usernamelocal")
            {
                PeticionesAPI.peticionGet(username: username) { puntuaciones in
                    print(puntuaciones)
                    
                    let Paquete = Puntuacion(name: username, score: puntuacionFinal)
                    if !puntuaciones.isEmpty{
                        PeticionesAPI.peticionPost(datos: Paquete, actualizar: true)
                    }
                    else{
                        PeticionesAPI.peticionPost(datos: Paquete, actualizar: false)
                    }
                }
            }
            else{
                username = UsernameInput.text!
                let Paquete = Puntuacion(name: username, score: puntuacionFinal)
                UserDefaults.standard.set(UsernameInput.text!, forKey: "usernamelocal")
                PeticionesAPI.peticionPost(datos: Paquete, actualizar: false)
            }
            
//
            
//            puntuacionsubida = true
//            botonSubida.titleLabel?.text = "Ir al menú"
        }
//        else if puntuacionsubida{
//            performSegue(withIdentifier: "volverMenu", sender: nil)
//        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if !username.isEmpty{
            UsernameInput.alpha = 0
        }
        botonSubida.alpha = 1
    }
    
    
    
}


