import Foundation

struct NewsItem {
    let title: String
    let description: String
    let imageName: String
    
    init(title: String, description: String, imageName: String) {
        self.title = title
        self.description = description
        self.imageName = imageName
    }
}
