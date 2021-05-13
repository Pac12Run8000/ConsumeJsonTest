//
//  APIClient.swift
//  ConsomeJsonTest
//
//  Created by Michelle Grover on 5/12/21.
//

import Foundation



class APIClient: NSObject {
    
    
    
    var session = URLSession.shared
    func taskForFetchingData(completionHandler:@escaping (_ data:Data?, _ success:Bool?, _ error:Error?) -> ()) {
        
        let urlString:String = "https://api.openbrewerydb.org/breweries".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        var urlRequest = URLRequest(url: URL(string: urlString)!)
        urlRequest.httpMethod = "GET"
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                print("error on request:\(String(describing: error?.localizedDescription))")
                completionHandler(nil, false, error)
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 200 && statusCode <= 299 else {
                print("StatusCode is out of acceptable range.")
                completionHandler(nil, false, error)
                return
            }
            
            completionHandler(data, true, nil)
        }
        task.resume()
    }
}

extension APIClient {
    class func sharedInstance() -> APIClient {
        struct Singleton {
            static var sharedInstance = APIClient()
        }
        return Singleton.sharedInstance
    }
}
