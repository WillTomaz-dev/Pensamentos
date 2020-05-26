//
//  Configuration.swift
//  Pensamentos
//
//  Created by William Tomaz on 25/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String{
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autorefresh = "autorefresh"
}

class Configuration {
    
    let defaults = UserDefaults.standard
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        get {
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) // pegando o valor do enum
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue) //passando um double grava no user dfault na chave passada
        }
    }
    
    var colorScheme: Int {
        get {
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue) // pegando o valor do enum
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue) //passando um double grava no user dfault na chave passada
        }
    }
    
    var autorefresh: Bool {
        get {
            return defaults.bool(forKey: UserDefaultsKeys.autorefresh.rawValue) // pegando o valor do enum
        }
        set {
            defaults.set(newValue, forKey: UserDefaultsKeys.autorefresh.rawValue) //passando um double grava no user dfault na chave passada
        }
    }

    
    private init() {
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
}
