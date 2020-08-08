//
//  HeroisTableViewController.swift
//  Heros
//
//  Created by IOS SENAC on 08/08/20.
//  Copyright © 2020 IOS SENAC. All rights reserved.
//

import UIKit
import CoreData

class HeroisTableViewController: UITableViewController {
    
    var herois: [NSManagedObject] = []
    var context: NSManagedObjectContext!
    var sort: SortPreferencias!

    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        self.sort = SortPreferencias()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atualizarLista()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return herois.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroiCelula", for: indexPath) as! HeroiTableViewCell

        let heroi = herois[indexPath.row] as NSManagedObject
       
        cell.lblNome.text = heroi.value(forKey: "nome") as? String
        cell.lblGrupo.text = heroi.value(forKey: "grupo") as? String

        return cell
    }
 
    func atualizarLista() {
        let sortAZ = buscarModoDeOrdenacao()
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Heroi")
        requisicao.sortDescriptors = [sortAZ]
        do {
            self.herois = try self.context.fetch(requisicao) as! [NSManagedObject]
            tableView.reloadData()
        } catch {
            print("Erro ao listar heróis")
        }
    }
    
    func buscarModoDeOrdenacao() -> NSSortDescriptor {
        let modo = self.sort.buscarModo()
        if modo == 0 {
            return NSSortDescriptor(key: "nome", ascending: true)
        } else {
            return NSSortDescriptor(key: "grupo", ascending: true)
        }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
