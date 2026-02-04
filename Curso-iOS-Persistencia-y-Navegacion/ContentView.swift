//
//  ContentView.swift
//  Curso-iOS-Persistencia-y-Navegacion
//
//  Created by Equipo 2 on 4/2/26.
//

import SwiftUI

// Podemos definir constantes para las claves (ej. en guardarFechaLogin())
enum ClavesStorage {
    static let ultimoLogin = "ultimo_login"
}

// Idem a lo anterior, pero con un acceso más abreviado a la constante
// Ejemplo en cargarFechaLogin()
extension String {
    static let ultimoLogin = "ultimo_login"
}

struct ContentView: View {

    @AppStorage("usuario") private var nombreUsuario = "Invitado"
    @AppStorage("musicaActivada") private var musicaActivada: Bool = false
    
    @State private var ultimaFechaLogin = "Nunca"
    
    var body: some View {
        Form {
            Section("Datos de usuario (persistentes)") {
                // Persiste el valor automáticamente al modificarlo
                TextField("Tu nombre", text: $nombreUsuario)
                Toggle("Música activada", isOn: $musicaActivada)
            }
            
            Section("Hora de acceso/registro") {
                Text("Último acceso: \(ultimaFechaLogin)")
                
                Button("Guardar fecha de login") {
                    guardarFechaLogin()
                }
                
                Button("Borrar nuestro rastro de login") {
                    borrarFechaLogin()
                }
            }
        }
        .onAppear {
            cargarFechaLogin()
        }
    }
    
    func guardarFechaLogin() {
        let fechaFormateada: String = Date().formatted(date: .abbreviated, time: .standard)
        // Guardamos en UserDefaults
        UserDefaults.standard.set(fechaFormateada, forKey: ClavesStorage.ultimoLogin)
        
        ultimaFechaLogin = fechaFormateada
    }
    
    func cargarFechaLogin() {
        if let fechaLogin = UserDefaults.standard.string(forKey: .ultimoLogin) {
            ultimaFechaLogin = fechaLogin
        }
    }
    
    func borrarFechaLogin() {
        UserDefaults.standard.removeObject(forKey: "ultimo_login")
        ultimaFechaLogin = "Borrado registro de login"
    }
}

#Preview {
    ContentView()
}
