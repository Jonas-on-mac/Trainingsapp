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
            
                    VStack{ //ÜBERSCHRIFT
                        Text("Willkommen bei deinem Trainings Coach")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                            .frame(width: 1.0, height: 125.0)
                        
                        //Button der den Contentview aufruft
                        Button("Start your Training"){
                            self.showContentView.toggle()
                            }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .colorInvert()
                        Spacer()
                        .frame(width: 1.0, height: 20.0)

                        
                        Button("Training Ändern"){
                            self.showContentView.toggle()
                            }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .colorInvert()
                        Spacer()
                        .frame(width: 1.0, height: 20.0)
                     
                        Button("Einstellung"){
                            self.showContentView.toggle()

                        }
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .colorInvert()
                        
            
                        //Link und Button zum anderen Fenster
                        /*NavigationLink(destination: ContentView()) {
                            Text("Start your Training")
                                .frame(minWidth: 0, maxWidth: 300)
                                .padding()
                                .foregroundColor(.white)
                                .background((LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)))
                                .cornerRadius(40)
                                .font(.title)
                        
                        }*/
                
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
