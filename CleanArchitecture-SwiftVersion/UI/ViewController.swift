//
//  ViewController.swift
//  CleanArchitecture-SwiftVersion
//
//  Created by 김재윤 on 2023/08/24.
//

import UIKit
import Combine
import CombineCocoa
import CombineDataSources

final class ViewController: UIViewController {

    private var storeBag = Set<AnyCancellable>()
    private var viewModel: ViewModel?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.indentifier)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setConstraints()
        setViewModel()
        bind()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setViewModel() {
        let repository = DefaultDnDRepository()
        let defaultFetchClassListUseCase = DefaultFetchClassListUseCase(
            repository: repository
        )
        viewModel = ViewModel(fetchClassListUseCase: defaultFetchClassListUseCase)
    }
    
    private func bind() {
        let input = ViewModel.Input(
            fetchList: publisherViewWillAppear
        )
        
        let output = viewModel?.bind(input: input)
        
        output?.classList
            .receive(on: DispatchQueue.main)
            .bind(subscriber: tableView.rowsSubscriber(cellIdentifier: UITableViewCell.indentifier, cellType: UITableViewCell.self, cellConfig: { cell, indexPath, item in
                cell.textLabel?.text = item.name
            }))
            .store(in: &storeBag)
    }
}


