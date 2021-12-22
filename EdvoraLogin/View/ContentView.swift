//
//  ContentView.swift
//  EdvoraLogin
//
//  Created by SINDHYA ANOOP on 12/20/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Login()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .padding(.bottom, 9.0)
    }
}

// MARK: - Login View creation

struct Login : View {
    
    @ObservedObject var userNameObject = UserNameValidationObject()
    @ObservedObject var passwordObject = PasswordValidationObject()
    @ObservedObject var emailObject = EmailValidationObject()
    
    var body: some View{
        VStack(alignment: .center){
            Image("logo")
                .padding(.top,70)
                .padding(.bottom,70)
            
            CustomTextField(image: "person.fill", placeHolder: "The Edvorian", textLabel: "Username", error: userNameObject.error , txt: $userNameObject.userName)
                .autocapitalization(.none)
            
            ZStack {
                
                CustomTextField(image: "key.fill", placeHolder: "", textLabel: "Password", error: passwordObject.error, txt: self.$passwordObject.password)
                Button (action:{}){
                    
                    
                    //password secureField
                }
                Image(systemName: "eye.fill").foregroundColor(.gray)
                    .position(x: 317.0, y: 29.0)
                
            }
            
            CustomTextField(image: "at", placeHolder: "", textLabel: "Email address", error: emailObject.error, txt: self.$emailObject.email)
            
            
            Text("Forgotten password?")
                .fontWeight(.medium)
                .font(.subheadline)
                .foregroundColor(Color("customColor").opacity(0.7))
                .padding(.leading, 180.0)
                .padding(.bottom,52.0)
            
            VStack{
                Button (action:{}){
                    
                    //do specific task for button press
                    Text("LOGIN")
                        
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 302, height: 52)
                        .background(Color("customColor"))
                        .cornerRadius(8)
                    
                }
            }
            
            .padding(.bottom,10)
            
            HStack
            {
                Text("Don't have an account")
                    .foregroundColor(Color(.gray))
                
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("customColor").opacity(0.7))
                
            }
            .padding(.bottom,20)
        }
    }
    
}
// MARK: - Custom text field creation

struct CustomTextField : View {
    var image : String
    var placeHolder : String
    var textLabel: String
    var error : String
    @Binding var txt : String
    var body: some View
    {
        VStack(alignment: .leading){
            HStack{
                VStack {
                    
                    Text(textLabel).padding(.leading, -86.0).frame(width: 100, alignment: .leading).foregroundColor(.gray)
                        .font(.footnote)
                        .position(x: 136, y: -2)
                    HStack{
                        Spacer()
                        Image(systemName: image).foregroundColor(.gray)
                        TextField(placeHolder, text:$txt)
                    }
                    .padding()
                }
            }
            .frame(width: 302, height: 52, alignment: .center)
            .background(Color(.gray).opacity(0.05))
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray,lineWidth: 1))
            Text(error).fixedSize(horizontal: false, vertical: true)
                .font(.caption)
                .foregroundColor(.red)
        }.padding(.bottom,15)
    }
}
