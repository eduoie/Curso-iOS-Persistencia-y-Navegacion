//
//  PersistirJSONAvanzado.swift
//  Curso-iOS-Persistencia-y-Navegacion
//
//  Created by Equipo 2 on 5/2/26.
//

import SwiftUI

struct Persona: Codable {
    let nombre: String
    let edad: Int
    let email: String
}

let jsonString = """
{
    "nombre": "Pepe",
    "edad": 55,
    "email": "pepe@pepe.com"
}
"""

let jsonArray = """
[
    {
        "nombre": "Pepe",
        "edad": 55,
        "email": "pepe@pepe.com"
    },
    {
        "nombre": "María",
        "edad": 47,
        "email": "Maria@maria.com"    
    }
]
    
"""

struct Libro: Codable {
    let titulo: String
    let publicacion: Int?
}

struct Autor: Codable {
    let nombre: String
    let nacionalidad: String
    let libros: [Libro]
}

let jsonAutor = """
{
    "nombre": "Stephen King",
    "nacionalidad": "USA",
    "libros": [
        {
            "titulo": "Misery"
        },
        {
            "titulo": "It",
            "publicacion": 1990
        }
    ]
}    
"""


struct PersistirJSONAvanzado: View {
    var body: some View {
        Text("Hola")
            .onAppear {
                pruebasJSON()
            }
    }
    
    func pruebasJSON() {
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let persona = try JSONDecoder().decode(Persona.self, from: jsonData)
                print(persona)
            } catch {
                print("Error al decodificar: \(error)")
            }
        }
        
        if let jsonData = jsonArray.data(using: .utf8) {
            do {
                let personas: [Persona] = try JSONDecoder().decode([Persona].self, from: jsonData)
                print(personas)
            } catch {
                print("Error al decodificar: \(error)")
            }
        }
        
        if let jsonData = jsonAutor.data(using: .utf8) {
            do {
                let autor = try JSONDecoder().decode(Autor.self, from: jsonData)
                print(autor)
            } catch {
                print("Error al decodificar: \(error)")
            }
        }
    }
}

#Preview {
    PersistirJSONAvanzado()
}
