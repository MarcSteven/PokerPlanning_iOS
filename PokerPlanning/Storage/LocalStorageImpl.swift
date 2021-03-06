//
//  LocalStorageImpl.swift
//  PokerPlanning
//
//  Created by Aline Borges on 11/08/2018.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import RxSwift

struct LocalStorageKeys {
    private init() {}
    
    static let isLoggedIn = "logged_in"
}

class LocalStorageImpl: LocalStorage {
    
    let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
        userDefaults.register(defaults: [LocalStorageKeys.isLoggedIn: false])
    }
    
    var isLoggedIn: Bool {
        get {
            return userDefaults.bool(forKey: LocalStorageKeys.isLoggedIn)
        } set {
            userDefaults.set(newValue, forKey: LocalStorageKeys.isLoggedIn)
        }
    }
    
    func clear() {
        userDefaults.removeObject(forKey: LocalStorageKeys.isLoggedIn)
    }
    
}
