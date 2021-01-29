//
//  NaviLinkView.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 10/01/2021.
//

import SwiftUI

enum NavigationLinkViewType : Int, Decodable {
    
    case custom = 4
    
    case image = 3
    
    case imageSFSymbol = 2
    
    case text = 1

}


struct NaviLinkView : View {
    
    var type : NavigationLinkViewType = .custom
    
   
    var body: some View{
        
        NavigationLink (destination: DetailView(jsonFile: "Book1.json")){
            
            getNavLinkViewByType()
        }
        .navigationTitle(Text("Home"))
        .navigationBar(backgroundColor: .purple,
            titleAttributes: (.white, UIFont(name: "DINCondensed-Bold", size:25))
        )
        .navigationButtons(backButtonImageName: "arrow.left")
    
        
    }
    
    
    @ViewBuilder
    private func getNavLinkViewByType() -> some View {
        
    
        switch ( type ){
            
            case .imageSFSymbol :
            
                Image(systemName: "ant")
            
            case .image :
            
                Image("tc")
                    .renderingMode(.template)
        
            case .custom :
        
                ZStack {
                    
                    Circle().fill(Color.purple)
                    .frame(width: 200, height: 200, alignment: .center)
                    
                    Circle().fill(Color.green)
                    .frame(width: 150, height: 150, alignment: .center)
                    
                    Text("Tap me")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                }
                
            default :
                Text("Tap me")
            
        }
        
    }
}




struct NavLinkView_Previews: PreviewProvider {
    static var previews: some View {
        
        NaviLinkView()
    }
}
