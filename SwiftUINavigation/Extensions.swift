//
//  Extensions.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 10/01/2021.
//

import Foundation
import SwiftUI

extension Bundle {
    
    func decodeJson <T:Decodable> (_ type : T.Type , fileName : String,
        dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate,
        keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T {
        
        guard let url = self.url(forResource: fileName, withExtension: nil) else {
            
            fatalError("Failed to load file ")
        }
        
        do {
            let jsonData = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            
            
            let result = try decoder.decode(T.self, from: jsonData)
            
            return result
        }
        catch {
            
            fatalError("err:\(error)")
        }
        
        
    }
}


extension View {
    
    func navigation ( title : String , displayMode : NavigationBarItem.TitleDisplayMode = .automatic) -> some View{
        
        self.modifier( NaviBarVersionModifier(title: title, displayMode: displayMode))
    }
}


extension View {
    
    func navigationButtons(backButtonImageName : String , rightButton : (imageName : String, function :() -> Void)? = nil  ,size : CGSize = CGSize(width: 24, height: 24)) -> some View {
        
        self.modifier( CustomNaviButtonModifier(backButtonImageName: backButtonImageName, rightButton: rightButton, size:  size ) )
    }
}



extension View {

    func navigationBar(backgroundColor: UIColor?, titleAttributes: (color: UIColor? , font : UIFont?),
                             backButtonImage : (image : UIImage?, size : CGSize?)? = nil,
                             tintColor : UIColor? = nil  ) -> some View {
        self.modifier(NavigationBarConfigModifier(backgroundColor: backgroundColor, titleAttributes: titleAttributes , backButtonImage: backButtonImage, tintColor: tintColor))
        
    }

    func navigationBar(backgroundColor: UIColor?, titleColor : UIColor?,
                             backButtonImage : UIImage? = nil,
                             tintColor : UIColor? = nil  ) -> some View {
        self.navigationBar  (backgroundColor: backgroundColor, titleAttributes: (titleColor, nil) ,
                                   backButtonImage: (backButtonImage, nil), tintColor: tintColor)
        
    }
}


extension View {
    
    func withNavigationView (_ with : Bool, backgroundColor : UIColor? = nil, titleColor : UIColor? = nil , tintColor : UIColor? = nil) -> some View {
        
        self.modifier( WithNavigationViewWrapperModifier(withNavigationView: with,
        backgroundColor: backgroundColor, titleColor: titleColor,
        tintColor:  tintColor))
        
    }
}


class Theme {
    
    
    static func navigationBarColors(background : UIColor?, titleColor : UIColor? = nil, tintColor : UIColor? = nil ){
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = background ?? .clear
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .black]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .black]
       
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance

        UINavigationBar.appearance().tintColor = tintColor ?? titleColor ?? .black
    }
}
