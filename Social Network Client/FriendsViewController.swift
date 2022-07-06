//
//  FriendsViewController.swift
//  Social Network Client
//
//  Created by Artem Stetsenko on 27.06.2022.
//

import UIKit

class FriendsViewController: UIViewController {
    
    @IBOutlet weak var friendsTableVC: UITableView!
    
    let reuseCellIdentifier = "reuseCellIdentifier"
    
    let dataArrayFriends = [Friends(name: "Steve", city: "New York", photo: UIImage(named: "steveJobs0")),
                            Friends(name: "Paul", city: "Dallas", photo: UIImage(named: "steveJobs1")),
                            Friends(name: "Liza", city: "Palo Alto", photo: UIImage(named: "steveJobs2")),
                            Friends(name: "Brian", city: "Ostin", photo: UIImage(named: "steveJobs3"))]
    
    var filteredData = [Friends]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // setting up search bar
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Start typing"
        navigationItem.searchController = searchController
        definesPresentationContext = false
        
        // registering reusable cell
        friendsTableVC.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: reuseCellIdentifier)
        friendsTableVC.dataSource = self
        friendsTableVC.delegate = self
        
        
      
        
    
    }
    
    // possibilities to edit or delete row
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }

  

}
extension FriendsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
                return filteredData.count
            }
        return dataArrayFriends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseCellIdentifier, for: indexPath) as! TableViewCell
        
        let data: Friends
        
        if isFiltering {
            data = filteredData[indexPath.row]
        } else {
            data = dataArrayFriends[indexPath.row]
        }
        
        cell.configureCell(photo: data.photo, nameLabel: data.name, cityLabel: data.city)
        return cell
    }
    // returns height of cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
   
    // func that open image in new VC for full screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let fullScreenView = UIView(frame: self.view.bounds)
        let fullScreenImageView = UIImageView(frame: fullScreenView.frame)
       fullScreenView.addSubview(fullScreenImageView)
        let image = dataArrayFriends[indexPath.row].photo
       fullScreenImageView.image = image
       self.view.addSubview(fullScreenView)
       
        // tap to close view
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
       fullScreenView.addGestureRecognizer(tap)
   }
   @objc func onTap(_ recognizer: UITapGestureRecognizer) {
      
       guard let targetView = recognizer.view else {return}
       targetView.removeFromSuperview()
   }
    
   
    
    
}
extension FriendsViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredData = dataArrayFriends.filter({ (search: Friends) -> Bool in
            return search.name.lowercased().contains(searchText.lowercased())
        })
        friendsTableVC.reloadData()
    }
}
