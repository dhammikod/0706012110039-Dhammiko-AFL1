import Foundation
//all variables declared outside of any function
//objects
class Menu {
    var nama: String
    var harga: Int
    
    init(nama: String, harga: Int) {
        self.nama = nama
        self.harga = harga
    }
}

class Restaurant {
    var Nama:String
    var Listmenu: [Menu]
    
    init(Name: String, Listmenu: [Menu]) {
        self.Nama = Name
        self.Listmenu = Listmenu
    }
    
    func Greet(){
        print("""
        Hi, welcome back to \(self.Nama)!
        What would you like to order?
        
        \(self.displaymenu())
        -
                
        [B]ack to Main menu
        
        Your menu choice? |
        """, terminator: "")
    }
    
    func displaymenu(){
        var i = 1
        for menu in Listmenu{
            print("[\(i)] \(menu.nama)")
            i += 1
        }
    }
}

class Orderedmenu{
    var Jumlah: Int
    var Namamenu: String
    var Namarestiran: String
    var Hargamenu:Int
    
    init(Jumlah: Int, Namamenu: String, Namarestiran: String, Hargamenu: Int) {
        self.Jumlah = Jumlah
        self.Namamenu = Namamenu
        self.Namarestiran = Namarestiran
        self.Hargamenu = Hargamenu
    }
}

class Cart{
    var Listpesanan: [Orderedmenu]
    
    init(Listpesanan: [Orderedmenu]) {
        self.Listpesanan = Listpesanan
    }
}



//the main loop
var input = ""
var listpesanan: [(String,String,Int,Int)] = []
var pesanans: Cart = Cart(Listpesanan: [])

