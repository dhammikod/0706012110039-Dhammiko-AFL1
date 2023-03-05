import Foundation
//all variables declared outside of any function

//the main loop
var input = ""
var listpesanan: [(String,String,Int,Int)] = []
repeat{
    let mainmenu = """
    Welcome to UC-Walk Cafeteria //emoji
    Please choose cafeteria
    
    [1] Tuku-tuku
    [2] Gotri
    [3] Kopte
    [4] Madam Lie
    [5] EnW Sandwiches
    -
    [S]hopping cart
    [Q]uit
    """
    print(mainmenu)
    print("Your cafeteria choice? | ", terminator: "")
    //send to respective choice function
    input = readLine()!
    input = input.lowercased()
    print("")
    
    switch input {
    case "1":
        tuku()
    case "2":
        print("not yet")
        //gopte()
    case "3":
        print("not yet")
        //kopte()
    case "4":
        madamlie()
    case "5":
        print("not yet")
        //EnW()
    case "s":
        shoppingcart()
    default:
        print()
    }

} while input.caseInsensitiveCompare("q") != .orderedSame

//shoppingcart page
func shoppingcart(){
    repeat{
        if listpesanan.isEmpty{
            print("Your cart is empty")
            print("\nPress [B] to go back")
        }else{
            var ordersByRestaurant: [String: [(String, Int, Int)]] = [:]
            for item in listpesanan {
                let restaurantName = item.0
                let foodName = item.1
                let foodQuantity = item.2
                let foodPrice = item.3
                
                if ordersByRestaurant[restaurantName] == nil {
                    ordersByRestaurant[restaurantName] = []
                }
                ordersByRestaurant[restaurantName]?.append((foodName, foodQuantity, foodPrice))
            }

            for (restaurantName, orders) in ordersByRestaurant {
                print("Your order from \(restaurantName):")
                for order in orders {
                    print("- \(order.0) x \(order.1)")
                }
            }
            print("\nPress [B] to go back")
            print("Press [P] to pay/checkout")
        }
        
        input = readLine()!
        input = input.lowercased()
        
        if input == "p" && !listpesanan.isEmpty {
            //counting the price
            var totalprice = 0
            for item in listpesanan{
                totalprice += (item.3 * item.2)
            }
            print("\nYour total order : \(totalprice)")
            
            var success = true
            repeat{
                print("Enter the amount of your money")
                var input2 = readLine()!
                
                if let num = Int(input2) {
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
                        listpesanan.removeAll()
                        var success2 = true
                        repeat{
                            var asdfas = readLine()!
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


//tuku tuku page
func tuku(){
    repeat{
        let tukutuku = """
        Hi, welcome back to Tuku-Tuku!
        What would you like to order?
        [1] Tahu isi
        [2] Pop Mie
        [3] Pocari Sweat
        [4] Beng-beng large
        [5] Nasi campur
        -
        [B]ack to Main menu
        """
        print(tukutuku)
        print("Your menu choice? | ", terminator: "")
        input = readLine()!
        
        switch input {
        case "1":
            beli(nama:"Tahu isi", harga:10000, restoran: "Tuku-tuku")
        case "2":
            beli(nama:"Pop mie", harga:8000, restoran: "Tuku-tuku")
        case "3":
            beli(nama:"Pocari Sweat", harga:8000, restoran: "Tuku-tuku")
        case "4":
            beli(nama:"Beng-beng Large", harga:3000, restoran: "Tuku-tuku")
        case "5":
            beli(nama:"Nasi campur", harga:20000, restoran: "Tuku-tuku")
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

func madamlie(){
    repeat{
        let madamlie = """
        Hi, welcome back to Madam lie!
        What would you like to order?
        [1] Nasi ayam geprek
        [2] Nasi goreng jakarta
        [3] Mie goreng jakarta
        [4] Es teh manis
        [5] Ayam geprek
        -
        [B]ack to Main menu
        """
        print(madamlie)
        print("Your menu choice? | ", terminator: "")
        input = readLine()!
        
        switch input {
        case "1":
            beli(nama:"Nasi ayam geprek", harga:30000, restoran: "Madamlie")
        case "2":
            beli(nama:"Nasi goreng jakarta", harga:20000, restoran: "Madamlie")
        case "3":
            beli(nama:"Mie goreng jakarta", harga:20000, restoran: "Madamlie")
        case "4":
            beli(nama:"Es teh manis", harga:7000, restoran: "Madamlie")
        case "5":
            beli(nama:"Ayam geprek", harga:25000, restoran: "Madamlie")
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

func beli(nama: String, harga: Int, restoran:String){
    var back = true
    repeat{
        print("\n\(nama) @ \(String(harga))")
        print("How many \(nama) do you want to buy?", terminator: "")
        input = readLine()!
        
        if let num = Int(input) {
            addmakanan(nama: nama, total: num, namaresto: restoran, harga: harga)
            print("")
            back = false
        } else {
            print("Invalid input")
        }
    }while back
}


func addmakanan(nama: String, total: Int, namaresto: String, harga:Int){
    if !listpesanan.isEmpty{
        var i = 0
        var ada = false
        //search for already existing products
        for pesanan in listpesanan{
            if pesanan.0 == namaresto && pesanan.1 == nama {
                var newsum = pesanan.2 + total
                listpesanan[i].2 = newsum
                ada = true
            }
            i += 1
        }
        
        if !ada {
            listpesanan.append((namaresto, nama, total, harga))
        }
    }else{
        listpesanan.append((namaresto, nama, total, harga))
    }
}


