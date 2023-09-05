import UIKit

final class HeaderContentView: UIView, UIContentView {

    // MARK: Properties

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }

    private let titleLabel = UILabel()
    private let button = UIButton()
    private var buttonAction: UIAction?

    // MARK: View Lifecycle

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension HeaderContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        titleLabel.attributedText = configuration.attributedText

        if let buttonTitle = configuration.buttonTitle {
            button.isHidden = false
            button.setTitle(buttonTitle, for: .normal)
        } else {
            button.isHidden = true
        }

        if let buttonAction {
            button.removeAction(buttonAction, for: .touchUpInside)
        }
        self.buttonAction = configuration.buttonAction
        if let buttonAction {
            button.addAction(buttonAction, for: .touchUpInside)
        }
    }

    private func configureSubviews() {
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0

        button.titleLabel?.font = Constants.buttonFont
        button.setTitleColor(Constants.buttonTextColor, for: .normal)

        [titleLabel, button].forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constants.spacing),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.spacing),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.spacing),

            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacing),
            button.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}

// MARK: - Configuration

extension HeaderContentView {
    struct Configuration: UIContentConfiguration {
        var attributedText: NSAttributedString?
        var buttonTitle: String?
        var buttonAction: UIAction?

        func makeContentView() -> UIView & UIContentView {
            return HeaderContentView(self)
        }

        func updated(for state: UIConfigurationState) -> HeaderContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension HeaderContentView {
    private enum Constants {
        static let buttonFont = UIFont.preferredFont(forTextStyle: .caption1)
        static let buttonTextColor = UIColor.systemGray
        static let spacing = CGFloat(10)
        static let imageViewRatio = 1/1.3
    }
}

// MARK: - UICollectionViewCell
extension UICollectionViewCell {
    func headerConfiguration() -> HeaderContentView.Configuration {
        return HeaderContentView.Configuration()
    }
}
