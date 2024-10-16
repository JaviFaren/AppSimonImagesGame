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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
        for x in 0...imagenes.count{
            Imageview.image = imagenes[x]
            textImage.text = "Imagen " + String(x)
            sleep(4)
        }
    }
}

