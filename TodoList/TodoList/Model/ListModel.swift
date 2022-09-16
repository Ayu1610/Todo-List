import Foundation

struct ListModel: Identifiable, Codable {
    let id: String
    let title: String
    let isComplete: Bool
    
    init(id: String = UUID().uuidString, title: String, isComplete: Bool) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
    
    func updateCompletion() -> ListModel {
        return ListModel(id: id, title: title, isComplete: !isComplete)
    }
}
