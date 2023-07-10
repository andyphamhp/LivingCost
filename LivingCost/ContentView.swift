//
//  ContentView.swift
//  LivingCost
//
//  Created by Andy Pham on 10/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    struct Category: Identifiable {
        
        enum CatType: String, CaseIterable {
            case electricity
            case water
            case setting
        }
        
        let id = UUID()
        let type: CatType
    }
    
    private let categoryListEnum: [String] = {
        let allCase = Category.CatType.allCases
        return allCase.map(\.rawValue)
    }()
    
    private let categoryList: [Category] = {
        return Array<Category.CatType>([.electricity, .water]).map { type in
            Category(type: type)
        }
    }()
    
    var body: some View {
        NavigationView {
            List(categoryListEnum, id: \.self) { category in
                NavigationLink {
                    DetailView(category: category)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationTitle(category.capitalized)
                } label: {
                    Text(category.capitalized)
                }
            }
            .navigationTitle("Main")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
