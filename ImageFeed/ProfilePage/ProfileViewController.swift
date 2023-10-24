
import UIKit

class ProfileViewController: UIViewController {
    private var avatarView: UIImageView?
    private var nameLabel: UILabel?
    private var loginLabel: UILabel?
    private var descriptionLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addImageView()
        self.addNameView()
        self.addLoginView()
        self.addDescriptionView()
        self.addLogoutButton()
    }
    
    private func addImageView() {
        let profileImage = UIImage(named: "userPick")
        let imageView = UIImageView(image: profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.avatarView = imageView
        
        view.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 70),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func addNameView() {
        let nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "Иванов Иван Иванович")
        
        let fontSize: CGFloat = 23.0
        let font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        
        let range = NSMakeRange(0, attributedText.length)
        attributedText.addAttribute(.font, value: font, range: range)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 0.78261
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        attributedText.addAttribute(.kern, value: 0.3, range: range)
        
        nameLabel.attributedText = attributedText
        nameLabel.textColor = .white
        self.nameLabel = nameLabel
        
        view.addSubview(nameLabel)
        
        guard let avatarView = self.avatarView else {
            return
        }
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: avatarView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 8)
        ])
    }
    
    private func addLoginView() {
        let loginLabel = UILabel()
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "@ivan3d")
        
        let fontSize: CGFloat = 13.0
        let font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        
        let range = NSMakeRange(0, attributedText.length)
        attributedText.addAttribute(.font, value: font, range: range)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.38462
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        loginLabel.attributedText = attributedText
        loginLabel.textColor = UIColor(named: "YP Gray")
        self.loginLabel = loginLabel
        
        view.addSubview(loginLabel)
        
        guard let nameLabel = self.nameLabel else {
            return
        }
        
        NSLayoutConstraint.activate([
            loginLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            loginLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func addDescriptionView() {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(string: "Hello World!")
        
        let fontSize: CGFloat = 13.0
        let font = UIFont.systemFont(ofSize: fontSize, weight: .light)
        
        let range = NSMakeRange(0, attributedText.length)
        attributedText.addAttribute(.font, value: font, range: range)

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.38462
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: range)

        descriptionLabel.attributedText = attributedText
        descriptionLabel.textColor = .white
        self.descriptionLabel = descriptionLabel
        
        view.addSubview(descriptionLabel)
        
        guard let loginLabel = self.loginLabel else {
            return
        }
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func addLogoutButton() {
        let logoutImage = UIImage(named: "Logout")
        let logoutButton = UIButton()
        logoutButton.setImage(logoutImage, for: .normal)
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(logoutButton)
        
        guard let avatarView = self.avatarView else {
            return
        }
        
        NSLayoutConstraint.activate([
            logoutButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16),
            logoutButton.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor)
        ])
    }
}
