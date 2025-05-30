import UIKit

class OnboardingSecondViewController: OnboardingBaseViewController {
    private let onboardingSecondView: OnboardingViewModel
    
    init() {
        self.onboardingSecondView = OnboardingViewModel(
            imageURL: "DemoImage",
            titleLabel: "Become a Savvy Global Citizen",
            subTitleLabel: "Discover tailored news that aligns with your interests and preferences. Your personalized news journey awaits!",
            leftButton: BottomButtons(buttonText: "Skip", buttonColor: .clear, labelColor: AppColorConstants.buttonColor_Green),
            rightButton: BottomButtons(buttonText: "Continue", buttonColor: AppColorConstants.buttonColor_Green, labelColor: .white)
        )
        super.init(screenDataView: self.onboardingSecondView)
    }
    
    @MainActor required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButtonAction = {
            self.navigationController?.pushViewController(DashboardViewController(), animated: true)
        }
        
        rightButtonAction = {
            self.navigationController?.pushViewController(OnboardingThirdViewController(), animated: true)
        }
    }
}
