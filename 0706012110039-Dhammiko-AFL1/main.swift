import Foundation

//all variables declared outside of any function
var input = ""
//var listpesanan: [(String,String,Int,Int)] = []
var shoppingcart: Cart = Cart(Listpesanan: [])

//start the program
Mainmenu()

//the main loop
func Mainmenu(){
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
            //send to tuku-tuku menu
            Tuku()
        case "2":
            //send to gotri menu
            Gotri()
        case "3":
            //send to raburi menu
            Raburi()
        case "4":
            //send to madamlie menu
            Madamlie()
        case "5":
            EnW()
            //send to shoppingcart menu
        case "s":
            shoppingcart.Shoppingcartmenu()
        default:
            print()
        }

    } while input.caseInsensitiveCompare("q") != .orderedSame
}


//tuku tuku page
func Tuku(){
    //looping for application flow
    repeat{
        //initializing Restaurant object with menu
        var menu : [Menu] = []
        menu.append(Menu(nama: "Tahu isi", harga: 10000))
        menu.append(Menu(nama: "Pop Mie", harga: 8000))
        menu.append(Menu(nama: "Pocari Sweat", harga: 8000))
        menu.append(Menu(nama: "Beng-beng Large", harga: 3000))
        menu.append(Menu(nama: "Nasi campur", harga: 20000))

        let tuku_tuku = Restaurant(nama: "Tuku-tuku", listmenu: menu)
        
        //calling function to display menu
        tuku_tuku.Greet()
        input = readLine()!
        
        //error handling for user input
        if let num = Int(input) {
            //error handling for user input
            if num >= 1 && num <= tuku_tuku.listmenu.count{
                let index = num - 1
                //send to function which adds food into shoppingcart
                shoppingcart.Beli(nama: tuku_tuku.listmenu[index].nama, harga:tuku_tuku.listmenu[index].harga, restoran: tuku_tuku.nama)
            }else{
                print("Invalid Option")
                print("")
            }
        } else {
            print("Invalid Option")
            print("")
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

//Gotri page
func Gotri(){
    //looping for application flow
    repeat{
        //initializing Restaurant object with menu
        var menu : [Menu] = []
        menu.append(Menu(nama: "Nasi goreng seafood", harga: 30000))
        menu.append(Menu(nama: "Mie tamie seafood", harga: 37000))
        menu.append(Menu(nama: "Mie ma la chicken", harga: 27000))
        menu.append(Menu(nama: "Nasi bakar tuna", harga: 27000))
        menu.append(Menu(nama: "Sapo tahu seafood", harga: 22000))

        
        let gotri = Restaurant(nama: "Gotri", listmenu: menu)
        
        //calling function to display menu
        gotri.Greet()
        input = readLine()!
        
        
        //error handling for user input
        if let num = Int(input) {
            //error handling for user input
            if num >= 1 && num <= gotri.listmenu.count{
                let index = num - 1
                //send to function which adds food into variable list pesanan
                shoppingcart.Beli(nama: gotri.listmenu[index].nama, harga:gotri.listmenu[index].harga, restoran: gotri.nama)
            }else{
                print("Invalid Option")
                print("")
            }
        } else {
            print("Invalid Option")
            print("")
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

//Raburi page
func Raburi(){
    //looping for application flow
    repeat{
        //initializing Restaurant object with menu
        var menu : [Menu] = []
        menu.append(Menu(nama: "Gyu shirokara ramen", harga: 42000))
        menu.append(Menu(nama: "Chicken katsu shirokara ramen", harga: 32000))
        menu.append(Menu(nama: "Chicken Chasu shirokara ramen", harga: 32000))
        menu.append(Menu(nama: "Chicken teriyaki shirokara ramen", harga: 32000))
        menu.append(Menu(nama: "Gyu Jigae Ramen", harga: 45000))

        
        let raburi = Restaurant(nama: "Raburi", listmenu: menu)
        
        //calling function to display menu
        raburi.Greet()
        input = readLine()!
        
        //error handling for user input
        if let num = Int(input) {
            //error handling for user input
            if num >= 1 && num <= raburi.listmenu.count{
                let index = num - 1
                //send to function which adds food into variable list pesanan
                shoppingcart.Beli(nama: raburi.listmenu[index].nama, harga:raburi.listmenu[index].harga, restoran: raburi.nama)
            }else{
                print("Invalid Option")
                print("")
            }
        } else {
            print("Invalid Option")
            print("")
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}

//madamlie page
func Madamlie(){
    //looping for application flow
    repeat{
        //initializing Restaurant object with menu
        var menu : [Menu] = []
        menu.append(Menu(nama: "Nasi ayam geprek", harga: 35000))
        menu.append(Menu(nama: "Nasi ayam goreng", harga: 25000))
        menu.append(Menu(nama: "Ayam goreng", harga: 20000))
        menu.append(Menu(nama: "Es teh manis", harga: 5000))
        menu.append(Menu(nama: "Ayam geprek", harga: 20000))

        
        let madamlie = Restaurant(nama: "Madam lie", listmenu: menu)
        
        //calling function to display menu
        madamlie.Greet()
        input = readLine()!
        
        //error handling for user input
        if let num = Int(input) {
            //error handling for user input
            if num >= 1 && num <= madamlie.listmenu.count{
                let index = num - 1
                //send to function which adds food into variable list pesanan
                shoppingcart.Beli(nama: madamlie.listmenu[index].nama, harga:madamlie.listmenu[index].harga, restoran: madamlie.nama)
            }else{
                print("Invalid Option")
                print("")
            }
        } else {
            print("Invalid Option")
            print("")
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}


//Enw Page
func EnW(){
    //looping for application flow
    repeat{
        //initializing Restaurant object with menu
        var menu : [Menu] = []
        menu.append(Menu(nama: "Beef sandwich", harga: 30000))
        menu.append(Menu(nama: "Chicken mayo sandwich", harga: 25000))
        menu.append(Menu(nama: "Chicken mentai sandwich", harga: 25000))
        menu.append(Menu(nama: "Salad", harga: 20000))
        menu.append(Menu(nama: "Milkshake", harga: 20000))

        
        let enw = Restaurant(nama: "EnW", listmenu: menu)
        
        //calling function to display menu
        enw.Greet()
        input = readLine()!
        
        //error handling for user input
        if let num = Int(input) {
            //error handling for user input
            if num >= 1 && num <= enw.listmenu.count{
                let index = num - 1
                //send to function which adds food into variable list pesanan
                shoppingcart.Beli(nama: enw.listmenu[index].nama, harga:enw.listmenu[index].harga, restoran: enw.nama)
            }else{
                print("Invalid Option")
                print("")
            }
        } else {
            print("Invalid Option")
            print("")
        }
    }while input.caseInsensitiveCompare("b") != .orderedSame
}


