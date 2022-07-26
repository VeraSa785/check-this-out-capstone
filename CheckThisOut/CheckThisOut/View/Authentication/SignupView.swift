//
//  SignupView.swift
//  CheckThisOut
//
//  Created by Vera Sazonova on 7/26/22.
//

import SwiftUI

struct SignupView: View {
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
//    @State var showAllertPasswordView = false
    
    @Environment(\.presentationMode) var mode
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        
        ZStack {
            
            BackgroundView()
            
            VStack {
                LogoView()
                    .padding(.bottom,25)
                
                VStack(spacing: 15) {
                    
                    UserTextField(text: $firstName, placeholder: "First Name")
                    UserTextField(text: $lastName, placeholder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeholder: "Password, enter > 6 characters")
                    PasswordSecureField(text: $confirmPassword, placeholder: "Confirm Password")
                    
                }// End of VStack
                .padding(.horizontal,32)
                
                Button {
                    //sign up action, dont have time to finish
                    if (password.count > 6) {
                        viewModel.register(withEmail: email, password: password, firstName: firstName, lastName: lastName)
                    } else {
                        print("password wrong")
//                        showAllertPasswordView = true
                    }
                    
                    
                } label: {
                    AuthenticateButton(text: "Sign Up")
                        .padding()
                }
                Spacer()
                
//                if showAllertPasswordView {
//                    BlankView()
//                    AllertPasswordView()
//                }
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.black)
                }
                .padding(.bottom,16)
                
            }// End of VStack
            .padding(.top,20)
            
            
            
        }// end of ZStack
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
