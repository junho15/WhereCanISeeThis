import UIKit

final class WatchProviderCollectionContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            configure(configuration)
        }
    }
    override var intrinsicContentSize: CGSize {
        guard let screenSize = window?.windowScene?.screen.bounds.size else {
            return CGSize(width: 300, height: 75)
        }
        return CGSize(width: screenSize.width, height: screenSize.height * 0.08)
    }
    private var collectionView: UICollectionView?
    private var dataSource: DataSource?

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

    func configure(_ configuration: UIContentConfiguration) {
        guard let configuration = configuration as? Configuration else { return }
        updateSnapshot(configuration.items ?? [])
    }

    private func configureCollectionView() {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .estimated(75),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(Constants.spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: Constants.spacing, leading: Constants.spacing, bottom: Constants.spacing, trailing: Constants.spacing
        )
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        configuration.scrollDirection = .horizontal
        let layout = UICollectionViewCompositionalLayout(section: section, configuration: configuration)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    }

    private func configureDataSource() {
        guard let collectionView else { return }
        let watchProviderCellRegistration = UICollectionView.CellRegistration(
            handler: watchProviderCellRegistrationHandler
        )
        dataSource = DataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, itemIdentifier in
                return collectionView.dequeueConfiguredReusableCell(
                    using: watchProviderCellRegistration, for: indexPath, item: itemIdentifier
                )
            })
    }

    private func configureSubviews() {
        guard let collectionView else { return }
        collectionView.backgroundColor = Constants.collectionViewBackgroundColor

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

extension WatchProviderCollectionContentView {
    enum Section {
        case main
    }

    enum Row: Hashable {
        case item(image: UIImage?, title: String?)
    }

    typealias DataSource = UICollectionViewDiffableDataSource<Section, Row>
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Row>

    private func watchProviderCellRegistrationHandler(
        _ cell: UICollectionViewCell, indexPath: IndexPath, itemIdentifier: Row
    ) {
        guard case.item(let image, let title) = itemIdentifier else { return }
        var contentConfiguration = cell.watchProviderConfiguration()
        contentConfiguration.image = image
        contentConfiguration.title = title
        cell.contentConfiguration = contentConfiguration
    }

    private func updateSnapshot(_ items: [(image: UIImage?, title: String?)] = []) {
        var snapShot = Snapshot()
        snapShot.appendSections([.main])
        snapShot.appendItems(items.map { .item(image: $0.image, title: $0.title) }, toSection: .main)
        dataSource?.apply(snapShot)
    }
}

extension WatchProviderCollectionContentView {
    struct Configuration: UIContentConfiguration {
        var items: [(image: UIImage?, title: String?)]?

        func makeContentView() -> UIView & UIContentView {
            return WatchProviderCollectionContentView(self)
        }

        func updated(for state: UIConfigurationState) -> WatchProviderCollectionContentView.Configuration {
            return self
        }
    }
}

extension WatchProviderCollectionContentView {
    private enum Constants {
        static let collectionViewBackgroundColor = UIColor.systemBackground
        static let spacing = CGFloat(5)
    }
}

extension UICollectionViewCell {
    func watchProviderCollectionConfiguration() -> WatchProviderCollectionContentView.Configuration {
        return WatchProviderCollectionContentView.Configuration()
    }
}
