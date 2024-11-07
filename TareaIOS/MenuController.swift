//
//  MenuController.swift
//  TareaIOS
//
//  Created by alumnos on 7/11/24.
//

import UIKit

class MenuController: UIViewController{
    
    @IBOutlet weak var puntosText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPuntos()
        
    }
    
    func checkPuntos(){
        if let puntosprevios = UserDefaults.standard.value(forKey: "PuntuacionMax")
        {
            puntosText.text = "Tu puntuacion máxima es: \n" + String(describing: puntosprevios)
        }
        else {
            puntosText.text = "Tu puntuacion máxima es: \n0"
        }
    }
}
