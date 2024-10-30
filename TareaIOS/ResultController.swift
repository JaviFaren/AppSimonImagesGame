//
//  ResultController.swift
//  TareaIOS
//
//  Created by user257494 on 30/10/2024.
//

import UIKit

class ResultController: UIViewController {
    
    var respuestasUser = [Int]()
    var imagenSeleccionado = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in imagenesOrigen{
            imagenSeleccionado.append(false)
        }
    }
    
    @IBAction func Botones(_ sender: UIButton) {
        ButtonAction(tag: sender.tag)
    }
    
    @IBAction func ConfirmButton(_ sender: Any) {
        print(respuestasUser)
    }
    
    
    func ButtonAction(tag: Int){
        if !respuestasUser.isEmpty && respuestasUser[respuestasUser.count-1] == tag{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[tag] = false
        }
        else if !imagenSeleccionado[tag]{
            respuestasUser.append(tag)
            imagenSeleccionado[tag] = true
        }
        print(imagenesOrigen[tag]!)
    }
    
    
}
