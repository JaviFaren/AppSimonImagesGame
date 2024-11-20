//
//  ViewController.swift
//  TareaIOS
//
//  Created by user257494 on 10/10/2024.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var textImage: UILabel!
    @IBOutlet weak var Imageview: UIImageView!
    
    @IBOutlet weak var botonContinuar: UIButton!
    
    
    
    
    //Botones para elegir imagenes en orden
    var numeroSeleccion = -1
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textImage.alpha = 0
        self.botonContinuar.alpha = 0
        mostrarImagenes()
    }

    //Muestra al usuario las imagenes aleatorias que correspondan en intervalos de tiempo gestionados por un temporizador
    func mostrarImagenes(){
        
        for (index, _) in imagenesOrigen.enumerated(){
            imagenesPos.append(index)
        }
        
        imagenesPos.shuffle()
        for x in imagenesPos{
            print(imagenesOrigen[x]!)
        }
        
        
        var imgpos = 0
        Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
            if imgpos <= imagenesPos.count-1{
                self.Imageview.image = imagenesOrigen[imagenesPos[imgpos]]
                self.textImage.alpha = 1
                self.textImage.text = "Imagen " + String(imgpos+1)
            }
            if imgpos == imagenesPos.count {
                timer.invalidate()
                self.botonContinuar.alpha = 1
            }
            else{
                imgpos = imgpos+1
            }
        }
    }
    
    //Una vez mostradas todas las imagenes se activa este boton para ir a la pantalla de solucion
    @IBAction func cambiarPantallaButton(_ sender: Any) {
        performSegue(withIdentifier: "SolutionScreen", sender: nil)
    }
    
    
    
}

