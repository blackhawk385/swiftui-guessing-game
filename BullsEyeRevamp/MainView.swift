//
//  ContentView.swift
//  BullsEyeRevamp
//
//  Created by VenD on 12/17/22.
//

import SwiftUI

struct ContentView: View {
    
    let midnightBlue = Color(red: 0,
     green: 0.2,
     blue: 0.4)
    
    //state variables - two way data binding
    @State var isAlertVisible : Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    @State var isAboutViewActive = false
    
    let maxScore = 100
    @State var score = 0
    @State var round = 1
    
    let beige = Color(red: 1.0, green: 0.84, blue: 0.70)
    
    var sliderValueRounded : Int {
        Int(sliderValue.rounded())
    }
    
    var sliderTargetDifference: Int {
     abs(sliderValueRounded - target)
    }
    
    var randomNumber : Int {
        Int.random(in: 1...100)
    }
    
    func pointForCurrentRound() -> Int{
        return maxScore - sliderTargetDifference
    }
    
    func alertTitle() -> String {
        let difference: Int = abs(self.sliderValueRounded -
                                  self.target)
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
    func resetSliderAndTarget() {
     sliderValue = Double.random(in: 1...100)
    }
    
    func startNewGame() {
        self.score = 0
        self.round = 1
        self.sliderValue = 50.0
        self.target = Int.random(in: 1...100)
    }
    
    
    fileprivate func updateScore() {
        score = score + pointForCurrentRound()
        target = randomNumber
        resetSliderAndTarget()
        round = round + 1
    }
    
    fileprivate func generateRandomNumber() {
        score = score + pointForCurrentRound()
    }
    
    var body: some View {
        NavigationView {
        VStack {
            //title
            Spacer().navigationBarTitle("Bulls Eye")
            HStack {
                Text("Put the bulls eye as close as: ")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .foregroundColor(Color.white)
                     .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Text("\(target)")
                    .font(Font.custom("Arial Rounded MT Bold", size: 24))
                     .foregroundColor(Color.yellow)
                     .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            
            //slider
            Spacer()
            HStack {
                Text("0")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                     .foregroundColor(Color.white)
                     .shadow(color: Color.black, radius: 5, x: 2, y: 2)
                Slider(value: self.$sliderValue, in: 1...100)
                    .accentColor(.green).animation(.easeOut)
                Text("100")
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                     .foregroundColor(Color.white)
                     .shadow(color: Color.black, radius: 5, x: 2, y: 2)
            }
            
            //alert on hit me button
            Spacer()
            Button(action: {
                self.isAlertVisible = true
                generateRandomNumber()
            }) {
                Text("Hit Me")
                    .padding(.all, 12)
                    .foregroundColor(.white)
                    .font(Font.custom("Arial Rounded MT Bold", size: 18))
                    .background(Color.red)
            }.alert(isPresented: self.$isAlertVisible){
                Alert(title: Text("\(alertTitle())"), message: Text("The slider value is \(sliderValueRounded) and the target value is \(target) \n your score is \(pointForCurrentRound())"), dismissButton: .default(Text("Awsome")){
                    
                    updateScore()
                    
                })
            }
            
            Spacer()
            HStack {
                //start over
                Button(action: {
                    startNewGame()
                }) {
                    Text("Start over")
                        .padding(.all, 12)
                        .foregroundColor(.white)
                        .font(Font.custom("Arial Rounded MT Bold", size: 18))
                        .background(Color.red)
                }
                //score
                Spacer()
                Text("Score")
                   
                Text("\(score)")
                    .modifier(ValueStyle())
                
                Spacer()
                //current round
                Text("Round")
                    .modifier(TextSizeModifier())
                Text("\(self.round)")
                    .modifier(ValueStyle())
                
                Spacer()
                //info button
                NavigationLink (destination: AboutView(), isActive: $isAboutViewActive){
                Button(action: {
                    isAboutViewActive = true
                }){
                    Text("Info")
                        .padding(.all, 12)
                        .font(Font.custom("Arial Rounded MT Bold", size: 18))
                        .foregroundColor(.white)
                        .background(Color.red)
                    }
                }

            }.padding(.bottom, 20)
            .accentColor(midnightBlue)
        }
        .onAppear(){
            startNewGame()
        }.background(
//            midnightBlue
//            GeometryReader { geo in
            
                Image("bulls_eye_bg")
                    .resizable()
//            }
        ).edgesIgnoringSafeArea(.bottom)
                .edgesIgnoringSafeArea(.leading)
                .edgesIgnoringSafeArea(.trailing)
        }
        .navigationViewStyle(.stack)
        
    }
}


//Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
