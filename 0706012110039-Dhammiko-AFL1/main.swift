import Foundation
//all variables declared outside of any function

//the main loop
var input = ""
repeat{
    print("Welcome to UC-Walk Cafeteria //emoji")
    print("Please choose cafeteria")

    print("\n[1] Tuku-tuku")
    print("[2] Gotri")
    print("[3] Madam Lie")
    print("[4] Kopte")
    print("-")
    print("[S]hopping Cart")
    print("[Q]uit")
    print("Your cafeteria choice? | ", terminator: "")
    //send to respective choice function
    input = readLine()!
    print("")
    
    if (input == "1"){
        tuku()
    }
} while input.caseInsensitiveCompare("q") != .orderedSame
//tes githubbbbbbb
//respective store fucntion
func tuku(){
    print("\n")
    print("Hi, welcome back to Tuku-Tuku!")
    print("What would you like to order?")
    print("\n[1] Tahu isi")
    print("[2] Nasi kuning")
    print("[3] Nasi campur")
    print("[4] Air mineral")
    print("-")
    print("[B]ack to Main Menu")
    //if back return to main loop never return otherwise
    print("Your menu choice?")
    readLine()
}





