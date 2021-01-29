//
//  PushToDetailView.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 09/01/2021.
//

import SwiftUI



struct Example3: View {
    
    
    var body: some View {
        
        VStack(spacing: 20){
            
            Text("Hope your day is\n bright and sunny")
        
            NavigationLink (destination: DetailView(jsonFile: "Book1.json")){
               Text("Tap Here To Read Details")
            }
        }
    
    }
}



struct Example3_Previews: PreviewProvider {
    static var previews: some View {
        Example3()
    }
}
