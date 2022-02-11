//
//  TrendingView.swift
//  Cinefilo
//
//  Created by Moacir Ezequiel Lamego on 10/02/22.
//

import Foundation
import UIKit

class TrendingView: UIView {
    
    // MARK: Constants
    private let cellId = "trendingId"
    private let rowHeight:CGFloat = 300

    
    var onSelectedTrending: ((_ trendingSelected: TrendingsViewModel) -> Void)?
    var onPullToRefresh: (() -> Void)?
    
    // MARK: - Itens Visuais
    lazy var tableView: UITableView = {
            let tv = UITableView(frame: .zero, style: .plain)
            tv.translatesAutoresizingMaskIntoConstraints = false
            tv.backgroundColor = .lightGray
            tv.delegate = self
            tv.dataSource = self
            tv.register(TrendingTableViewCell.self, forCellReuseIdentifier: self.cellId)
            return tv
    }()
    
    // MARK: Variáveis
    var viewSpinner = ViewSpinner()    
    
    // MARK: Inicializadores
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadUIElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: DesInicializadores
    
    deinit {
        
    }
    
    // MARK: Load Elementos Visuais
    
    private func loadUIElements() {
        setupTableView()
    }
    
    private func setupTableView() {
        self.addSubview(tableView)

        tableView.backgroundColor = .lightGray
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    // MARK: - Activities
    
    @objc private func didPullToRefresh() {
        onPullToRefresh?()
    }
}

extension TrendingView: UITableViewDataSource {
    //
    // MARK: :-) CELL
    //

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStore.trendingsDataStore.trending.trendingsResults.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.rowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TrendingTableViewCell
        
        DispatchQueue.main.async {
            cell.activityIndicator.startAnimating()
        }
        
        let trending = DataStore.trendingsDataStore.trending.trendingsResults[indexPath.row]

        loadImageUsingCache(withUrl: "\(Constants.apiUrlImageW500)\(trending.posterPath)",
                            completion: { result in
                                switch result {
                                case .success(let image):
                                    cell.movieCover.image = image
                                    cell.activityIndicator.stopAnimating()
                                case .failure(_):
                                    cell.movieCover.image = UIImage()
                                }
                            })
        
        return cell
    }
    
    func loadImageUsingCache(withUrl urlString : String, completion: @escaping (Result<UIImage, Error>) -> Void) {

        let url = URL(string: urlString)
        if url == nil {return}
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                completion(.failure(error!))
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    completion(.success(image))
                }
                else {
                    let erro = NSError()
                    completion(.failure(erro))
                }
            }
            
        }).resume()
    }
}

extension TrendingView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trendingSelected = DataStore.trendingsDataStore.trending?.trendingsResults[indexPath.row] ?? TrendingsViewModel()
        onSelectedTrending?(trendingSelected)
    }
}
