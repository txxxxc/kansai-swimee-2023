import UIKit

class PokemonDetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    var pokemonImage: UIImage? = nil
    var pokemon: Pokemon? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let pokemonImage = pokemonImage, let pokemon = pokemon else { return }
        nameLabel.text = pokemon.name
        heightLabel.text = "\(String(pokemon.height/10))m"
        imageView.image = pokemonImage
    }
    
}
