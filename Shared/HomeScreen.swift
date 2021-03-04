//
//  HomeScreen.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 03.03.21.
//

import SwiftUI

struct HomeScreen: View {
    @State var showContentView = false //Variable für den View Button

    
    var body: some View {
        
        NavigationView{
            
            ZStack {    //HINTERGRUND
                LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple
                ]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
                    VStack{
                        
                    //Start ÜBERSCHRIFT
                        Text("Willkommen bei deinem Trainings Coach")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                
                        Spacer()
                            .frame(width: 1.0, height: 125.0)
                        
                    //Start ÜBERSCHRIFT
                        
                        
                    //Start Button Start Training
                        Button("Start your Training"){
                            self.showContentView.toggle()
                            }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .colorInvert()
                        Spacer()
                        .frame(width: 1.0, height: 20.0)
                    //Ende Button Start Training
                        
                    //Start Button ChangeTraining
                        Button("Training Ändern"){
                            self.showContentView.toggle()
                            }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .colorInvert()
                        Spacer()
                        .frame(width: 1.0, height: 20.0)
                    //Ende Button ChangeTraining
                    
                    //Start Button Settings
                        Button("Einstellung"){
                            self.showContentView.toggle()
                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .colorInvert()
                    //Ende Button Settings
                
                    }
                    .sheet(isPresented: $showContentView, content: {ContentView() }) //ContentView wird präsentiert -> Ausführung

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
