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
        
        func symbolName() -> String {
            switch type {
            case .electricity:
                return "electric_bolt"
            case .water:
                return "water"
            case .setting:
                return "settings"
            }
        }
    }
    
    private let categoryListEnum: [String] = {
        let allCase = Category.CatType.allCases
        return allCase.map(\.rawValue)
    }()

    private let categoryList: [Category] = {
        return Array<Category.CatType>([.electricity, .water, .setting]).map { type in
            Category(type: type)
        }
    }()
    
    private func destination(name: String) -> some View {
        return DetailView(category: name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(name.capitalized)
    }
    
    var body: some View {
        NavigationView {
            List(categoryList) { list in
                let name = list.type.rawValue.capitalized
                NavigationLink(destination: destination(name: name)) {
                    Image(list.symbolName())
                    Text(name)
                }
            }
            .navigationTitle("Calculate")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: destination(name: "Setting")) {
                        Image(systemName: "gear")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func debugModifier<T: View>(_ modifier: (Self) -> T) -> some View {
        #if DEBUG
        return modifier(self)
        #else
        return self
        #endif
    }
}

extension View {
    func debugBorder(_ color: Color = .red, width: CGFloat = 1) -> some View {
        debugModifier {
            $0.border(color, width: width)
        }
    }
    
    func debugBackground(_ color: Color = .red) -> some View {
        debugModifier {
            $0.background(color)
        }
    }
}
