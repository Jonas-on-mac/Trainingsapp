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
            
            
            
            
            
            
            
            
            VStack(alignment: .center, spacing: 20.0){
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .lineLimit(nil)
                
                Spacer()
                    .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                
                HStack {
                    Text("Benachrichtigungen")
                        .font(.callout)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 200.0)
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        
                    }
                    
                    
                    
                }.padding(.horizontal, 75.0)
                
                
                
                
                
                
                HStack {
                    Text("Sound")
                        .font(.callout)
                        .fontWeight(.thin)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .frame(width: 200.0)
                    
                    Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                        
                    }
                    
                    
                }
                .padding(.horizontal, 75.0)
                
                HStack {
                    
                    
                }
                
                
                
                
                
                
                
                
                
            }
            .listStyle(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=List Style@*/DefaultListStyle()/*@END_MENU_TOKEN@*/)
            
            
            
            
        }
        
        
        //Ende ZStack
        
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
