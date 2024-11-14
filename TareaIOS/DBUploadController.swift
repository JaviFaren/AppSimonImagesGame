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
        UserDefaults.standard.set("pruebaJavi", forKey: "usernamelocal")
        if finDePeticion == true && !puntuacionsubida{
            if UsernameInput.text!.isEmpty{
                
            }
            else{
                botonSubida.alpha = 0
                username = UsernameInput.text!
                
                if let nombre = UserDefaults.standard.value(forKey: "usernamelocal")
                {
                    UserDefaults.standard.set(UsernameInput.text!, forKey: "usernamelocal")
                    PeticionesAPI.peticionGet(username: username) { puntuaciones in
                        print(puntuaciones)
                    }
                }
                else{
                    UserDefaults.standard.set(UsernameInput.text!, forKey: "usernamelocal")
                }
                
//                let Paquete = Puntuacion(name: username, score: puntuacionFinal)
//                PeticionesAPI.peticionPost(datos: Paquete)
            }
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


