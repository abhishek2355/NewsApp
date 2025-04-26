import Foundation

class OnboardingViewModel {
    let imageURL: String
    let titleLabel: String
    let subTitleLabel: String
    let leftButton: BottomButtons
    let rightButton: BottomButtons
    
    init(imageURL: String, titleLabel: String, subTitleLabel: String, leftButton: BottomButtons, rightButton: BottomButtons) {
        self.imageURL = imageURL
        self.titleLabel = titleLabel
        self.subTitleLabel = subTitleLabel
        self.leftButton = leftButton
        self.rightButton = rightButton
    }
}
