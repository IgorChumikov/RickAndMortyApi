
//  HeroTableViewCell.swift
//  RickAndMortyApi
//
//  Created by Игорь Чумиков on 26.09.2021.
//

import UIKit

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroImage: UIImageView! {
        didSet {
            heroImage.contentMode = .scaleAspectFit
            heroImage.clipsToBounds = true
            heroImage.layer.cornerRadius = heroImage.frame.height / 2
            heroImage.backgroundColor = .white
        }
    }
    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroStatus: UILabel!
    @IBOutlet weak var heroSpecies: UILabel!
    
    // MARK: - Public methods
    func configure(with results: Result?) {
        
        heroName.text = "\(results?.name ?? "")"
        alive(status: results?.status)
        heroSpecies.text = "\(results?.species ?? "")"
        
        DispatchQueue.global().async {
            guard let stringUrl = results?.image else { return }
            guard let imageUrl = URL(string: stringUrl) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.heroImage.image = UIImage(data: imageData)
            }
        }
    }
    func alive(status: String?) {
        if status == "Alive" {
            heroStatus.shadowColor = .green
            heroStatus.text = "\(status ?? "")"
        } else {
            heroStatus.shadowColor = .red
            heroStatus.text = "\(status ?? "")"
        }
    }
}
