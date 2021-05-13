//
//  ViewController.swift
//  ConsomeJsonTest
//
//  Created by Michelle Grover on 5/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel:ViewControllerModelView? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var breweries:[Brewery]? {
        didSet {
            guard let breweries = breweries else {return}
            viewModel = ViewControllerModelView(breweries: breweries)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        APIClient.sharedInstance().taskForFetchingModelData { succeed, error, breweries in
            
            guard succeed == true else {
                print("The API request failed")
                DispatchQueue.main.async {
                    Alert.presentGenericAlertWithConfirm(control: self, title: "The API request failed", message: "Please Try Again Later.")
                }
                return
            }
            
            guard error == nil else {
                print("An error occurred: \(error?.localizedDescription)")
                return
            }
            
            self.breweries = breweries
        }
        
    }
}

// MARK:- TableViewDelegate functionality
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.fetchNumberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell = viewModel?.fetchCell(tableView: self.tableView, reuseIdentifier: "cell", indexPath: indexPath)
        
        guard let cell = cell else {
            return UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        return cell
    }
}

