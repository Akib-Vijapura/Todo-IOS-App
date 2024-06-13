import SwiftUI

struct LoginView: View {
    
   @StateObject var ViewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(
                    title: "To Do List",
                    subtitle: "Get things done!",
                    color: .blue
                )
                
                // Login Form
                Form {
                    
                    if !ViewModel.errorMessage.isEmpty{
                        Text(ViewModel.errorMessage)
                            .foregroundStyle(.red)
                    }
                    
                    TextField("Email Address", text: $ViewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 20)
                    SecureField("Password", text: $ViewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 20)
                    
                    Button {
                        // Attempt login
                        ViewModel.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.blue)
                            Text("Login")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                        }
                        .padding()
                    }
                }
                .padding(.top, 80)
                
                // Create Account
                VStack {
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
