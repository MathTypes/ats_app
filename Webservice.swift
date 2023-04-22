//
//  Webservice.swift
//  stocks
//
//  Created by Mohammad Azam on 12/24/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//
import Foundation

class Webservice {
    
    func getStocks(completion: @escaping (([Stock]?) -> Void)) {
        
        guard let url = URL(string: "https://silicon-rhinoceros.glitch.me/stocks") else {
            fatalError("URL is not correct!")
        }
         
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let stocks = try? JSONDecoder().decode([Stock].self, from: data)
            stocks == nil ? completion(nil) : completion(stocks)
            
        }.resume()
        
        
        
    }
    
}

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String {
        return self.stock.symbol.uppercased()
    }
    
    var description: String {
        return self.stock.description
    }
    
    var price: String {
        return String(format: "%.2f",self.stock.price)
    }
    
    var change: String {
        return self.stock.change
    }
    
}
