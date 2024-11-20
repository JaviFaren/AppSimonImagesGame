//
//  MarcadoresController.swift
//  TareaIOS
//
//  Created by alumnos on 20/11/24.
//

import UIKit

class MarcadoresController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var TablaMarcadores: UITableView!
    
    override func viewDidLoad() {
        TablaMarcadores.delegate = self
        TablaMarcadores.dataSource = self
        
        
    }
    
    //Muestra todas las puntuaciones de los usuarios almacenados en la api (los datos se recogen en la pantalla del menu antes de poder acceder a esta pantalla)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contenidosMarcadores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = contenidosMarcadores[indexPath.row]
        return cell
    }
    
    
    @IBAction func volverButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
}
