//
//  Contact.swift
//  Dictionary contakts
//
//  Created by MacBook on 09/01/2022.
//

import Foundation

struct Contact {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String?
}


extension Contact {
    
    static var dictionary: [String:[Contact]] {
        [
            "A": [
            Contact(firstName: "Ангелина", lastName: "Вовк", phone: "+380951474102", email: nil),
            Contact(firstName: "Артур", lastName: "Долганов", phone: "+380951524512", email: nil),
            Contact(firstName: "Анзор", lastName: "Чешко", phone: "+380662351824", email: "Krisa@yandex.ru")
            ],
            "Б": [
                Contact(firstName: "Бомжара", lastName: "Шарамыга", phone: "+380662952492", email: nil),
                Contact(firstName: "Бодя", lastName: "Инакентий", phone: "+380952952419", email: nil),
                Contact(firstName: "Бобёр", lastName: "Царь", phone: "+380952591242", email: nil)
            ],
            "В": [
                Contact(firstName: "Виктория", lastName: "Шибецкая", phone: "+380931245215", email: "zaiaVV@gmail.com"),
                Contact(firstName: "Виталий", lastName: "Гарикан", phone: "+380931294921", email: "Jwjejwe@gmail.com"),
                Contact(firstName: "Виктор", lastName: "Заярный", phone: "+380638537521", email: nil)
            ],
            "Г": [
                Contact(firstName: "Григорий", lastName: "Любиченко", phone: "+380992491249", email: nil),
                Contact(firstName: "Галя", lastName: "Любиченко", phone: "+380992491241", email: "BuHgalter@gmail.com"),
                Contact(firstName: "Ганза", lastName: "Любиченко", phone: "+380661924921", email: nil)
            ],
            "Д": [
                Contact(firstName: "Дима", lastName: "Шалупонь", phone: "+380661224921", email: "Jojo@yandex.ru"),
                Contact(firstName: "Дороро", lastName: "Дюьель", phone: "+380662414921", email: nil),
                Contact(firstName: "Дейдара", lastName: "Акацуки", phone: "+380661924512", email: nil)
            ]
        ]
    }
}
