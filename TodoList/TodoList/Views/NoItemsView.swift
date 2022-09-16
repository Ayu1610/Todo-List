import SwiftUI

struct NoItemsView: View {
    @State var animate : Bool = false
    let myColor = Color("MyColor")
    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                
                Text(" Please add the itmes which are to completed 🙄")
                    .font(.title)
                    .padding(.bottom, 20)
            NavigationLink(
                destination: AddItem(),
                label: {
                    Text("Add Items 🥳")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? myColor : Color.accentColor)
                        .cornerRadius(15)
                        .padding()
                })
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? myColor : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                        x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
                
                
            }
            .multilineTextAlignment(.center)

            .onAppear(perform:animateNow)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
    func animateNow(){
        
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
        
    }
        
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
        }
        
    }
}
