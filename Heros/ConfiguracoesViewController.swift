//
//  ConfiguracoesViewController.swift
//  Heros
//
//  Created by IOS SENAC on 08/08/20.
//  Copyright © 2020 IOS SENAC. All rights reserved.
//

import UIKit

class ConfiguracoesViewController: UIViewController {

    @IBOutlet weak var nomeSwitch: UISwitch!
    
    @IBOutlet weak var grupoSwitch: UISwitch!
    
    var sort: SortPreferencias!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sort = SortPreferencias()
        let modo = sort.buscarModo()
        confSwitches(modo: modo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func confSwitches(modo: Int) {
        switch modo {
        case 0:
            nomeSwitch.setOn(true, animated: true)
            grupoSwitch.setOn(false, animated: true)
            break
        case 1:
            nomeSwitch.setOn(false, animated: true)
            grupoSwitch.setOn(true, animated: true)
            break
        default:
            nomeSwitch.setOn(false, animated: true)
            grupoSwitch.setOn(false, animated: true)
            break
        }
    }
    
    @IBAction func alterarOrdenacaoNome(_ sender: Any) {
        self.sort.salvarModo(modo: 0)
        self.confSwitches(modo: 0)
    }
    
    @IBAction func alterarOrdenacaoGrupo(_ sender: Any) {
        self.sort.salvarModo(modo: 1)
        self.confSwitches(modo: 1)
    }
}
