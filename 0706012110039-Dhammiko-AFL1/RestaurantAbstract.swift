//
//  RestaurantAbstract.swift
//  0706012110039-Dhammiko-AFL1
//
//  Created by MacBook Pro on 06/04/23.
//

import Foundation

protocol RestaurantAbstract {
    var nama:String {get}
    var listmenu: [Menu] {get}
    
    //function to append list of menu to restaurant
    mutating func Addmenu(listmenu: [Menu])
    
    //function to greet user
    mutating func Greet()
}
