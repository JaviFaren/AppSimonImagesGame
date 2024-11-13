//
//  DBUploadController.swift
//  TareaIOS
//
//  Created by alumnos on 6/11/24.
//

import UIKit



class DBUploadController: UIViewController{
    
    
    @IBOutlet weak var UsernameInput: UITextField!
    @IBAction func SubirPuntos(_ sender: Any) {
        if UsernameInput.text!.isEmpty{
            
        }
        else{
            let Paquete = Puntuacion(name: "PruebaJavi", score: 1999)
            PeticionesAPI().peticionPost(datos: Paquete)
        }
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
    }
    
    
}


