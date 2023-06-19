import UIKit

final class CreditContentView: UIView, UIContentView {

    // MARK: Properties

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: 150, height: 150)
    }

    private let imageView = UIImageView()
    private let nameLabel = UILabel()
    private let characterLabel = UILabel()
    private let labelStackView = UIStackView()
    private let outerStackView = UIStackView(frame: .zero)

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

extension CreditContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        imageView.image = configuration.image
        nameLabel.text = configuration.name
        characterLabel.text = configuration.character
    }

    private func configureSubviews() {
        nameLabel.font = Constants.nameFont
        characterLabel.font = Constants.characterFont
        [nameLabel, characterLabel].forEach { label in
            label.adjustsFontForContentSizeCategory = true
            label.numberOfLines = 0
            labelStackView.addArrangedSubview(label)
        }
        imageView.contentMode = .scaleAspectFit
        labelStackView.axis = .vertical
        labelStackView.distribution = .fill
        labelStackView.alignment = .center
        [imageView, labelStackView].forEach { view in
            outerStackView.addArrangedSubview(view)
        }
        outerStackView.axis = .vertical
        outerStackView.alignment = .center
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(outerStackView)

        nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        characterLabel.setContentHuggingPriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: Constants.imageViewRatio),
            imageView.heightAnchor.constraint(
                equalTo: labelStackView.heightAnchor, multiplier: Constants.imageViewLabelRatio
            ),
            outerStackView.topAnchor.constraint(equalTo: topAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            outerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Configuration

extension CreditContentView {
    struct Configuration: UIContentConfiguration {
        var image: UIImage?
        var name: String?
        var character: String?

        func makeContentView() -> UIView & UIContentView {
            return CreditContentView(self)
        }

        func updated(for state: UIConfigurationState) -> CreditContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension CreditContentView {
    private enum Constants {
        static let nameFont = UIFont.preferredFont(forTextStyle: .footnote)
        static let characterFont = UIFont.preferredFont(forTextStyle: .caption2)
        static let imageViewRatio = CGFloat(1/1.3)
        static let imageViewLabelRatio = CGFloat(5/3)
    }
}

extension UICollectionViewCell {
    func creditConfiguration() -> CreditContentView.Configuration {
        return CreditContentView.Configuration()
    }
}
