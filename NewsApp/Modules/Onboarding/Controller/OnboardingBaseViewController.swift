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
        buttonView.spacing = AppConstants.appConstants_s50
        buttonView.addArrangedSubview(onboardingViewModel.leftButton)
        buttonView.addArrangedSubview(onboardingViewModel.rightButton)
        onboardingViewModel.leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        onboardingViewModel.rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        return buttonView
    }()
    
    private lazy var onboardingContentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var onboardingScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.showsVerticalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
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
        self.view.backgroundColor = AppColorConstants.appBackgroundColor
        setupView()
    }
    
    func setupView() {
        // Image view
        onboardingContentView.addSubview(imageCarouselView)
        
        // Label and sub-lable view
        onboardingContentView.addSubview(descriptionStackView)
        
        onboardingScrollView.addSubview(onboardingContentView)
        
        view.addSubview(onboardingScrollView)
        
        // Bottom buttons
        view.addSubview(bottomButtonStackView)

        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            onboardingScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            onboardingScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            onboardingScrollView.bottomAnchor.constraint(equalTo: bottomButtonStackView.topAnchor, constant: -AppConstants.appConstants_s10),
            
            onboardingContentView.leadingAnchor.constraint(equalTo: onboardingScrollView.leadingAnchor),
            onboardingContentView.topAnchor.constraint(equalTo: onboardingScrollView.topAnchor),
            onboardingContentView.trailingAnchor.constraint(equalTo: onboardingScrollView.trailingAnchor),
            onboardingContentView.bottomAnchor.constraint(equalTo: onboardingScrollView.bottomAnchor),
            onboardingContentView.widthAnchor.constraint(equalTo: onboardingScrollView.widthAnchor),
            
            imageCarouselView.leadingAnchor.constraint(equalTo: onboardingContentView.leadingAnchor),
            imageCarouselView.topAnchor.constraint(equalTo: onboardingContentView.topAnchor),
            imageCarouselView.trailingAnchor.constraint(equalTo: onboardingContentView.trailingAnchor),
            
            descriptionStackView.leadingAnchor.constraint(equalTo: onboardingContentView.leadingAnchor, constant: AppConstants.appConstants_s16),
            descriptionStackView.topAnchor.constraint(equalTo: imageCarouselView.bottomAnchor, constant: AppConstants.appConstants_s32),
            descriptionStackView.trailingAnchor.constraint(equalTo: onboardingContentView.trailingAnchor, constant: -AppConstants.appConstants_s16),
            descriptionStackView.bottomAnchor.constraint(lessThanOrEqualTo: onboardingContentView.bottomAnchor),
            
            bottomButtonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: AppConstants.appConstants_s16),
            bottomButtonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -AppConstants.appConstants_s16),
            bottomButtonStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -AppConstants.appConstants_s10),
            
            
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
