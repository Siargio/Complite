//
//  ViewController.swift
//  Complite
//
//  Created by Sergio on 10.05.23.
//

import UIKit

final class ReminderListViewController: UICollectionViewController {

    //MARK: - Properties

    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData

    var listStyle: ReminderListStyle = .today

    //MARK: - UIElements

    let listStyleSegmentedControl = UISegmentedControl(items: [
        ReminderListStyle.today.name, ReminderListStyle.future.name, ReminderListStyle.all.name
    ])

    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout

        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)

        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }

        updateSnapshot()
        collectionView.dataSource = dataSource

        setupNavigation()
    }

    //MARK: - Setups

    override func collectionView(
            _ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath
        ) -> Bool {
            let id = reminders[indexPath.item].id
            pushDetailViewForReminder(withId: id)
            return false
        }

        func pushDetailViewForReminder(withId id: Reminder.ID) {
            let reminder = reminder(withID: id)
            let viewController = ReminderViewController(reminder: reminder)
            navigationController?.pushViewController(viewController, animated: true)
        }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }

    private func setupNavigation() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didPressAddButton(_:)))
        addButton.tintColor = .black
        addButton.accessibilityLabel = NSLocalizedString(
            "Add reminder", comment: "Add button accessibility label")
        navigationItem.rightBarButtonItem = addButton

        listStyleSegmentedControl.selectedSegmentIndex = listStyle.rawValue
        listStyleSegmentedControl.addTarget(
            self, action: #selector(didChangeListStyle(_:)), for: .valueChanged)
        navigationItem.titleView = listStyleSegmentedControl

    }

    @objc func didChangeListStyle(_ sender: UISegmentedControl) {
        listStyle = ReminderListStyle(rawValue: sender.selectedSegmentIndex) ?? .today
        //        updateSnapshot()
        //        refreshBackground()
    }

    @objc func didPressAddButton(_ sender: UIBarButtonItem) {

    }

}
