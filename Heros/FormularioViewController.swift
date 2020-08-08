//
//  ViewController.swift
//  Heros
//
//  Created by IOS SENAC on 08/08/20.
//  Copyright © 2020 IOS SENAC. All rights reserved.
//

import UIKit
import CoreData

class FormularioViewController: UIViewController {
    
    var context: NSManagedObjectContext!
    
    @IBOutlet weak var txtNome: UITextField!
    
    @IBOutlet weak var txtGrupo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func salvarHeroi(_ sender: Any) {
        if let nome = txtNome.text {
            if !nome.isEmpty {
                if let grupo = txtGrupo.text {
                    if !grupo.isEmpty {
                        salvar(nome: nome, grupo: grupo)
                    }
                }
            }
        }
    }
    
    func salvar(nome: String, grupo: String) {
        let heroi = NSEntityDescription.insertNewObject(forEntityName: "Heroi", into: self.context)
        heroi.setValue(nome, forKey: "nome")
        heroi.setValue(grupo, forKey: "grupo")
        do {
            try context.save()
        } catch {
            print("Erro ao salvar herói")
        }
        txtNome.text = ""
        txtGrupo.text = ""
    }
    
}

