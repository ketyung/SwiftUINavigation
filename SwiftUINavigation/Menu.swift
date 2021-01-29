//
//  Menu.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI


enum PushToViewType : String, Decodable {
    case example1
    case example2
    case example3
    case example4
    case example5
    case example6
    case example7
    case example8
    
}


struct MenuItem : Decodable , Identifiable {
    
    var id = UUID()
    
    var title : String
    
    var pushToViewType : PushToViewType
    
    var navigationLinkViewType : NavigationLinkViewType?
    
    
    private enum CodingKeys : String, CodingKey { case title, pushToViewType, navigationLinkViewType }
}


struct Menu : View {
    

    let menus = Bundle.main.decodeJson([MenuItem].self, fileName: "Menu.json")
    
    
    var body: some View {
        
        List(menus) { menu in
            
            NavigationLink( destination: pushToViewType(menu.pushToViewType, navigationLinkViewType: menu.navigationLinkViewType)){
                
                Text( menu.title )
                    .font(.body)
            }
        }
        .navigation(title: "Menu")
        .withNavigationView(true, backgroundColor: .purple,
                            titleColor: .white)
     
    }
}


extension Menu {
    
    
    @ViewBuilder
    private func pushToViewType(_ pushToViewType : PushToViewType, navigationLinkViewType : NavigationLinkViewType? = nil) -> some View{
        
        
        switch (pushToViewType){
        
            case .example1 :
                Example1()
            case .example2 :
                Example2()
            case .example3 :
                Example3()
            case .example4 :
                Example4()
            case .example5 :
                NaviLinkView(type: navigationLinkViewType ?? .text)
            case .example6:
                View1(withNavigationView: false)
            case .example7:
                Screen1(hasNavigation: false)
            case .example8:
                Screen4()
      
        }
    }
}


struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
