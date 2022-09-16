//
//  ViewData.swift
//  MVVM + Clouser
//
//  Created by Виктор Басиев on 15.09.2022.
//

import Foundation

enum ViewData {
    case initial
    case loading(UserData)
    case success(UserData)
    case failure(UserData)
    
    struct UserData {
        let icon: String?
        let title: String?
        let description: String?
    }
}
