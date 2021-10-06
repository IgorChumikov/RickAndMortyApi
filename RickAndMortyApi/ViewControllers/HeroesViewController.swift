//
//  HeroesViewController.swift
//  RickAndMortyApi
//
//  Created by Игорь Чумиков on 26.09.2021.
//

import UIKit

class HeroesViewController: UITableViewController {
    
    //MARK: Private properties
    private let url = "https://rickandmortyapi.com/api/character"
    private var character: Character?
    
    // MARK: - UIViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Rick & Morty"
        tableView.rowHeight = 100
        fetchData(from: url)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return character?.results.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroTableViewCell
        let results = character?.results[indexPath.row]
        cell.configure(with: results)
        return cell
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let character = character?.results[indexPath.row]
        let detailVC = segue.destination as! CharacterDetailsViewController
        detailVC.character = character
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { result in
            self.character = result
            self.tableView.reloadData()
        }
    }
}

