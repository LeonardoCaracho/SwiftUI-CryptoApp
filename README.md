# SwiftUI - Crypto App 

An App developed using Swift and SwiftUI to track your crypto currencies portfolio.  

<p>
  <img width="300px" src="https://raw.githubusercontent.com/LeonardoCaracho/ios-CryptoApp/main/screenshots/screenshot-1.png?token=GHSAT0AAAAAACEMZ5KTGFBJI56RA5XC5OTSZHD6M7A">
  <img width="300px" src="https://raw.githubusercontent.com/LeonardoCaracho/ios-CryptoApp/main/screenshots/screenshot-3.png?token=GHSAT0AAAAAACEMZ5KS3ND2FWGBAXIJRZ3UZHD6OPA">
</p>

<p>
  <img width="300px" src="https://raw.githubusercontent.com/LeonardoCaracho/ios-CryptoApp/main/screenshots/screenshot-4.png?token=GHSAT0AAAAAACEMZ5KSGOJPYIOJ3S6TQ3O4ZHD6ORA">
  <img width="300px" src="https://raw.githubusercontent.com/LeonardoCaracho/ios-CryptoApp/main/screenshots/screenshot-2.png?token=GHSAT0AAAAAACEMZ5KS6ADXQKCZRD4WVPSQZHD6N6A">
</p>

## Related Tutorials

- [Swiftul Thinking - SwiftUI Crypto App Playlist](https://www.youtube.com/playlist?list=PLwvDm4Vfkdphbc3bgy_LpLRQ9DDfFGcFu)

## Supported Features

- [x] Scroll through a list of the most famous crypto currencies, and check details of each.
- [x] Update your holdings adding currencies to your portfolio.

## App Architecture

The App is architected using MVVM (Model - View - ViewModel), estabilishing a very clear separation of concerns, turning the codebase more easy to read and to scale.

## The app uses
- [Core Data](https://developer.apple.com/documentation/coredata) to cache the user portfolio. 
- [File Manager](https://developer.apple.com/documentation/foundation/filemanager) to cache the currencies images. 
- [Combine](https://developer.apple.com/documentation/combine) to manager the network requests.

*The crypto currency used on this app comes from a free Api from CoinGecko! Prices might be slightly delayed.