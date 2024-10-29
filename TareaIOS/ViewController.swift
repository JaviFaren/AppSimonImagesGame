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
    
    let imagenesOrigen = [UIImage(named: "demonio"),
                    UIImage(named: "duolingo"),
                    UIImage(named: "franco"),
                    UIImage(named: "banderatonga"),
                    UIImage(named: "malphite"),
                    UIImage(named: "mondongo"),
                    UIImage(named: "neko"),
                    UIImage(named: "vaporeon")]
    
    var imagenSeleccionado = [Bool]()
    var lastImage = [Int]()
    
    var respuestasUser = [Int]()
    

    @IBAction func DemonioButton(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 0{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[0] = false
        }
        else if !imagenSeleccionado[0]{
            respuestasUser.append(0)
            imagenSeleccionado[0] = true
            lastImage[0] = 0
        }
        print("demonio")
    }
    
    @IBAction func botonDuolingo(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 1{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[1] = false
        }
        else if !imagenSeleccionado[1]{
            respuestasUser.append(1)
            imagenSeleccionado[1] = true
            lastImage[1] = 1
        }
    }
    @IBAction func botonFranco(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 2{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[2] = false
        }
        else if !imagenSeleccionado[2]{
            respuestasUser.append(2)
            imagenSeleccionado[2] = true
            lastImage[2] = 2
        }
    }
    @IBAction func botonBandera(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 3{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[3] = false
        }
        else if !imagenSeleccionado[3]{
            respuestasUser.append(3)
            imagenSeleccionado[3] = true
            lastImage[3] = 3
        }
    }
    @IBAction func botonMalphite(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 4{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[4] = false
        }
        else if !imagenSeleccionado[4]{
            respuestasUser.append(4)
            imagenSeleccionado[4] = true
            lastImage[4] = 4
        }
    }
    @IBAction func botonMondongo(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 5{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[5] = false
        }
        else if !imagenSeleccionado[5]{
            respuestasUser.append(5)
            imagenSeleccionado[5] = true
            lastImage[5] = 5
        }
    }
    @IBAction func botonNeko(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 6{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[6] = false
        }
        else if !imagenSeleccionado[6]{
            respuestasUser.append(6)
            imagenSeleccionado[6] = true
            lastImage[6] = 6
        }
    }
    @IBAction func botonVaporeon(_ sender: Any) {
        if !lastImage.isEmpty && lastImage[lastImage.count-1] == 7{
            respuestasUser.remove(at: respuestasUser.count-1)
            imagenSeleccionado[7] = false
        }
        else if !imagenSeleccionado[7]{
            respuestasUser.append(7)
            imagenSeleccionado[7] = true
            lastImage[7] = 7
        }
    }

    
    @IBAction func botonConfirmacion(_ sender: Any) {
        print(imagenSeleccionado)
        print(respuestasUser)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textImage.alpha = 0
        self.botonContinuar.alpha = 0
        for _ in imagenesOrigen{
            imagenSeleccionado.append(false)
        }
        mostrarImagenes()
    }

    func mostrarImagenes(){
        var imagenesPos = [Int]()
        for (index, _) in imagenesOrigen.enumerated(){
            imagenesPos.append(index)
        }
        
        imagenesPos.shuffle()
        
        
        var imgpos = 0
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (timer) in
            if imgpos <= imagenesPos.count-1{
                self.Imageview.image = self.imagenesOrigen[imagenesPos[imgpos]]
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
    
    func seleccionIMGs(){
        
    }
}

