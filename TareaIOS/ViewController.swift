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
    
    @objc func timerFired() {
          print("Timer Called with interval 30seconds")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mostrarImagenes()
    }

    func mostrarImagenes(){
        let imagenes = [UIImage(named: "demonio"),
                        UIImage(named: "duolingo"),
                        UIImage(named: "franco"),
                        UIImage(named: "banderatonga"),
                        UIImage(named: "malphite"),
                        UIImage(named: "mondongo"),
                        UIImage(named: "neko"),
                        UIImage(named: "vaporeon")]
        var imgpos = 0
        let temporizador = Timer.init(timeInterval: 3, repeats: true) { [self] (timer) in
            print(imgpos)
            Imageview.image = imagenes[imgpos]
            textImage.text = "Imagen " + String(imgpos)
            if imgpos == imagenes.count-1 {
                timer.invalidate()
                print("invalidado")
            }
            imgpos = imgpos+1
            
        }
        
        temporizador.fire()
    }
}

