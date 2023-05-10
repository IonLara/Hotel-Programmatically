//
//  RoomType.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 09/05/23.
//

import Foundation

struct RoomType {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static var all: [RoomType] {
        [RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
        RoomType(id: 1, name: "One King", shortName: "K", price: 209),
         RoomType(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
    
    static func ==(lhs: RoomType, rhs:RoomType) -> Bool {
        lhs.id == rhs.id
    }
}
