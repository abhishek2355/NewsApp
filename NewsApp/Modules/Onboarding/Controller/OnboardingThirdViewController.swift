import UIKit

class OnboardingThirdViewController: OnboardingBaseViewController {
    private let onboardingThirdView: OnboardingViewModel
    
    init() {
        self.onboardingThirdView = OnboardingViewModel(
            imageURL: "DemoImage",
            titleLabel: "Enhance your News Journey Now!",
            subTitleLabel: "Be part of our dynamic community and contribute your insights and participate in enriching conversations.",
            leftButton: BottomButtons(buttonText: "Skip", buttonColor: .clear, labelColor: AppColorConstants.buttonColor_Green),
            rightButton: BottomButtons(buttonText: "Continue", buttonColor: AppColorConstants.buttonColor_Green, labelColor: .white)
        )
        super.init(screenDataView: self.onboardingThirdView)
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
            self.navigationController?.pushViewController(DashboardViewController(), animated: true)
        }
    }
}
