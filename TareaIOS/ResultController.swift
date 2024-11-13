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
    
    @IBOutlet weak var ConfirmarButton: UIButton!
    @IBOutlet weak var TextoPuntuacion: UILabel!
    
    @IBOutlet weak var BotonMarcadoresNo: UIButton!
    @IBOutlet weak var BotonMarcadoresSi: UIButton!
    
    @IBOutlet var checkboxes: [UIImageView]!
    
    var LeaveButtonState = 0
    var KeepPoints = false
    
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
        LeaveButtonState = 0

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
        
        puntuacionFinal = puntuacionFinal + (125 * streak)
        TextoPuntuacion.text = "Has acertado " + String(streak) + " de " + String(imagenesPos.count) + "\nTu puntuación es de: " + String(puntuacionFinal)
        TextoPuntuacion.alpha = 1
        
        if(streak == respuestasUser.count-1){
            perfectscore = true
        }
        else{
            perfectscore = false
        }
        BotonMarcadoresNo.alpha = 1
        BotonMarcadoresSi.alpha = 1
        if let puntosAlm = UserDefaults.standard.value(forKey: "PuntuacionMax")
        {
            if puntuacionFinal > puntosAlm as! Int{
                TextoPuntuacion.text = TextoPuntuacion.text! + "\nNuevo Record! ¿Quieres subirlo a marcadores?"
            }
            else{
                TextoPuntuacion.text = TextoPuntuacion.text! + "\n¿Quieres volver a intentarlo?"
                LeaveButtonState = 1
            }
        }
        else {
            if puntuacionFinal > 0{
                TextoPuntuacion.text = TextoPuntuacion.text! + "\nNuevo Record! ¿Quieres subirlo a marcadores?"
                
            }
            else{
                TextoPuntuacion.text = TextoPuntuacion.text! + "\n¿Quieres volver a intentarlo?"
                LeaveButtonState = 1
            }
        }
        
        ConfirmarButton.alpha = 0
    }
    
    @IBAction func NoSubir(_ sender: Any) {
        if LeaveButtonState == 0{
            if perfectscore{
                TextoPuntuacion.text = "¿Quieres seguir jugando? (acumula mas puntos)"
                KeepPoints = true
                LeaveButtonState = 1
            }
            else{
                TextoPuntuacion.text = "¿Quieres iniciar otra partida?"
                LeaveButtonState = 1
            }
        }
        else{
            imagenesPos.removeAll()
            performSegue(withIdentifier: "ToMainMenu", sender: nil)
        }
        
        
    }
    
    @IBAction func SiSubir(_ sender: Any) {
        if LeaveButtonState == 0{
            performSegue(withIdentifier: "Subirdatos", sender: nil)
        }
        else{
            imagenesPos.removeAll()
            if !KeepPoints{
                puntuacionFinal = 0
            }
            performSegue(withIdentifier: "ReturnToGame", sender: nil)
        }
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
    
    
    
}
