//
//  MenuItem.swift
//  likelion_swiftui_221130_MultiPlatformDemo
//
//  Created by 원태영 on 2022/11/30.
//

import Foundation

struct MenuItem : Identifiable, Hashable {
    var id = UUID()
    var name : String
}

let menuItems : [MenuItem] = [
    MenuItem(name: "School")
]
