//
//  ContentView.swift
//  stocks
//
//  Created by Mohammad Azam on 12/22/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var stockListVM = StockListViewModel()
        
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.black
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
         UITableView.appearance().backgroundColor = UIColor.black
                   UITableViewCell.appearance().backgroundColor = UIColor.black
        
        self.stockListVM.load()
    }

    var body: some View {
    
        let stocks = self.stockListVM.stocks
        
        return NavigationView {
            ZStack(alignment: .leading) {
                
                Color.black
                
                Text(Date.formatDateForTitle())
                    .font(.custom("Arial",size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(Color.gray)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
                    .offset(y: -400)
            
                SearchView(
                    searchTerm: self.$stockListVM.searchTerm)
                    .offset(y: -350)
                
                StockListView(stocks: stocks)
                    .offset(y: 150)
                
                Spacer()
                
            }.background(Color.black)
            .navigationBarTitle("Stocks")
                
        }.edgesIgnoringSafeArea(Edge.Set(.bottom))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
