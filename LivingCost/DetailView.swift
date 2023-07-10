//
//  DetailView.swift
//  LivingCost
//
//  Created by Andy Pham on 10/07/2023.
//

import SwiftUI

struct DetailView: View {
    let category: String
    
    var body: some View {
        Text(category)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(category: "Category")
    }
}
