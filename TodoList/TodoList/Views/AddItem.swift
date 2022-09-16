import SwiftUI

struct AddItem: View {
    @State var alertText: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoViewModel:TodoViewModel
    @State var enteredItem: String = ""
    @State var alertTitle:String = ""
    
    var body: some View {
        ScrollView {
            TextField("Type your item", text: $enteredItem)
                .padding()
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(10)
            Button(action: {
                savePressed()
            }, label: {
                Text("SAVE")
                    .foregroundColor(.black)
                    .frame(maxWidth:.infinity)
                    .frame(height: 40)
                    .background(Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, y: 10)
            })            
            .navigationTitle("Add Item")
        }
        .padding()
        .alert(isPresented: $alertText, content: getAlert)
    }
    func savePressed() {
        if isAppropriate(){
            todoViewModel.addItem(title: enteredItem)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func isAppropriate() -> Bool {
        if enteredItem.count < 3{
            alertText.toggle()
            alertTitle = "Text must be minimum 3 letters long"
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddItem()
        }
        .environmentObject(TodoViewModel())
    }
}
