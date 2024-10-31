//
//  ResultController.swift
//  TareaIOS
//
//  Created by user257494 on 30/10/2024.
//

import UIKit

var puntuacionFinal = 0

class ResultController: UIViewController {
    
    var respuestasUser = [Int]()
    var imagenSeleccionado = [Bool]()
    
    @IBOutlet weak var ConfirmarButton: UIButton!
    @IBOutlet weak var TextoPuntuacion: UILabel!
    
    @IBOutlet var checkboxes: [UIImageView]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, _) in imagenesOrigen.enumerated(){
            imagenSeleccionado.append(false)
            checkboxes[index].alpha = 0
        }
        ConfirmarButton.alpha = 0
        TextoPuntuacion.alpha = 0
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
        print(imagenesOrigen[tag]!)
    }
    
    
}
