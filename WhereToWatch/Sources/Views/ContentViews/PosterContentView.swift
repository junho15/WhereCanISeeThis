import UIKit

final class PosterContentView: UIView, UIContentView {

    // MARK: Properties

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 100, height: 100)
    }
    private let backdropImageView = UIImageView()
    private let posterImageView = UIImageView()
    private let infoLabel = UILabel()
    private let gradient = CAGradientLayer()

    // MARK: View Lifecycle

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)
        backgroundColor = Constants.backgroundColor

        configureSubviews()
        configureGradient()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        gradient.frame = backdropImageView.bounds
    }
}

// MARK: - Methods

extension PosterContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        posterImageView.image = configuration.posterImage
        backdropImageView.image = configuration.backdropImage
        infoLabel.attributedText = AttributedStringMaker.posterDetail(
            title: configuration.title ?? "",
            year: configuration.year ?? "",
            genre: configuration.genre ?? ""
        ).attributedString
    }

    private func configureSubviews() {
        [backdropImageView, posterImageView].forEach { imageView in
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            addSubview(imageView)
        }

        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.numberOfLines = 0
        infoLabel.contentMode = .bottomLeft
        addSubview(infoLabel)

        let backdropRatioConstraint = backdropImageView.heightAnchor.constraint(
            equalTo: backdropImageView.widthAnchor, multiplier: Constants.backdropRatio
        )
        backdropRatioConstraint.priority = .defaultHigh
        NSLayoutConstraint.activate([
            backdropRatioConstraint,
            backdropImageView.topAnchor.constraint(equalTo: topAnchor),
            backdropImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backdropImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backdropImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            posterImageView.leadingAnchor.constraint(
                equalTo: backdropImageView.leadingAnchor, constant: Constants.spacing
            ),
            posterImageView.bottomAnchor.constraint(
                equalTo: backdropImageView.bottomAnchor, constant: -Constants.spacing
            ),
            posterImageView.widthAnchor.constraint(
                equalTo: backdropImageView.widthAnchor, multiplier: Constants.posterBackdropImageWidthRatio
            ),
            posterImageView.widthAnchor.constraint(
                equalTo: posterImageView.heightAnchor, multiplier: Constants.posterRatio
            ),
            infoLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: Constants.spacing),
            infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoLabel.bottomAnchor.constraint(equalTo: posterImageView.bottomAnchor)
        ])
    }

    private func configureGradient() {
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.0, 1.0]
        backdropImageView.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Configuration

extension PosterContentView {
    struct Configuration: UIContentConfiguration {
        var posterImage: UIImage?
        var backdropImage: UIImage?
        var title: String?
        var year: String?
        var genre: String?

        func makeContentView() -> UIView & UIContentView {
            return PosterContentView(self)
        }

        func updated(for state: UIConfigurationState) -> PosterContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension PosterContentView {
    private enum Constants {
        static let spacing = CGFloat(10)
        static let backgroundColor = UIColor.systemGray6
        static let backdropRatio = CGFloat(281)/CGFloat(500)
        static let posterBackdropImageWidthRatio = 0.2
        static let posterRatio = CGFloat(2)/CGFloat(3)
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    func posterContentView() -> PosterContentView.Configuration {
        return PosterContentView.Configuration()
    }
}
