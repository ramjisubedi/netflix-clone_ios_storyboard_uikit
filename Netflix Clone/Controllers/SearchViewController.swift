//
//  UpcomingViewController.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 29/08/2022.
//

import UIKit

class SearchViewController: UIViewController {
        
    private var titles: [Title] = [Title]()
        
    private let discoverTable: UITableView = {
            let table = UITableView()
            //table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
            table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
            return table
        }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController:SearchResultsViewController())
        controller.searchBar.placeholder = "Search for a movie or a Tv show"
        controller.searchBar.searchBarStyle = .minimal
        return controller
    }()

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            view.backgroundColor = .systemBackground
            
            title = "Search"
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationItem.largeTitleDisplayMode = .always
            navigationItem.searchController = searchController
            view.addSubview(discoverTable)
            discoverTable.delegate = self
            discoverTable.dataSource = self
            navigationController?.navigationBar.tintColor = .white
            
            
            fetchUpcoming()
        }
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            discoverTable.frame = view.bounds
        }
        
        
        private func fetchUpcoming(){
            
                    // upcomming movies
                    APICaller.shated.getDiscoverMoview { [weak self] result in
                        switch result {
                        case .success(let movies):
                            print("Discover API DATA")
                            print(movies)
                            //cell.configure(movies)
                            self?.titles = movies
                            DispatchQueue.main.async {
                                self?.discoverTable.reloadData()
                            }
                            
                        case .failure(let error):
                            print(error)
                        }
                    }
            
        }

    }

    extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return titles.count
        }
        
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    //        //cell.textLabel?.text = "test"
    //
    //        cell.textLabel?.text = titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown"
    //        return cell
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else{
                return UITableViewCell()
            }
            let title = titles[indexPath.row]
            let model = TitleViewModel(titleName: title.original_title ?? title.original_name ?? "Unknow", posterURL: title.poster_path ?? "Unknow")
            cell.configure(with: model)
            return cell
            
            
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    }

