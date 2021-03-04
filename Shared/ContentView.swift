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
    
            
                /*//Link und Button zum Homescreen
                    NavigationLink(destination: HomeScreen()) {
                        Text("zurück zum Hauptmenü")
                            .frame(minWidth: 0, maxWidth: 200)
                            .padding()
                            .foregroundColor(.white)
                            .background((LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)))
                            .cornerRadius(40)
                            .font(.subheadline)
                
                    }*/
            


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

