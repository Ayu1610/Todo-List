import SwiftUI

struct ListRow: View {
    
    let rowItem: ListModel
    
    var body: some View {
        HStack{
            Image(systemName: rowItem.isComplete ? "checkmark.circle" : "circle")
                .foregroundColor(rowItem.isComplete ? .green : .red)
            Text(rowItem.title)
        }
    }
}

struct ListRow_Previews: PreviewProvider {
    
    static var rowItem1 = ListModel(title: "First", isComplete: true)
    
    static var previews: some View {
        ListRow(rowItem: rowItem1)
    }
}
