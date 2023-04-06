//
//  Cart_item.swift
//  0706012110039-Dhammiko-AFL1
//
//  Created by MacBook Pro on 03/04/23.
//

import Foundation

class Cart_item : Menu{
    var jumlah: Int
    var namarestoran: String
    
    init(jumlah: Int, Namaresto: String, nama: String, harga: Int) {
        self.namarestoran = Namaresto
        self.jumlah = jumlah
        super.init(nama: nama, harga: harga)

    }
}
