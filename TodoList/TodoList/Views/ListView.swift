import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var todoViewModel: TodoViewModel
    var body: some View {
        
          ZStack {
              if todoViewModel.rowItem.isEmpty{
                      NoItemsView()
              } else {
            List{
                ForEach(todoViewModel.rowItem) { items in
                    ListRow(rowItem: items)
                        .onTapGesture(perform: {
                            withAnimation(.linear) {
                            todoViewModel.UpdateItem(items: items)
                            }
                        })
                }
                .onDelete(perform: todoViewModel.onDelete)
                .onMove(perform: todoViewModel.onMove)
            }
            .navigationTitle("Todo List")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddItem()))
    }
          }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(TodoViewModel())
    }
}
}

