# Currency Rate Flutter App(MVVM Architecture)

This Flutter application allows users to fetch currency exchange rates using a GET API. It is compatible with web, Android, and iOS platforms. The app is built using Flutter version 3.13.0 and utilizes various packages for functionality.

## Features

- Fetch currency exchange rates using a GET API.
- Cross-platform compatibility with web, Android, and iOS.
- Environment variables management using `.env` file.
- Utilizes the MVVM architecture for clean and efficient code.

## Dependencies

The following Flutter packages are used in this project:

- **flutter_dotenv**:  This package is used to manage environment variables using a `.env` file.

- **sizer**:  A responsive layout builder that allows for creating adaptive UIs.

- **dio**:  A powerful HTTP client for making API requests.

- **provider**:  A state management library for managing application state with MVVM.

- **cupertino_icons**: Cupertino-style icons for iOS.

- **pretty_dio_logger**:  A package for logging HTTP requests and responses in a readable format during debugging.

- **get_it**:  A service locator for dependency injection.

## Getting Started

1. Clone this repository to your local machine.

2. Create a `.env` file in the root directory of the project and add your API keys or other environment variables. Example:

   ```
   API_URL=https://api.example.com
   ```

   Ensure that you replace `API_URL` with the actual values required for your API.

3. Run the following command to install the dependencies:

   ```
   flutter pub get
   ```

4. Launch the app on your desired platform:

   - To run the app on Android, use `flutter run` on an Android device or emulator.
   - To run the app on iOS, use `flutter run` on a macOS device or simulator.
   - To run the app on the web, use `flutter run -d web`.

## Usage

Once the app is running, it will fetch and display currency exchange rates from the specified API based on the environment variables provided in the `.env` file.


