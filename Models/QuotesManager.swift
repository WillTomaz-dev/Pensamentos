//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by William Tomaz on 25/05/20.
//  Copyright © 2020 William Tomaz. All rights reserved.
//

import Foundation

class QuotesManager {
    
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")! //informando o caminho do arquivo json
        let jsonData = try! Data(contentsOf: fileURL) //metodo contrutor, exige o tratamento de erro //metodo Data é usado
        let jsonDecoder = JSONDecoder() // essa classe faz a decodificação
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData) //decodifica o json e manda para o array de "Quote"
    }
    
    func getRandomQuote() -> Quote{
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
    
}
