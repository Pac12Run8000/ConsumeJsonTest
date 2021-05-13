//
//  APIConvenience.swift
//  ConsomeJsonTest
//
//  Created by Michelle Grover on 5/12/21.
//

import Foundation

extension APIClient {
    
    func taskForFetchingModelData(completionHandler:@escaping (_ isSuccessful:Bool?, _ error:Error?,_ breweries:[Brewery]?) ->()) {
        
        APIClient.sharedInstance().taskForFetchingData { data, succeed, error in
            guard succeed == true else {
                print("There was an error on the attempt to retrieve data.")
                completionHandler(false, nil, nil)
                return
            }
            guard error == nil else {
                print("Error Occurred: \(error?.localizedDescription)")
                completionHandler(false, error, nil)
                return
            }
            guard let breweries = try? JSONDecoder().decode([Brewery].self, from: data!) else {
                completionHandler(false, error, nil)
                return
            }
            completionHandler(true, nil, breweries)
        }
        
    }
}
