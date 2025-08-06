//
//  ContentView.swift
//  InteractiveUIModelWithProperty
//

import SwiftUI

struct ContentView: View {
    
    @State private var name = ""
    //var name = "" is a *property* because it is a variable specific to the structure of the ContentView. For this app, the var name is set to an empty string to prompt that nothing is entered upon the app opening.
    //@State is a *property wrapper*. It tells Swift to keep track of the variable and update the interface based on the user's input. We use the @State property wrapper when data is likely to change and needs to be updated and reflected in UI accordingly.
    //Marking @State properties as *private* emphasizes that the state is local to the view—it doesn't get shared outside of where it was created.
    
    @State private var textTitle = "What is your name?"
    //Creates the property textTitle, wrapping it in @State private indicates  the textTitle will change over time based on user input and won't get shared outside of where it was created. (Based on how the code below is written, textTitle will change to Welcome, name! after the user enters a name and clicks the Submit button).
    //Entering an initial string (instead of a blank one like we did for name above) makes the default text "What is your name?" when the app is opened for the first time and/or nothing is submitted in the text field.
    
    
    var body: some View {
        
        VStack{
            
            Text(textTitle)
                .font(.title)
            
            TextField("Type Your Name Here...", text: $name)
            //$ means that there is 2 way binding. This prompts Swift to keep track of user's changes to the variable at this point in the code. In this case, when the user enters text, it updates the property name.
                .multilineTextAlignment(.center)
                .font(.title)
                .border(Color.gray, width: 1)
            
            Button("Submit Name") {
                textTitle = "Welcome, \(name)!"
            }//end Button
            //  Changes the property textTitle to be the string "Welcome (with name that is entered)!" after the button is clicked
            //  No dollar sign is needed for name property here because we want the program to return the value the user entered rather than store it. In other words, the name property isn't changing here, therefore no binding needed.
                .font(.title2)
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            
        }//end VStack
        .padding()
    }//end body
}//end struct


#Preview {
    ContentView()
}
