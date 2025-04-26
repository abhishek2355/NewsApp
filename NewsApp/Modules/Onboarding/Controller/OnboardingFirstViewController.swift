import UIKit

class OnboardingFirstViewController: OnboardingBaseViewController {
    private let onboardingFirstView: OnboardingViewModel
    
    init() {
        self.onboardingFirstView = OnboardingViewModel(
            imageURL: "DemoImage",
            titleLabel: "Stay Connected, Everywhere, Anytime",
            subTitleLabel: "Welcome to NewsApp, your ultimate destination for breaking news, exclusive stories, and tailored content.",
            leftButton: BottomButtons(buttonText: "Skip", buttonColor: .clear, labelColor: UIColor(red: 76/255, green: 153/255, blue: 0/255, alpha: 1.0)),
            rightButton: BottomButtons(buttonText: "Continue", buttonColor: UIColor(red: 76/255, green: 153/255, blue: 0/255, alpha: 1.0), labelColor: .white)
        )
        super.init(screenDataView: self.onboardingFirstView)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButtonAction = {
            self.navigationController?.pushViewController(DashboardViewController(), animated: true)
        }
        
        rightButtonAction = {
            self.navigationController?.pushViewController(OnboardingSecondViewController(), animated: true)
        }
    }
}
