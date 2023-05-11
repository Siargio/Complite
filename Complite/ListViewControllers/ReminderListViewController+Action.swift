//
//  ReminderListViewController+Action.swift
//  Complite
//
//  Created by Sergio on 11.05.23.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(width: id)
    }
}
