//
//  BreweryModel.swift
//  ConsomeJsonTest
//
//  Created by Michelle Grover on 5/12/21.
//

import Foundation

struct Brewery:Decodable {
    var name:String?
    var street:String?
    var address_2:String?
    var city:String?
    var state:String?
    var postal_code:String?
    var phone:String?
}
