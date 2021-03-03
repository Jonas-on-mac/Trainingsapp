//
//  HomeScreen.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 03.03.21.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        ZStack {//HINTERGRUND
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
            ]), startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea()
            
            VStack{//ÜBERSCHRIFT
                Text("Willkommen bei deinem Trainings Couch")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Content@*/Text("Button")/*@END_MENU_TOKEN@*/
                }
                
            }


                
                
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
