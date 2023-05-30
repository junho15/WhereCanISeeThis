import UIKit

final class MediaContentView: UIView, UIContentView {

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
    private let outerStackView = UIStackView()
    private let innerStackView = UIStackView()
    private let titleLabel = UILabel()
    private let dateLabel = UILabel()
    private let genreLabel = UILabel()

    // MARK: View Lifecycle

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: CGRect(x: 0, y: 0, width: 150, height: 150))

        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension MediaContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        imageView.image = configuration.image
        titleLabel.text = configuration.title
        dateLabel.text = configuration.date
        genreLabel.text = configuration.genre
    }

    private func configureSubviews() {
        imageView.contentMode = .scaleAspectFit
        innerStackView.axis = .vertical
        innerStackView.spacing = Constants.spacing
        outerStackView.alignment = .top
        outerStackView.spacing = Constants.spacing
        titleLabel.font = Constants.titleFont
        dateLabel.font = Constants.defaultFont
        genreLabel.font = Constants.defaultFont
        [titleLabel, dateLabel, genreLabel].forEach { label in
            label.adjustsFontForContentSizeCategory = true
            label.numberOfLines = 0
            innerStackView.addArrangedSubview(label)
        }

        [imageView, innerStackView].forEach(outerStackView.addArrangedSubview)
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(outerStackView)

        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        genreLabel.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        NSLayoutConstraint.activate([
            outerStackView.topAnchor.constraint(equalTo: topAnchor),
            outerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.spacing),
            outerStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.widthAnchor.constraint(
                lessThanOrEqualTo: imageView.heightAnchor, multiplier: Constants.imageViewRatio
            )
        ])
    }
}

// MARK: - Configuration

extension MediaContentView {
    struct Configuration: UIContentConfiguration {
        var image: UIImage?
        var title: String?
        var date: String?
        var genre: String?

        func makeContentView() -> UIView & UIContentView {
            return MediaContentView(self)
        }

        func updated(for state: UIConfigurationState) -> MediaContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension MediaContentView {
    private enum Constants {
        static let titleFont = UIFont.preferredFont(forTextStyle: .body)
        static let defaultFont = UIFont.preferredFont(forTextStyle: .caption1)
        static let spacing = CGFloat(10)
        static let imageViewRatio = 1/1.3
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    func mediaContentView() -> MediaContentView.Configuration {
        return MediaContentView.Configuration()
    }
}
