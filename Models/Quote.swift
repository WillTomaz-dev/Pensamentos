//
//  Quote.swift
//  Pensamentos
//
//  Created by William Tomaz on 25/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation

struct Quote: Codable{ /*encodable: impentado quando deseja ser codificado/convertido em um json/ arquivo  e decodable: implementado quando deseja extrair de um arquivo/ json, Codable é os dois */

    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return " “" + quote + "” "
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
}
