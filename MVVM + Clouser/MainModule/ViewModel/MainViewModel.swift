//
//  MainViewModel.swift
//  MVVM + Clouser
//
//  Created by Виктор Басиев on 15.09.2022.
//

import UIKit


protocol MainViewModelProtocol {
    
    var updateViewData: ((ViewData) -> ())? { get set }
    
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {

    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
    
    public func startFetch() {
        
        updateViewData?(.loading(ViewData.UserData(icon: nil, title: nil, description: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.UserData(icon: "person.fill.checkmark", title: "Success", description: "Good job")))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.UserData(icon: "person.fill.xmark", title: "Fail", description: "Oh no..")))
        }
    }
    
    
}
