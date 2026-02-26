# Badge Widget Demo 

## Description

A Flutter demo showcasing Badge widget, which displays small status indicators (such as unread message counts) on top of icons.
## Real-World Scenario

In many production apps like email or chat applications, a small number appears on an icon to indicate unread messages.
This demo recreates that behavior using Flutter’s Badge widget by showing the number of unread messages on a mail icon.

## How to Run the App

Make sure Flutter is installed on your machine.

1. Clone the repository:

```
git clone https://github.com/AgertuDA/Badge_widget_presentation.git
```
2. Navigate into the project directory:

```
cd badge_widget_presentation
```
6. Run the app:

```
flutter run
```

## Project Structure

```
badge_widget_presentation/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── android/
├── ios/
├── web/
├── linux/
├── macos/
├── windows/
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── badgeWidget-1.png
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

## Badge Properties

This demo focuses on exactly three Badge properties:

### 1. label

```
label: Text(unreadMessages.toString())
```

- Displays the content inside the badge.

- In this app, it shows the number of unread messages.

- By default, if no label is provided, the Badge appears as a small dot without any text.

- Developers use this property to clearly communicate counts such as unread messages, notifications, or items in a shopping cart.

### 2. isLabelVisible

```
isLabelVisible: showBadge
```

- Controls whether the badge is visible or hidden.

- By default, this value is true, so the badge is shown.

- In this app, it is toggled using a switch to simulate enabling or disabling notifications.

- Developers use this property to hide the badge when there is nothing important to show (for example, when the unread count is zero), keeping the user interface clean.

### 3. backgroundColor

```
backgroundColor: badgeColor
```

- Changes the background color of the badge.

- By default, the Badge uses a color derived from the app’s Material theme.

- In this app, the color can be changed dynamically using buttons.

- Developers use this property to represent different priorities or states, such as red for urgent alerts and other colors for less critical information.

## Screenshot


<img src="badgeWidget-1.png" alt="Badge Widget Demo Screenshot" width="250"/>
