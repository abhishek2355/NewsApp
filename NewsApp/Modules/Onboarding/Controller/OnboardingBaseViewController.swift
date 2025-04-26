import UIKit

class OnboardingBaseViewController: UIViewController {
    private let onboardingViewModel: OnboardingViewModel
    var leftButtonAction: (() -> Void)?
    var rightButtonAction: (() -> Void)?
    
    private lazy var imageCarouselView: ImageCarouselView = {
        let imageView = ImageCarouselView(for: onboardingViewModel.imageURL)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionStackView: DescriptionsUIStackView = {
        let descriptionView = DescriptionsUIStackView(title: onboardingViewModel.titleLabel, subTitle: onboardingViewModel.subTitleLabel)
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        return descriptionView
    }()
    
    private lazy var bottomButtonStackView: UIStackView = {
        let buttonView = UIStackView()
        buttonView.distribution = .fillEqually
        buttonView.spacing = 50
        buttonView.addArrangedSubview(onboardingViewModel.leftButton)
        buttonView.addArrangedSubview(onboardingViewModel.rightButton)
        onboardingViewModel.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        onboardingViewModel.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()
    
    init(screenDataView: OnboardingViewModel) {
        self.onboardingViewModel = screenDataView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        // Image view
        view.addSubview(imageCarouselView)
        
        // Label and sub-lable view
        view.addSubview(descriptionStackView)
        
        // Bottom buttons
        view.addSubview(bottomButtonStackView)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageCarouselView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            imageCarouselView.topAnchor.constraint(equalTo: view.topAnchor),
            imageCarouselView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            descriptionStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionStackView.topAnchor.constraint(equalTo: imageCarouselView.bottomAnchor, constant: 32),
            descriptionStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptionStackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomButtonStackView.topAnchor),
            
            bottomButtonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            bottomButtonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            bottomButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
        ])
    }
    
    @objc
    private func leftButtonTapped() {
        leftButtonAction?()
    }
    
    @objc
    private func rightButtonTapped() {
        rightButtonAction?()
    }
}
