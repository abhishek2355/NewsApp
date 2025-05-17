import Foundation

struct NewsItem {
    let title: String
    let description: String
    let authersName: String
    let dateTime: Date
    let imageName: String
    
    init(title: String, description: String, authersName: String, dateTime: Date, imageName: String) {
        self.title = title
        self.description = description
        self.authersName = authersName
        self.dateTime = dateTime
        self.imageName = imageName
    }
}
