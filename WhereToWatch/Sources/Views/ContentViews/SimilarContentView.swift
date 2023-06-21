import UIKit

final class SimilarContentView: UIView, UIContentView {

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

extension SimilarContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        imageView.image = configuration.image
        titleLabel.text = configuration.title
    }

    private func configureSubviews() {
        titleLabel.font = Constants.titleFont
        titleLabel.adjustsFontForContentSizeCategory = true
        imageView.contentMode = .scaleAspectFit
        stackView.axis = .vertical
        stackView.alignment = .center
        [imageView, titleLabel].forEach { view in
            stackView.addArrangedSubview(view)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)

        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: Constants.imageViewRatio),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Configuration

extension SimilarContentView {
    struct Configuration: UIContentConfiguration {
        var image: UIImage?
        var title: String?

        func makeContentView() -> UIView & UIContentView {
            return SimilarContentView(self)
        }

        func updated(for state: UIConfigurationState) -> SimilarContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension SimilarContentView {
    private enum Constants {
        static let titleFont = UIFont.preferredFont(forTextStyle: .caption2)
        static let imageViewRatio = CGFloat(1/1.3)
    }
}
extension UICollectionViewCell {
    func similarConfiguration() -> SimilarContentView.Configuration {
        return SimilarContentView.Configuration()
    }
}
