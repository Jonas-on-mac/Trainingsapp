//
//  HomeScreen.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 03.03.21.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        
        NavigationView{
            
            ZStack {    //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{ //ÜBERSCHRIFT
                        Text("Willkommen bei deinem Trainings Couch")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                    
                
            
                        //Link und Button zum anderen Fenster
                        NavigationLink(destination: ContentView()) {
                            Text("Start your Training")
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background((LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)))
                                .cornerRadius(40)
                                .font(.title)
                        
                        }
                
                }
            }
        }
    }
}

//Vorschau
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
