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
    var nama:String
    var listmenu: [Menu]
    
    init(Name: String, Listmenu: [Menu]) {
        self.nama = Name
        self.listmenu = Listmenu
    }
    
    func Greet(){
        print("""
        Hi, welcome back to \(self.nama)!
        What would you like to order?

        """)

        self.displaymenu()
        
        print("""
        [B]ack to Main menu
        
        Your menu choice? |
        """, terminator: "")
    }
    
    func displaymenu(){
        var i = 1
        for menu in listmenu{
            print("[\(i)] \(menu.nama)")
            i += 1
        }
    }
}

class Cart_item : Menu{
    var jumlah: Int
    var namarestoran: String
    
    init(jumlah: Int, Namaresto: String, nama: String, harga: Int) {
        self.namarestoran = Namaresto
        self.jumlah = jumlah
        super.init(nama: nama, harga: harga)

    }
}

class Cart{
    var Listpesanan: [Cart_item]
    
    init(Listpesanan: [Cart_item]) {
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
        if pesanans.Listpesanan.isEmpty{
            print("Your cart is empty")
            print("\nPress [B] to go back")
        }else{
            //group the data into a new dictionary
            var ordersByRestaurant: [String: [(String, Int, Int)]] = [:]
            for item in pesanans.Listpesanan {
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
        
        if input == "p" && !pesanans.Listpesanan.isEmpty {
            //counting the price
            var totalprice = 0
            for item in pesanans.Listpesanan{
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
            beli(nama: tuku_tuku.listmenu[0].nama, harga: tuku_tuku.listmenu[0].harga, restoran: tuku_tuku.nama)
        case "2":
            beli(nama: tuku_tuku.listmenu[1].nama, harga: tuku_tuku.listmenu[1].harga, restoran: tuku_tuku.nama)
        case "3":
            beli(nama: tuku_tuku.listmenu[2].nama, harga: tuku_tuku.listmenu[2].harga, restoran: tuku_tuku.nama)
        case "4":
            beli(nama: tuku_tuku.listmenu[3].nama, harga: tuku_tuku.listmenu[3].harga, restoran: tuku_tuku.nama)
        case "5":
            beli(nama: tuku_tuku.listmenu[4].nama, harga: tuku_tuku.listmenu[4].harga, restoran: tuku_tuku.nama)
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
            beli(nama: gotri.listmenu[0].nama, harga: gotri.listmenu[0].harga, restoran: gotri.nama)
        case "2":
            beli(nama: gotri.listmenu[1].nama, harga: gotri.listmenu[1].harga, restoran: gotri.nama)
        case "3":
            beli(nama: gotri.listmenu[2].nama, harga: gotri.listmenu[2].harga, restoran: gotri.nama)
        case "4":
            beli(nama: gotri.listmenu[3].nama, harga: gotri.listmenu[3].harga, restoran: gotri.nama)
        case "5":
            beli(nama: gotri.listmenu[4].nama, harga: gotri.listmenu[4].harga, restoran: gotri.nama)
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
            beli(nama: raburi.listmenu[0].nama, harga: raburi.listmenu[0].harga, restoran: raburi.nama)
        case "2":
            beli(nama: raburi.listmenu[1].nama, harga: raburi.listmenu[1].harga, restoran: raburi.nama)
        case "3":
            beli(nama: raburi.listmenu[2].nama, harga: raburi.listmenu[2].harga, restoran: raburi.nama)
        case "4":
            beli(nama: raburi.listmenu[3].nama, harga: raburi.listmenu[3].harga, restoran: raburi.nama)
        case "5":
            beli(nama: raburi.listmenu[4].nama, harga: raburi.listmenu[4].harga, restoran: raburi.nama)
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
            beli(nama: madamlie.listmenu[0].nama, harga: madamlie.listmenu[0].harga, restoran: madamlie.nama)
        case "2":
            beli(nama: madamlie.listmenu[1].nama, harga: madamlie.listmenu[1].harga, restoran: madamlie.nama)
        case "3":
            beli(nama: madamlie.listmenu[2].nama, harga: madamlie.listmenu[2].harga, restoran: madamlie.nama)
        case "4":
            beli(nama: madamlie.listmenu[3].nama, harga: madamlie.listmenu[3].harga, restoran: madamlie.nama)
        case "5":
            beli(nama: madamlie.listmenu[4].nama, harga: madamlie.listmenu[4].harga, restoran: madamlie.nama)
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
            beli(nama: enw.listmenu[0].nama, harga:enw.listmenu[0].harga, restoran: enw.nama)
        case "2":
            beli(nama: enw.listmenu[1].nama, harga:enw.listmenu[1].harga, restoran: enw.nama)
        case "3":
            beli(nama: enw.listmenu[2].nama, harga:enw.listmenu[2].harga, restoran: enw.nama)
        case "4":
            beli(nama: enw.listmenu[3].nama, harga:enw.listmenu[3].harga, restoran: enw.nama)
        case "5":
            beli(nama: enw.listmenu[4].nama, harga:enw.listmenu[4].harga, restoran: enw.nama)
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
            print("index ke \(i) namaresto: \(pesanan.namarestoran) namamenu: \(nama)")
            if pesanan.namarestoran == namaresto && pesanan.nama == nama {
                //incrementing the already existing food value by bought number
                pesanans.Listpesanan[i].jumlah = pesanan.jumlah + total
                ada = true
            }
            i += 1
        }
        
        if !ada {
            print("masuk yang gak ada")
            //adding a new item into the arraylist
            pesanans.Listpesanan.append(Cart_item(jumlah: total, Namaresto: namaresto, nama: nama, harga: harga))
        }
    }else{
        print("masuk else")
        //adding a new item into the arraylist
        pesanans.Listpesanan.append(Cart_item(jumlah: total, Namaresto: namaresto, nama: nama, harga: harga))
    }
}

