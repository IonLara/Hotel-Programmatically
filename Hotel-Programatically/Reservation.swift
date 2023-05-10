//
//  Reservation.swift
//  Hotel-Programatically
//
//  Created by Ion Sebastian Rodriguez Lara on 09/05/23.
//

import Foundation

struct Reservation {
    var firstName: String
    var lastName: String
    var email: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numOfAdults: Int
    var numOfChildren: Int
    
    var wifi: Bool
    var roomType: RoomType
}
