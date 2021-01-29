//
//  NavigationBarConfigModifier.swift
//  SwiftUINavigation
//
//  Created by Chee Ket Yung on 24/01/2021.
//

import SwiftUI

struct NavigationBarConfigModifier: ViewModifier {

    private var backgroundColor: UIColor?
    
   
    init(backgroundColor: UIColor?, titleAttributes: (color: UIColor? , font : UIFont?),
         backButtonImage : (image : UIImage?, size : CGSize?)? = nil, tintColor : UIColor? = nil) {
        
        self.backgroundColor = backgroundColor
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.backgroundColor = .clear
        
    
        if let font = titleAttributes.font {
            
            navigationAppearance.titleTextAttributes = [.foregroundColor:  titleAttributes.color ?? .black, .font : font]
            navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleAttributes.color ?? .black, .font : font]
        }
        else {
       
            navigationAppearance.titleTextAttributes = [.foregroundColor: titleAttributes.color ?? .black]
            navigationAppearance.largeTitleTextAttributes = [.foregroundColor: titleAttributes.color ?? .black]
        }
    
        
        if let backButtonImage = backButtonImage {
        
            if let backImage = backButtonImage.image {
            
                let sz = backButtonImage.size ?? CGSize(width: 22, height: 22)
                
                let image = UIGraphicsImageRenderer(size:sz).image { ctx in
                    backImage.draw(in:CGRect(x: 0,y: 0,width: sz.width,height: sz.height))
                }
                
                let imagemask = UIGraphicsImageRenderer(size:sz).image { ctx in
                    ctx.fill(CGRect(x: 0,y: 0,width: sz.width,height: sz.height))
                }
                
                navigationAppearance.setBackIndicatorImage(image, transitionMaskImage: imagemask)
       
            }
            
        
        }
        
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        if let tColor = tintColor {
            
            UINavigationBar.appearance().tintColor = tColor
        }
        else {
            
            UINavigationBar.appearance().tintColor = titleAttributes.color ?? .black
        }
        
    }

    func body(content: Content) -> some View {
        
        ZStack{
            content
            
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                    .frame(height: geometry.safeAreaInsets.top)
                    .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
    
        }
    }
    
}

