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
    @IBAction func botonBandera(_ sender: Any) {
        
    }
    @IBAction func botonDemonio(_ sender: Any) {
        
    }
    @IBAction func botonFranco(_ sender: Any) {
        
    }
    @IBAction func botonNeko(_ sender: Any) {
        
    }
    
    @IBAction func botonDuolingo(_ sender: Any) {
        
    }
    @IBAction func botonMalphite(_ sender: Any) {
        
    }
    @IBAction func botonMondongo(_ sender: Any) {
        
    }
    @IBAction func botonVaporeon(_ sender: Any) {
        
    }
    @IBAction func botonConfirmacion(_ sender: Any) {
        
    }
    
    let imagenesOrigen = [UIImage(named: "demonio"),
                    UIImage(named: "duolingo"),
                    UIImage(named: "franco"),
                    UIImage(named: "banderatonga"),
                    UIImage(named: "malphite"),
                    UIImage(named: "mondongo"),
                    UIImage(named: "neko"),
                    UIImage(named: "vaporeon")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textImage.alpha = 0
        self.botonContinuar.alpha = 0
        mostrarImagenes()
    }

    func mostrarImagenes(){
        var imagenes = Array(imagenesOrigen)
        
        var imgRandom = [UIImage]()
        for _ in imagenesOrigen{
            let randNum = Int.random(in: 0..<(imagenes.count))
            imgRandom.append(imagenes[randNum]!)
            imagenes.remove(at: randNum)
        }
        
        var imgpos = 0
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            if imgpos <= imgRandom.count-1{
                self.Imageview.image = imgRandom[imgpos]
                self.textImage.alpha = 1
                self.textImage.text = "Imagen " + String(imgpos+1)
            }
            if imgpos == imgRandom.count {
                timer.invalidate()
                self.botonContinuar.alpha = 1
            }
            else{
                imgpos = imgpos+1
            }
        }
    }
    
    func seleccionIMGs(){
        
    }
}

