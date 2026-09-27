# flutter-glassmorphism-bottom-navigation
A glassmorphism bottom navigation bar built from scratch in Flutter using BackdropFilter, blur, gradients, and animations.
# Glassmorphism Bottom Navigation

A glassmorphism bottom navigation bar built from scratch with Flutter, without using any UI package.

##  Features

* Glassmorphism effect
* Background blur using `BackdropFilter`
* Rounded corners with `ClipRRect`
* Gradient glass layer
* Subtle shadows and glow
* Animated selected item
* Responsive bottom navigation

##  Built With

* Flutter
* Dart
* `BackdropFilter`
* `ImageFilter.blur`
* `AnimatedContainer`
* `LinearGradient`

##  Preview
https://github.com/user-attachments/assets/fe1ff9c5-d490-4d63-b015-23e618b510ca



##  How It Works

The glass effect is created by combining:

* `BackdropFilter` with `ImageFilter.blur()` for the background blur
* `ClipRRect` to control the blurred area
* `LinearGradient` with transparency for the glass layer
* `BoxShadow` to add depth
* `AnimatedContainer` for the selected navigation item

No external package is required.

##  Getting Started

```bash
flutter pub get
flutter run
```

##  Alternative Packages

Similar effects can also be achieved using packages such as:

* `glass_bottom_navigation`
* `liquid_glass_bottom_navbar_plus`

This project was built from scratch to explore how the effect can be implemented using Flutter's built-in widgets.

##  License

This project is available for learning and experimentation.
