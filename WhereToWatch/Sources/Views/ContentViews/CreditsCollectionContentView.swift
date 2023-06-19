import UIKit
import MovieDatabaseAPI

final class CreditsCollectionContentView: UIView, UIContentView {

    // MARK: Properties

    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        guard let screenSize = window?.windowScene?.screen.bounds.size else {
            return CGSize(width: 300, height: 300)
        }
        return CGSize(width: screenSize.width, height: screenSize.height * 0.20)
    }
    private var collectionView: UICollectionView?
    private var dataSource: DataSource?

    // MARK: View Lifecycle

    init(_ configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)

        configureCollectionView()
        configureDataSource()
        configureSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Methods

extension CreditsCollectionContentView {
    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration,
              let creditIDs = configuration.creditIDs else { return }
        updateSnapshot(creditIDs)
    }

    private func configureCollectionView() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.33),
            heightDimension: .fractionalHeight(1.0)
        )
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.contentInsets = NSDirectionalEdgeInsets(
            top: Constants.spacing, leading: Constants.spacing, bottom: Constants.spacing, trailing: Constants.spacing
        )
        let section = NSCollectionLayoutSection(group: group)
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.backgroundColor = Constants.collectionViewBackgroundColor
    }

    private func configureDataSource() {
        guard let collectionView else { return }
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration, for: indexPath, item: itemIdentifier
                )
            }
        )
    }

    private func configureSubviews() {
        guard let collectionView else { return }

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - DataSource

extension CreditsCollectionContentView {
    enum Section {
        case main
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Credit.ID>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Credit.ID>

    private func cellRegistrationHandler(
        cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Credit.ID
    ) {
        guard let configuration = configuration as? Configuration,
              let viewModel = configuration.viewModel,
              let credit = viewModel.credit(for: itemIdentifier) else { return }
        var contentConfiguration = cell.creditConfiguration()
        contentConfiguration.name = credit.name
        contentConfiguration.character = credit.character
        if credit.profilePath == nil {
            contentConfiguration.image = Constants.emptyImage
        }
        cell.contentConfiguration = contentConfiguration

        guard let profilePath = credit.profilePath else { return }
        Task {
            let image = await viewModel.image(imageSize: .w500, imagePath: profilePath)
            if indexPath == collectionView?.indexPath(for: cell) {
                contentConfiguration.image = image
                await MainActor.run {
                    cell.contentConfiguration = contentConfiguration
                }
            }
        }
    }

    private func updateSnapshot(_ creditIDs: [Credit.ID]) {
        var snapshot = Snapshot()
        snapshot.appendSections([.main])
        snapshot.appendItems(creditIDs)
        dataSource?.apply(snapshot)
    }
}

// MARK: - Configuration

extension CreditsCollectionContentView {
    struct Configuration: UIContentConfiguration {
        var viewModel: CreditsViewModel?
        var creditIDs: [Credit.ID]?

        func makeContentView() -> UIView & UIContentView {
            return CreditsCollectionContentView(self)
        }

        func updated(for state: UIConfigurationState) -> CreditsCollectionContentView.Configuration {
            return self
        }
    }
}

// MARK: - Constants

extension CreditsCollectionContentView {
    private enum Constants {
        static let collectionViewBackgroundColor = UIColor.systemBackground
        static let spacing = CGFloat(10)
        static let emptyImage = UIImage(named: "Empty")
    }
}

// MARK: - UICollectionViewCell

extension UICollectionViewCell {
    func creditsCollectionConfiguration() -> CreditsCollectionContentView.Configuration {
        return CreditsCollectionContentView.Configuration()
    }
}
