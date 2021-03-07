//
//  HomeScreen.swift
//  Trainingsapp
//
//  Created by Enrico Martinelli on 03.03.21.
//

import SwiftUI
import UIKit

    


struct HomeScreen: View {
    
    
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
                        .frame(width: 125, height: 125, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    start()
                    
                    change()
                    
                    settings()
                }
            }
        }
    }
}

// Struct für den Button Start
struct start : View{
    
    @State var start = false
    
    var body: some View{
        VStack{
            //Start Button Start Training
            Button("Start your Training"){
                self.start.toggle()
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .colorInvert()
            Spacer()
                .frame(width: 1.0, height: 20.0)
            //Ende Button Start Training
        }
        .sheet(isPresented: $start, content: {(ContentView() )})
        
        
    }
}

// Struct für den Button change training
struct change : View{
    
    @State var change = false
    
    var body: some View{
        VStack{
            //Start Button Start Training
            Button("change training"){
                self.change.toggle()
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .colorInvert()
            Spacer()
                .frame(width: 1.0, height: 20.0)
            //Ende Button Start Training
        }
        .sheet(isPresented: $change, content: {(ChangeTraining() )})
        
        
    }
}

//Struct für die Einstellungen
struct settings : View{
    
    @State var settings = false
    
    var body: some View{
        VStack{
            //Start Button Start Training
            Button("Settings"){
                self.settings.toggle()
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .colorInvert()
            Spacer()
                .frame(width: 1.0, height: 20.0)
            //Ende Button Start Training
        }
        .sheet(isPresented: $settings, content: {(Settings() )})
        
        
    }
}





//Vorschau
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
