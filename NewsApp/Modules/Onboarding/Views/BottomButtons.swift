import UIKit

class BottomButtons: UIButton {
    let buttonLabel: String
    let buttonBackgroundColor: UIColor
    let buttonLabelColor: UIColor
    
    init(buttonText: String, buttonColor: UIColor, labelColor: UIColor) {
        self.buttonLabel = buttonText
        self.buttonBackgroundColor = buttonColor
        self.buttonLabelColor = labelColor
        
        super.init(frame: .zero)
        
        setupButtonLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButtonLayout() {
        self.setTitle(self.buttonLabel, for: .normal)
        self.titleLabel?.font = FontConstants.subHeading_H1_s20
        self.setTitleColor(self.buttonLabelColor, for: .normal)
        self.backgroundColor = self.buttonBackgroundColor
        self.layer.cornerRadius = AppConstants.appConstants_s30
        self.layer.borderColor = AppColorConstants.buttonColor_Green.cgColor
        self.layer.borderWidth = AppConstants.appConstants_s1
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: leadingAnchor),
            self.trailingAnchor.constraint(equalTo: trailingAnchor),
            self.topAnchor.constraint(equalTo: topAnchor),
            self.bottomAnchor.constraint(equalTo: bottomAnchor),
            self.heightAnchor.constraint(equalToConstant: AppConstants.appConstants_s60),
        ])
    }
}
