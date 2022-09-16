import Foundation

class TodoViewModel: ObservableObject{
    
    @Published var rowItem:[ListModel] = [] {
        didSet{
            saveItems()
        }
    }
    let itemsKey = "list_items"
    init() {
        getItems()
    }
    func getItems(){
        guard
            let data =  UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ListModel].self, from: data)
        else
        { return }
        self.rowItem = savedItems
    }
    func onDelete(indexSet : IndexSet) {
        rowItem.remove(atOffsets: indexSet)
    }
    func onMove(indices : IndexSet, newOffset : Int) {
        rowItem.move(fromOffsets: indices, toOffset: newOffset)
    }
    func addItem(title: String) {
        let newItem = ListModel(title: title, isComplete: false)
        rowItem.append(newItem)
    }
    func UpdateItem(items: ListModel) {
       if let index = rowItem.firstIndex(where: {$0.id == items.id}) {
        rowItem[index] = items.updateCompletion()
        }
    }
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(rowItem) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
