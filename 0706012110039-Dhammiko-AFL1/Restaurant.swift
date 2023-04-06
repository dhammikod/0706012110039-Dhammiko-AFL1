//
//  Restaurant.swift
//  0706012110039-Dhammiko-AFL1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

struct Restaurant : RestaurantAbstract{
    var nama:String
    var listmenu: [Menu]
    
    mutating func Addmenu(listmenu: [Menu]) {
        self.listmenu = listmenu
    }
    
    //fucntion to display greet user
    func Greet(){
        print("""
        Hi, welcome back to \(self.nama)!
        What would you like to order?

        """)

        //calling for display menu function
        self.displaymenu()
        
        print("""
        [B]ack to Main menu
        
        Your menu choice? |
        """, terminator: "")
    }
    
    //function to display menu
    func displaymenu(){
        var i = 1
        for menu in listmenu{
            print("[\(i)] \(menu.nama)")
            i += 1
        }
    }
}