repeat{
    //main menu front end
    let mainmenu = """
    Welcome to UC-Walk Cafeteria 🤩
    Please choose cafeteria
    
    [1] Tuku-tuku
    [2] Gotri
    [3] Raburi
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
        gotri()
    case "3":
        raburi()
    case "4":
        madamlie()
    case "5":
        EnW()
    case "s":
        shoppingcart()
    default:
        print()
    }

} while input.caseInsensitiveCompare("q") != .orderedSame

//shoppingcart page
func shoppingcart(){
    repeat{
        //error handling for if cart is empty
//        if listpesanan.isEmpty{
//            print("Your cart is empty")
//            print("\nPress [B] to go back")
//        }else{
//            //group the data into a new dictionary
//            var ordersByRestaurant: [String: [(String, Int, Int)]] = [:]
//            for item in listpesanan {
//                let restaurantName = item.0
//                let foodName = item.1
//                let foodQuantity = item.2
//                let foodPrice = item.3
//
//                if ordersByRestaurant[restaurantName] == nil {
//                    //creating a new key in the dictionary
//                    ordersByRestaurant[restaurantName] = []
//                }
//                //adding the food item into the dictionary
//                ordersByRestaurant[restaurantName]?.append((foodName, foodQuantity, foodPrice))
//            }
//
//            //printing all the values in the dictionary
//            for (restaurantName, orders) in ordersByRestaurant {
//                print("Your order from \(restaurantName):")
//                for order in orders {
//                    print("- \(order.0) x \(order.1)")
//                }
//            }
//            print("\nPress [B] to go back")
//            print("Press [P] to pay/checkout")
//        }
        
        if pesanans.Listpesanan.isEmpty{
            print("Your cart is empty")
            print("\nPress [B] to go back")
        }else{
            //group the data into a new dictionary
            var ordersByRestaurant: [String: [(String, Int, Int)]] = [:]
            for item in pesanans.Listpesanan {
                let restaurantName = item.Namarestiran
                let foodName = item.Namamenu
                let foodQuantity = item.Jumlah
                let foodPrice = item.Hargamenu
                
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
        
        if input == "p" && !pesanans.Listpesanan.isEmpty {
            //counting the price
            var totalprice = 0
            for item in pesanans.Listpesanan{
                totalprice += (item.Hargamenu * item.Jumlah)
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
        var menu : [Menu] = []
        menu.append(Menu(nama: "Tahu isi", harga: 10000))
        menu.append(Menu(nama: "Pop Mie", harga: 8000))
        menu.append(Menu(nama: "Pocari Sweat", harga: 8000))
        menu.append(Menu(nama: "Beng-beng Large", harga: 3000))
        menu.append(Menu(nama: "Nasi campur", harga: 20000))

        
        var tuku_tuku = Restaurant(Name: "Tuku-tuku", Listmenu: menu)
        
        tuku_tuku.Greet()
        //tuku-tuku menu front end
//        let tukutuku = """
//        Hi, welcome back to Tuku-Tuku!
//        What would you like to order?
//        [1] Tahu isi
//        [2] Pop Mie
//        [3] Pocari Sweat
//        [4] Beng-beng large
//        [5] Nasi campur
//        -
//        [B]ack to Main menu
//        """
//        print(tukutuku)
//
//        //read user input
//        print("Your menu choice? | ", terminator: "")
        input = readLine()!
        
        //send to function which adds food into variable list pesanan
        switch input {
        case "1":
            beli(nama: tuku_tuku.Listmenu[0].nama, harga: tuku_tuku.Listmenu[0].harga, restoran: tuku_tuku.Nama)
        case "2":
            beli(nama: tuku_tuku.Listmenu[1].nama, harga: tuku_tuku.Listmenu[1].harga, restoran: tuku_tuku.Nama)
        case "3":
            beli(nama: tuku_tuku.Listmenu[2].nama, harga: tuku_tuku.Listmenu[2].harga, restoran: tuku_tuku.Nama)
        case "4":
            beli(nama: tuku_tuku.Listmenu[3].nama, harga: tuku_tuku.Listmenu[3].harga, restoran: tuku_tuku.Nama)
        case "5":
            beli(nama: tuku_tuku.Listmenu[4].nama, harga: tuku_tuku.Listmenu[4].harga, restoran: tuku_tuku.Nama)
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

//Gotri
func gotri(){
    repeat{
        //gotri menu front end
        var menu : [Menu] = []
        menu.append(Menu(nama: "Nasi goreng seafood", harga: 30000))
        menu.append(Menu(nama: "Mie tamie seafood", harga: 37000))
        menu.append(Menu(nama: "Mie ma la chicken", harga: 27000))
        menu.append(Menu(nama: "Nasi bakar tuna", harga: 27000))
        menu.append(Menu(nama: "Sapo tahu seafood", harga: 22000))

        
        var gotri = Restaurant(Name: "Gotri", Listmenu: menu)
        
        gotri.Greet()
        input = readLine()!
        
        //send to function which adds food into variable list pesanan
        switch input {
        case "1":
            beli(nama: gotri.Listmenu[0].nama, harga: gotri.Listmenu[0].harga, restoran: gotri.Nama)
        case "2":
            beli(nama: gotri.Listmenu[1].nama, harga: gotri.Listmenu[1].harga, restoran: gotri.Nama)
        case "3":
            beli(nama: gotri.Listmenu[2].nama, harga: gotri.Listmenu[2].harga, restoran: gotri.Nama)
        case "4":
            beli(nama: gotri.Listmenu[3].nama, harga: gotri.Listmenu[3].harga, restoran: gotri.Nama)
        case "5":
            beli(nama: gotri.Listmenu[4].nama, harga: gotri.Listmenu[4].harga, restoran: gotri.Nama)
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

//Raburi
func raburi(){
    repeat{
        //raburi menu front end
        var menu : [Menu] = []
        menu.append(Menu(nama: "Gyu shirokara ramen", harga: 42000))
        menu.append(Menu(nama: "Chicken katsu shirokara ramen", harga: 32000))
        menu.append(Menu(nama: "Chicken Chasu shirokara ramen", harga: 32000))
        menu.append(Menu(nama: "Chicken teriyaki shirokara ramen", harga: 32000))
        menu.append(Menu(nama: "Gyu Jigae Ramen", harga: 45000))

        
        var raburi = Restaurant(Name: "Raburi", Listmenu: menu)
        
        raburi.Greet()
        input = readLine()!
        
        //send to function which adds food into variable list pesanan
        switch input {
        case "1":
            beli(nama: raburi.Listmenu[0].nama, harga: raburi.Listmenu[0].harga, restoran: raburi.Nama)
        case "2":
            beli(nama: raburi.Listmenu[1].nama, harga: raburi.Listmenu[1].harga, restoran: raburi.Nama)
        case "3":
            beli(nama: raburi.Listmenu[2].nama, harga: raburi.Listmenu[2].harga, restoran: raburi.Nama)
        case "4":
            beli(nama: raburi.Listmenu[3].nama, harga: raburi.Listmenu[3].harga, restoran: raburi.Nama)
        case "5":
            beli(nama: raburi.Listmenu[4].nama, harga: raburi.Listmenu[4].harga, restoran: raburi.Nama)
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

//madamlie
func madamlie(){
    repeat{
        //madamlie menu front end
        var menu : [Menu] = []
        menu.append(Menu(nama: "Nasi ayam geprek", harga: 35000))
        menu.append(Menu(nama: "Nasi ayam goreng", harga: 25000))
        menu.append(Menu(nama: "Ayam goreng", harga: 20000))
        menu.append(Menu(nama: "Es teh manis", harga: 5000))
        menu.append(Menu(nama: "Ayam geprek", harga: 20000))

        
        var madamlie = Restaurant(Name: "Madam lie", Listmenu: menu)
        
        madamlie.Greet()
//        let madamlie = """
//        Hi, welcome back to Madam lie!
//        What would you like to order?
//        [1] Nasi ayam geprek
//        [2] Nasi ayam goreng
//        [3] Ayam goreng
//        [4] Es teh manis
//        [5] Ayam geprek
//        -
//        [B]ack to Main menu
//        """
//        print(madamlie)
//
//        //read user input
//        print("Your menu choice? | ", terminator: "")
        input = readLine()!
        
        //send to function which adds food into variable list pesanan
        switch input {
        case "1":
            beli(nama: madamlie.Listmenu[0].nama, harga: madamlie.Listmenu[0].harga, restoran: madamlie.Nama)
        case "2":
            beli(nama: madamlie.Listmenu[1].nama, harga: madamlie.Listmenu[1].harga, restoran: madamlie.Nama)
        case "3":
            beli(nama: madamlie.Listmenu[2].nama, harga: madamlie.Listmenu[2].harga, restoran: madamlie.Nama)
        case "4":
            beli(nama: madamlie.Listmenu[3].nama, harga: madamlie.Listmenu[3].harga, restoran: madamlie.Nama)
        case "5":
            beli(nama: madamlie.Listmenu[4].nama, harga: madamlie.Listmenu[4].harga, restoran: madamlie.Nama)
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}


//Raburi
func EnW(){
    repeat{
        //enw menu front end
        var menu : [Menu] = []
        menu.append(Menu(nama: "Beef sandwich", harga: 30000))
        menu.append(Menu(nama: "Chicken mayo sandwich", harga: 25000))
        menu.append(Menu(nama: "Chicken mentai sandwich", harga: 25000))
        menu.append(Menu(nama: "Salad", harga: 20000))
        menu.append(Menu(nama: "Milkshake", harga: 20000))

        
        var enw = Restaurant(Name: "EnW", Listmenu: menu)
        
        enw.Greet()
        input = readLine()!
        
        //send to function which adds food into variable list pesanan
        switch input {
        case "1":
            beli(nama: enw.Listmenu[0].nama, harga:enw.Listmenu[0].harga, restoran: enw.Nama)
        case "2":
            beli(nama: enw.Listmenu[1].nama, harga:enw.Listmenu[1].harga, restoran: enw.Nama)
        case "3":
            beli(nama: enw.Listmenu[2].nama, harga:enw.Listmenu[2].harga, restoran: enw.Nama)
        case "4":
            beli(nama: enw.Listmenu[3].nama, harga:enw.Listmenu[3].harga, restoran: enw.Nama)
        case "5":
            beli(nama: enw.Listmenu[4].nama, harga:enw.Listmenu[4].harga, restoran: enw.Nama)
        default:
            print()
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

func beli(nama: String, harga: Int, restoran:String){
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
            addmakanan(nama: nama, total: num, namaresto: restoran, harga: harga)
            print("")
            back = false
        } else {
            print("Invalid input")
        }
    }while back
}


func addmakanan(nama: String, total: Int, namaresto: String, harga:Int){
    if !pesanans.Listpesanan.isEmpty{
        var i = 0
        var ada = false
        //search for already existing products
        for pesanan in pesanans.Listpesanan{
            print("index ke \(i) namaresto: \(pesanan.Namarestiran) namamenu: \(nama)")
            if pesanan.Namarestiran == namaresto && pesanan.Namamenu == nama {
                //incrementing the already existing food value by bought number
                pesanans.Listpesanan[i].Jumlah = pesanan.Jumlah + total
                ada = true
            }
            i += 1
        }
        
        if !ada {
            print("masuk yang gak ada")
            //adding a new item into the arraylist
            pesanans.Listpesanan.append(Orderedmenu(Jumlah: total, Namamenu: nama, Namarestiran: namaresto, Hargamenu: harga))
        }
    }else{
        print("masuk else")
        //adding a new item into the arraylist
        pesanans.Listpesanan.append(Orderedmenu(Jumlah: total, Namamenu: nama, Namarestiran: namaresto, Hargamenu: harga))
    }
}

