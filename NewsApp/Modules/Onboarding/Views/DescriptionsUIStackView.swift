import UIKit

class DescriptionsUIStackView: UIStackView {
    private let title: String
    private let subTitle: String
    
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = self.title
        label.font = FontConstants.headingBold_H1_s32
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var subLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.text = self.subTitle
        label.font = FontConstants.subHeading_H1_s20
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(title: String, subTitle: String) {
        self.title = title
        self.subTitle = subTitle
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.axis = .vertical
        self.spacing = AppConstants.appConstants_s10
        self.alignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addArrangedSubview(mainLabel)
        self.addArrangedSubview(subLabel)        
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.topAnchor.constraint(equalTo: topAnchor),
            self.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
