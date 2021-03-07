//
//  ContentView.swift
//  Shared
//
//  Created by Jonas Pramann on 03.03.21.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    
    
    var body: some View {
        
        NavigationView{
            
            ZStack {  //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                
                
                VStack{ //ÜBERSCHRIFT
                    Text("Training")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                    
                    
                      // aufruf der check funktion
                    check()
                    check()
                    check()
                            
                    // abfrage für das erledigen aller Übungen
                        
                            
                        
                        
                    
                }//Ende VStack
                
                
            }//Ende ZStack
            
        }
        
            
    }
    
}


// Button Funktion für das erledigen einer Übung
struct check : View{
    
    @State var checkbox = false
    @State public var count = 0
    
    var body: some View{
        // Button setzt checkbox auf true oder false
        Button(action: {
            
            self.checkbox.toggle()
        })
            {
            //tru oder false steuert das Ändern des Images
            Image(systemName: checkbox ? "checkmark.square.fill" : "square")
                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .imageScale(checkbox ? .large : .small)
                .foregroundColor(.black)
                .padding()
            
            
            
            }
            .animation(.easeInOut)
            .rotationEffect(checkbox ? Angle (degrees: 15) : .zero)
            
        if(checkbox == true){
            //count auf 1 setzen
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

