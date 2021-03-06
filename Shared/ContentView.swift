//
//  ContentView.swift
//  Shared
//
//  Created by Jonas Pramann on 03.03.21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView{
        
            ZStack {  //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
                
                VStack{ //ÜBERSCHRIFT
                    Text("ContentView")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
            


                }
                
            }
            
        }
            
    }
}





//Vorschau
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        
        }
    }
}

