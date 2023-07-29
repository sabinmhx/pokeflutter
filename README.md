# PokeFlutter: Pokemon App in Flutter

📱 Install PokeFlutter now and start your journey to become a Pokemon Master! Gotta catch 'em all! 🌟

<img align="right" alt="Loading Screen" src="https://raw.githubusercontent.com/sabinmhx/pokeflutter/master/images/icon.png" height="190"/>


## Introduction

Pokeflutter is a mobile application developed using Flutter that brings the world of Pokemon to your fingertips. It allows users to explore the vast collection of Pokemon creatures, learn about their characteristics. Whether you're a seasoned Pokemon Trainer or a curious explorer, PokeFlutter promises an exciting and immersive experience.

## 🚀Features

- **Pokedex:** Browse through a comprehensive Pokedex with detailed information on various Pokemon species. View their types, abilities, evolutions, and base stats.

- **Pokemon Search:** Quickly find specific Pokemon by name or ID with an intuitive search feature.


## 📱Installation

Follow these steps to run the PokeFlutter app on your device:

1. Make sure you have Flutter installed. If not, refer to the official Flutter documentation to install it: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

2. Clone this repository to your local machine using:

    ```
    git clone https://github.com/sabinmhx/pokeflutter.git
    ```

3. Change your working directory to the cloned project:

    ```
    cd pokeflutter
    ```

4. Install the required dependencies:

    ```
    flutter pub get
    ```

5. Run the app on your preferred device/emulator:

    ```
    flutter run
    ```

## Project Structure

```
lib
├── app
│   ├── graphql
│   │   └── queries.dart
│   ├── model
│   │   └── pokemon_model.dart
│   ├── pages
│   │   ├── detail_page.dart
│   │   └── home_page.dart
│   └── widgets
│       └── fetch_more_widget.dart
└── main.dart
```

## 🛠️Dependencies

PokeFlutter uses the following main dependencies:

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - State management using the BLoC pattern.
- [graphql](https://pub.dev/packages/graphql) - A package for handling GraphQL queries and mutations.
- [dio](https://pub.dev/packages/dio) - For making API requests to fetch Pokemon data.
- [cached_network_image](https://pub.dev/packages/cached_network_image) - Caching network images to improve performance.

For a complete list of dependencies, check the `pubspec.yaml` file.

## Screenshots

<p float="left">
    <img alt="Loading Screen" src="https://raw.githubusercontent.com/sabinmhx/pokeflutter/master/images/screenshots/pokeflutter_loading_screen.png" width="200" height="400"/>
    <img alt="Home Page" src="https://raw.githubusercontent.com/sabinmhx/pokeflutter/master/images/screenshots/pokeflutter_home_page.png" width="200" height="400"/>
    <img alt="Details Page" src="https://raw.githubusercontent.com/sabinmhx/pokeflutter/master/images/screenshots/pokeflutter_details_page.png" width="200" height="400"/>
</p>


## 🤝Contribution

Contributions to PokeFlutter are welcome! If you find any issues or want to add new features, please create a pull request. Make sure to follow the established coding conventions and guidelines.

## 📄License

PokeFlutter is open-source and released under the [MIT License](LICENSE).

## 🙏Credits

- Pokemon data and images used in the app are sourced from [PokéAPI](https://pokeapi.co/).

## 📧Contact

For any questions or inquiries, please contact us at sabinmhx@gmail.com.

Enjoy exploring the Pokemon world with PokeFlutter! Gotta catch 'em all! 🌟
