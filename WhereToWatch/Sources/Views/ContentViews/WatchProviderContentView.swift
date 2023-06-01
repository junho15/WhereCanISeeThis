import UIKit

final class WatchProviderContentView: UIView, UIContentView {

    // MARK: Properties

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        CGSize(width: 75, height: 75)
    }
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let stackView = UIStackView()

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

extension WatchProviderContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        imageView.image = configuration.image
        titleLabel.text = configuration.title
    }

    private func configureSubviews() {
        imageView.contentMode = .scaleAspectFit
        titleLabel.font = Constants.titleFont
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.textAlignment = .center

        stackView.axis = .vertical
        stackView.spacing = Constants.spacing
        [imageView, titleLabel].forEach(stackView.addArrangedSubview)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.widthAnchor.constraint(lessThanOrEqualToConstant: Constants.maxWidth)
        ])
    }
}

// MARK: - Configuration

extension WatchProviderContentView {
    struct Configuration: UIContentConfiguration {
        var image: UIImage?
        var title: String?

        func makeContentView() -> UIView & UIContentView {
            return WatchProviderContentView(self)
        }

        func updated(for state: UIConfigurationState) -> WatchProviderContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension WatchProviderContentView {
    private enum Constants {
        static let titleFont = UIFont.preferredFont(forTextStyle: .caption2)
        static let spacing = CGFloat(5)
        static let maxWidth = CGFloat(100)
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    func watchProviderConfiguration() -> WatchProviderContentView.Configuration {
        return WatchProviderContentView.Configuration()
    }
}
