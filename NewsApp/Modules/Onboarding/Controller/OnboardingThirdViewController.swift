import UIKit

class OnboardingThirdViewController: OnboardingBaseViewController {
    private let onboardingThirdView: OnboardingViewModel
    
    init() {
        self.onboardingThirdView = OnboardingViewModel(
            imageURL: "DemoImage",
            titleLabel: "Enhance your News Journey Now!",
            subTitleLabel: "Be part of our dynamic community and contribute your insights and participate in enriching conversations.",
            leftButton: BottomButtons(buttonText: "Skip", buttonColor: .clear, labelColor: UIColor(red: 76/255, green: 153/255, blue: 0/255, alpha: 1.0)),
            rightButton: BottomButtons(buttonText: "Continue", buttonColor: UIColor(red: 76/255, green: 153/255, blue: 0/255, alpha: 1.0), labelColor: .white)
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
