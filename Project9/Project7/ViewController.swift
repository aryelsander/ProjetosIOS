//
//  ViewController.swift
//  Project7
//
//  Created by ARYEL SANDER DOS SANTOS on 26/11/21.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://hackingwithswift.com/samples/petitions-1.json"
        
        if let url = URL(string:urlString){
            if let data = try? Data(contentsOf: url){
                parse(json: data)
            }
        }
    }
    
    func parse(json:Data){
        let decoder = JSONDecoder()
        
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json){
            petitions = jsonPetitions.result
            tableView.reloadData()
            
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return petitions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for:indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }

}

