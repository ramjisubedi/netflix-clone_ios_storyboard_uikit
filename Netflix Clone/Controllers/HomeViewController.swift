//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Ramji Subedi on 29/08/2022.
//

import UIKit

// fetchData ma dherai vayer case use garera garna lako
enum Sections: Int{
    case TrendingMovies = 0
    case TrendingTv = 1
    case Popular = 2
    case Upcomming = 3
    case TopRated = 4
}

class HomeViewController: UIViewController {
    
    let sectionTitle: [String] = ["Treding Movies", "Trending Tv", "Popular",  "Upcomming Movies", "Top rated"]
    
    private let homeFeedTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        // call CollectionViewTableViewCell calss from ViewModels
        table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.indentifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        // add subview
        view.addSubview(homeFeedTable)
        
        homeFeedTable.delegate = self
        homeFeedTable.dataSource = self
        
        // nav bar configure
        
        configureNavBar()
        
        let headerView = HeroHeaderUIView(frame: CGRect(x:0,y:0, width: view.bounds.width, height:400))
        //homeFeedTable.tableHeaderView = UIView(frame: CGRect(x:0,y:0, width: view.bounds.width, height:450))
        homeFeedTable.tableHeaderView = headerView
        
         //fetchData()
        //getTrendingMovies()
        //getTrendingTv()

    }
    
    private func configureNavBar(){
        var image = UIImage(named: "netflix")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil),
        ]
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    
    
//    // sabai yeutai bata garna try gareko
//    private func fetchData(){
//
//        // trending movies api call greko data
//        APICaller.shated.getTrendingMovies { results in
//            switch results {
//            case .success(let movies):
//                print("Movies API DATA")
//                print(movies)
//                //cell.configure(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//        // trending TV
//        APICaller.shated.getTrendingTv { results in
//            switch results {
//            case .success(let movies):
//                print("TV API DATA")
//                print(movies)
//                //cell.configure(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//        // upcomming movies
//        APICaller.shated.getUpcomingMoview { results in
//            switch results {
//            case .success(let movies):
//                print("Upcoming API DATA")
//                print(movies)
//                //cell.configure(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//        // popular movies
//        APICaller.shated.getPopular { results in
//            switch results {
//            case .success(let movies):
//                print("Popular API DATA")
//                print(movies)
//                //cell.configure(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//        // popular movies
//        APICaller.shated.getTopRated { results in
//            switch results {
//            case .success(let movies):
//                print("Top Rated API DATA")
//                print(movies)
//                //cell.configure(movies)
//            case .failure(let error):
//                print(error)
//            }
//        }
//
//
//    }
    
    
    // different different gerera API call gareda
    private func getTrendingMovies(){
        //APICaller.shated.getTrendingMovies{_ in}
        APICaller.shated.getTrendingMovies { results in
            switch results {
            case .success(let movies):
                print("Movies API DATA")
                print(movies)
                //cell.configure(movies)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getTrendingTv(){
        //APICaller.shated.getTrendingMovies{_ in}
        APICaller.shated.getTrendingTv { results in
            switch results {
            case .success(let tv):
                print("TV API DATA")
                print(tv)
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // set number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitle.count
    }
    
    // set number of row in each sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    // loop for table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        // set text for each row
//        cell.textLabel?.text = "MERO LIST"
//        //change background color
//        cell.backgroundColor = .systemTeal
//        return cell
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.indentifier, for: indexPath) as? CollectionViewTableViewCell else{
            return UITableViewCell()
        }
       
        switch indexPath.section {
        case Sections.TrendingMovies.rawValue:
            APICaller.shated.getTrendingMovies { results in
                switch results {
                case .success(let titles):
                    print("Movies API DATA")
                    print(titles)
                    cell.configure(with:titles)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.TrendingTv.rawValue:
            APICaller.shated.getTrendingTv { results in
                switch results {
                case .success(let titles):
                    print("TV API DATA")
                    print(titles)
                    cell.configure(with:titles)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Popular.rawValue:
            APICaller.shated.getPopular { results in
                switch results {
                case .success(let titles):
                    print("Popular API DATA")
                    print(titles)
                    cell.configure(with:titles)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.Upcomming.rawValue:
            APICaller.shated.getUpcomingMoview { results in
                switch results {
                case .success(let titles):
                    print("TV API DATA")
                    print(titles)
                    cell.configure(with:titles)
                case .failure(let error):
                    print(error)
                }
            }
        case Sections.TopRated.rawValue:
            APICaller.shated.getTopRated { results in
                switch results {
                case .success(let titles):
                    print("Top ated API DATA")
                    print(titles)
                    cell.configure(with:titles)
                case .failure(let error):
                    print(error)
                }
            }
            
        default:
            return UITableViewCell()
        }
        
        
        return cell
    }
    // set height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    // transform top logo section when scroll
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultOffset = view.safeAreaInsets.top
        let offeset = scrollView.contentOffset.y + defaultOffset
        
        navigationController?.navigationBar.transform = .init(translationX: 0, y: min (0,-offeset))
    }
    
    
    // set section title in header section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int)-> String?{
        return sectionTitle[section]
    }
    
    // display property for header section title
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        guard let header = view as? UITableViewHeaderFooterView else{return}
        
        header.textLabel?.font = .systemFont(ofSize: 18, weight : .semibold)
        header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
        header.textLabel?.textColor = .white
        //header.textLabel?.text = header.textLabel?.text?.lowercased()
        // create extension capitalizeFirstLetter for change first letter to be capital
        //capitalizeFirstLetter is custome function
        header.textLabel?.text = header.textLabel?.text?.capitalizeFirstLetter()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
