<br>

<p align="center">
   <img alt="Navigattie Logo" src="https://github.com/Mijick/Navigattie/assets/23524947/ea9f1fd8-0ee8-4064-87ca-baa316e44085" width="88%"">
</p>

<h3 style="font-size: 5em" align="center">
    Navigation made simple
</h3>
                                                                                                                                          
<p align="center">
    Implement navigation in your project in no time. Keep your code clean
</p>
                 
<p align="center">
    <a href="https://github.com/Mijick/Navigattie-Demo" rel="nofollow">Try demo we prepared</a>
</p>
                                                                      
<br>

<p align="center">
    <img alt="Library in beta version" src="https://github.com/Mijick/Navigattie/assets/23524947/b698aaac-4a91-431b-a7ef-f1dda28304b6"/>
    <img alt="Designed for SwiftUI" src="https://github.com/Mijick/Navigattie/assets/23524947/822de7e5-481e-49c0-b55b-653ac0de86bb"/>
    <img alt="Platforms: iOS" src="https://github.com/Mijick/Navigattie/assets/23524947/58399b94-5fa0-4c29-9013-ba52f6c3b63e"/>
    <img alt="Release: 0.3.2" src="https://github.com/Mijick/Navigattie/assets/23524947/3dd389f8-a8bd-4c2b-a3c6-3c089d05d1cb"/>
    <a href="https://www.swift.org/package-manager">
        <img alt="Swift Package Manager: Compatible" src="https://github.com/Mijick/Navigattie/assets/23524947/a4876e58-6a26-40c3-97bb-b5e6f69423d9"/>
    </a>
    <img alt="License: MIT" src="https://github.com/Mijick/Navigattie/assets/23524947/de233cae-4517-462a-86ac-5618f91b1d4a"/>
</p>

<p align="center">
    <a href="https://github.com/Mijick/Navigattie/stargazers">
        <img alt="Stars" src="https://github.com/Mijick/Navigattie/assets/23524947/f9d35612-7925-4b8e-99ad-74c983f59293"/>
    </a>                                                                                                                  
    <a href="https://twitter.com/MijickTeam">
        <img alt="Follow us on Twitter" src="https://github.com/Mijick/Navigattie/assets/23524947/2d4d094e-36fa-48c5-8f92-46f5c1ce5c82"/>
    </a>
    <a href=mailto:team@mijick.com?subject=Hello>
        <img alt="Let's work together" src="https://github.com/Mijick/Navigattie/assets/23524947/803e0227-41fc-4d65-8ccb-ce5dfc1b4319"/>
    </a>
    <img alt="Made in Kraków" src="https://github.com/Mijick/Navigattie/assets/23524947/f18e87d5-6684-4aa6-9339-757e9b3fd83b"/> 
</p>

<p align="center">
    <img alt="Navigattie Examples" src="https://github.com/Mijick/Navigattie/assets/23524947/fa6af690-83ae-427f-9f77-01a144a55da7"/>
</p>

<br>

Navigattie is a free, and open-source library for SwiftUI that makes navigation easier and much cleaner.
* **Improves code quality.** Push your view using the `push(with:)` method.<br/>
    Pop the selected one with `pop()`. Simple as never.
* **Designed for SwiftUI.** While developing the library, we have used the power of SwiftUI to give you powerful tool to speed up your implementation process.

<br> 

# Getting Started
### ✋ Requirements

| **Platforms** | **Minimum Swift Version** |
|:----------|:----------|
| iOS 15+ | 5.0 |

### ⏳ Installation
    
#### [Swift package manager][spm]
Swift package manager is a tool for automating the distribution of Swift code and is integrated into the Swift compiler.

Once you have your Swift package set up, adding Navigattie as a dependency is as easy as adding it to the `dependencies` value of your `Package.swift`.

```Swift
dependencies: [
    .package(url: "https://github.com/Mijick/Navigattie", branch(“main”))
]
``` 
                      
<br>
    
# Usage
### 1. Setup library
Inside the `@main` structure, call the `implementNavigationView(config:)` method on the view that is to be the root view in your navigation structure. 
The view to be the root must be of type `NavigatableView`. The method takes an optional argument - `config`, that can be used to configure some modifiers for all navigation views in the application.
                      
```Swift
  var body: some Scene {
        WindowGroup {
            ContentView()
               .implementNavigationView(config: nil)                    
        }
  }
```
                      
### 2. Declare structure of the view you want to push
Navigattie provides the ability to push (or pop) any view using its built-in stack. In order to do so, it is necessary to confirm to `NavigatableView` protocol.
So that an example view you want to push will have the following declaration:
```Swift
struct ExampleView: NavigatableView {
    ...
}
```
                      
### 3. Implement `body` method
Fill your view with content
                      
```Swift
struct ExampleView: NavigatableView {    
    var body: some View {
        VStack(spacing: 0) {
            Text("Witaj okrutny świecie")
            Spacer()
            Button(action: pop) { Text("Pop") } 
        }
    }
    ...
}
```
                      
### 4. Implement `configure(view: NavigationConfig) -> NavigationConfig` method
*This step is optional - if you wish, you can skip this step and leave the configuration as default.*<br/>
Each view has its own set of methods that can be used to customise it, regardless of the config we mentioned in **step 1**.
                      
```Swift
struct ExampleView: NavigatableView {   
    func configure(view: NavigationConfig) -> NavigationConfig { view.backgroundColour(.red) }
    var body: some View {
        VStack(spacing: 0) {
            Text("Witaj okrutny świecie")
            Spacer()
            Button(action: pop) { Text("Pop") } 
        }
    }
    ...
}
```
                      
### 5. Present your view from any place you want!
Just call `ExampleView().push(with:)` from the selected place
                      
```Swift
struct SettingsViewModel {
    ...
    func openSettings() {
        ...
        ExampleView().push(with: .verticalSlide)
        ...
    }
    ...
}
```
                      
### 6. Closing views
There are two ways to do so:
- By calling one of the methods `pop`, `pop(to type:)`, `popToRoot` inside any view
                      
```Swift
struct ExampleView: NavigatableView {
    ...
    func createButton() -> some View {
        Button(action: popToRoot) { Text("Tap to return to root") } 
    }
    ...
}
```
- By calling one of the static methods of NavigationManager:
    - `NavigationManager.pop()`
    - `NavigationManager.pop(to type:)` where type is the type of view you want to return to
    - `NavigationManager.popToRoot()`   
                      
<br>
      
# Try our demo
See for yourself how does it work by cloning [project][Demo] we created
                      
# License
Navigattie is released under the MIT license. See [LICENSE][License] for details.
                      
<br><br>
                      
# Our other open source SwiftUI libraries
[PopupView] - The most powerful popup library that allows you to present any popup
                    
                      
[MIT]: https://en.wikipedia.org/wiki/MIT_License
[SPM]: https://www.swift.org/package-manager
                      
[Demo]: https://github.com/Mijick/Navigattie-Demo
[License]: https://github.com/Mijick/Navigattie/blob/main/LICENSE
                     
[PopupView]: https://github.com/Mijick/PopupView           
