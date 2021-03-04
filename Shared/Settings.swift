//
//  Settings.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 04.03.21.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        
        //Start ZStack
        ZStack {
            //HINTERGRUND
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            

                

                
                
            
            
            VStack{
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                    .menuStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Menu Style@*/DefaultMenuStyle()/*@END_MENU_TOKEN@*/)
                
                
                
                HStack {
                    Text("Benachrichtigungen")
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        
                    }
                }

                




                HStack {
                    Text("Settings")
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        
                    }
                }
            
                HStack {


                }
            
            
            
            
            
            
            
            
            
            }
            
            
            
            
        }
        
        
        //Ende ZStack
    
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
