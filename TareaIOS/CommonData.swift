//
//  CommonData.swift
//  TareaIOS
//
//  Created by alumnos on 13/11/24.
//

import UIKit

//Datos de View Controller
let imagenesOrigen = [UIImage(named: "banderatonga"),
                UIImage(named: "duolingo"),
                UIImage(named: "demonio"),
                UIImage(named: "malphite"),
                UIImage(named: "franco"),
                UIImage(named: "mondongo"),
                UIImage(named: "neko"),
                UIImage(named: "vaporeon")]

var imagenesPos = [Int]()

//Datos de Result Controller
var puntuacionFinal = 0
var perfectscore = false

//Datos para peticiones de API
let apiKEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFoYXZydmtobGJtc2xqZ21ia25yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDA3MjY5MTgsImV4cCI6MjAxNjMwMjkxOH0.Ta-_lXGGwSiUGh0VC8tAFcFQqsqAvB8vvXJjubeQkx8"
let APIURL = "https://qhavrvkhlbmsljgmbknr.supabase.co/rest/v1/scores"



struct Puntuacion: Codable {
    let name: String
    let score: Int
}

var arrayAPI = [Puntuacion]()

var finDePeticion = true

var tiene_datosAPI = false

var contenidosMarcadores = [String]()

//Variables usadas para subir datos a la api (se sobreescriben si existen valores almacenados localmente)
var username = ""
var puntosFinales = "0"


