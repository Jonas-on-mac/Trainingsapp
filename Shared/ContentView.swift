//
//  ContentView.swift
//  Shared
//
//  Created by Jonas Pramann on 03.03.21.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State var checkbox = false
    
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
            
                    Button("plus") {
                        self.checkbox.toggle()
                        
                      
                    }
                    
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                    
                    
                }
                
                
            }//Ende ZStack
            
            if(checkbox == true){
                Image(systemName: "plus")
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

