//
//  SortPreferencias.swift
//  Heros
//
//  Created by IOS SENAC on 08/08/20.
//  Copyright © 2020 IOS SENAC. All rights reserved.
//

import Foundation
import UIKit

class SortPreferencias {
    
    let chave = "modo"
    
    func salvarModo(modo: Int) {
        // 0 -> ordem alfabética nome
        // 1 -> ordem alfabética grupo
        UserDefaults.standard.set(modo, forKey: chave)
    }
    
    func buscarModo() -> Int {
        let modo = UserDefaults.standard.integer(forKey: chave)
        return modo
    }
}
