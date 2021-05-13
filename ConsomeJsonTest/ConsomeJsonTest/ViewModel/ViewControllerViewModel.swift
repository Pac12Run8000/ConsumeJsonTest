//
//  ViewControllerViewModel.swift
//  ConsomeJsonTest
//
//  Created by Michelle Grover on 5/12/21.
//

import UIKit

struct ViewControllerModelView {
    
    var breweries:[Brewery]?
    
    init(breweries:[Brewery]?) {
        self.breweries = breweries
    }
    
    
    public func fetchNumberOfRowsInSection() -> Int {
        guard let count = self.breweries?.count else {
            return 0
        }
        return count
    }
    
    
    public func fetchCell(tableView:UITableView,reuseIdentifier:String, indexPath:IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? UITableViewCell else {
            return UITableViewCell(style: .default, reuseIdentifier: reuseIdentifier)
        }
        
        cell.textLabel?.text = "name: \(self.breweries![indexPath.row].name ?? "No-name")"
        cell.detailTextLabel?.text = "address: \(self.breweries![indexPath.row].street ?? "") \(self.breweries![indexPath.row].address_2 ?? "") \(self.breweries![indexPath.row].city ?? "") \(self.breweries![indexPath.row].state ?? ""), \(self.breweries![indexPath.row].postal_code ?? "")"
        return cell
    }
    
    
}
