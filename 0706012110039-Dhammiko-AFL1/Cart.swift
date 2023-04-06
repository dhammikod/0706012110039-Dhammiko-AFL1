//
//  Cart.swift
//  0706012110039-Dhammiko-AFL1
//
//  Created by MacBook Pro on 03/04/23.
//

import Foundation

class Cart{
    var Listpesanan: [Cart_item]
    
    init(Listpesanan: [Cart_item]) {
        self.Listpesanan = Listpesanan
    }
    
    //function to display menu when user wants to buy item
    func Beli(nama: String, harga: Int, restoran:String){
        var back = true
        repeat{
            //buy food confirmation page front end
            print("\n\(nama) @ \(String(harga))")
            print("How many \(nama) do you want to buy?", terminator: "")
            
            //reading user input
            input = readLine()!
            
            //error handling then add to list menu
            if let num = Int(input) {
                //sending data into addmakanan function
                shoppingcart.Addmakanan(nama: nama, total: num, namaresto: restoran, harga: harga)
                
                print("")
                back = false
            } else {
                print("Invalid input")
            }
        }while back
    }
    
    //function to insert user selected menu into Shoppingcart
    func Addmakanan(nama: String, total: Int, namaresto: String, harga:Int){
        if !self.Listpesanan.isEmpty{
            var i = 0
            var ada = false
            //search for already existing products
            for pesanan in self.Listpesanan{
                if pesanan.namarestoran == namaresto && pesanan.nama == nama {
                    //incrementing the already existing food value by bought number
                    self.Listpesanan[i].jumlah = pesanan.jumlah + total
                    ada = true
                }
                i += 1
            }
            
            //if statement based on the results of above for loop
            if !ada {
                //adding a new item into the arraylist
                self.Listpesanan.append(Cart_item(jumlah: total, Namaresto: namaresto, nama: nama, harga: harga))
            }
        }else{
            //adding a new item into the arraylist
            self.Listpesanan.append(Cart_item(jumlah: total, Namaresto: namaresto, nama: nama, harga: harga))
        }
    }
    
    //shoppingcart page
    func Shoppingcartmenu(){
        repeat{
            //error handling for if cart is empty
            if self.Listpesanan.isEmpty{
                print("Your cart is empty")
                print("\nPress [B] to go back")
            }else{
                //group the data into a new dictionary
                var ordersByRestaurant: [String: [(String, Int, Int)]] = [:]
                for item in self.Listpesanan {
                    let restaurantName = item.namarestoran
                    let foodName = item.nama
                    let foodQuantity = item.jumlah
                    let foodPrice = item.harga
                    
                    if ordersByRestaurant[restaurantName] == nil {
                        //creating a new key in the dictionary
                        ordersByRestaurant[restaurantName] = []
                    }
                    //adding the food item into the dictionary
                    ordersByRestaurant[restaurantName]?.append((foodName, foodQuantity, foodPrice))
                }

                //printing all the values in the dictionary
                for (restaurantName, orders) in ordersByRestaurant {
                    print("Your order from \(restaurantName):")
                    for order in orders {
                        print("- \(order.0) x \(order.1)")
                    }
                }
                print("\nPress [B] to go back")
                print("Press [P] to pay/checkout")
            }
            
            //reading user input
            input = readLine()!
            input = input.lowercased()
            
            if input == "p" && !shoppingcart.Listpesanan.isEmpty {
                //counting the price
                var totalprice = 0
                for item in self.Listpesanan{
                    totalprice += (item.harga * item.jumlah)
                }
                print("\nYour total order : \(totalprice)")
                
                var success = true
                //this repeat is for error handling invalid input
                repeat{
                    print("Enter the amount of your money")
                    let input2 = readLine()!
                    //reading user input
                    
                    //error handling for converting string into integer
                    if let num = Int(input2) {
                        //error handling for each wrong input case
                        if num < 0 {
                            print("please enter a valid amount\n")
                        }else if num == 0{
                            print("Payment cant be zero\n")
                        }else if num < totalprice{
                            print("Payment is less than total price (\(totalprice))\n")
                        }else{
                            success = false
                            print("Your total order : \(totalprice)")
                            print("You pay : \(num) Change : \(num - totalprice)")
                            
                            print("\nEnjoy your meals")
                            print("\nPress [Return] to go back to main screen")
                            input = "b"
                            
                            //removing paid food
                            shoppingcart.Listpesanan.removeAll()
                            var success2 = true
                            repeat{
                                _ = readLine()!
                                success2 = false
                            }while success2
                            print("")
                        }
                    } else {
                        print("Please enter a valid amount")
                    }
                }while success
            }
        } while input.caseInsensitiveCompare("b") != .orderedSame
    }
}
