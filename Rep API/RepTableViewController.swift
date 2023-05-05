//
//  RepTableViewController.swift
//  Rep API
//
//  Created by David Granger on 4/24/23.
//

import UIKit

extension RepTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchBar.text = searchText.capitalized
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        refreshRepresentativesArray()
        searchBar.resignFirstResponder()
    }
}

class RepTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var representativesArray: [Representative] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func refreshRepresentativesArray() {
        
        let searchTerm = searchBar.text ?? "UT"
        
        let query: [String: String] = [
            "state": "\(searchTerm)",
            "output": "json"
            ]
        
        if !searchTerm.isEmpty {
            Task {
                do {
                    let fetchedItems = try await RepAPIController.fetchItems(matching: query)
                    DispatchQueue.main.async {
                        self.representativesArray = fetchedItems
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Error fetching items: \(error)")
                }
            }
        }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return representativesArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repIdentifier", for: indexPath) as! RepTableViewCell
        
        let representative = representativesArray[indexPath.row]

        cell.nameLBL.text = representative.name
        cell.linkLBL.text = representative.link
        cell.officeLBL.text = representative.office
        cell.partyLBL.text = representative.party
        cell.phoneLBL.text = representative.phone
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
