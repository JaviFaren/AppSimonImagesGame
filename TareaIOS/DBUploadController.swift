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
        if finDePeticion == true && !puntuacionsubida{
            
            
            if !username.isEmpty{
                PeticionesAPI.peticionGet(username: username) { puntuaciones in
                    print("Puntuacioncitas: ",puntuaciones)
                    
                    let Paquete = Puntuacion(name: username, score: Int(puntosFinales)!)
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
                UserDefaults.standard.set(username, forKey: "usernamelocal")
                UserDefaults.standard.set(puntosFinales, forKey: "PuntuacionMax")
                PeticionesAPI.peticionPost(datos: Paquete, actualizar: false)
            }
             
            puntuacionsubida = true
            botonSubida.setTitle("Ir al Menu", for: .normal)
        }
        else if puntuacionsubida{
            performSegue(withIdentifier: "volverMenu", sender: nil)
        }
        
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        if !username.isEmpty{
            UsernameInput.alpha = 0
        }
        else{
            UsernameInput.alpha = 1
        }
        botonSubida.alpha = 1
    }
    
    
    
}


