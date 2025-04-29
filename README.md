# 🚑 Rakta - Blood Donation Management App

Rakta is a modern blood donation management app designed to simplify finding and requesting blood donors based on location and blood group.  
Built for **organizations** and **heroes** who save lives every day. ❤️

---

## ✨ Features

- Smooth animated onboarding and login
- Floating premium logo animations
- Select Blood Group, Province, District, Municipality
- Prepare to connect **Supabase** as backend
- Future integration with **Sparrow SMS** for notifying donors
- Professional UI (iOS and Android friendly)

---

## 📲 Screens Overview

| Screen              | Purpose                                        |
| ------------------- | ---------------------------------------------- |
| **First Screen**    | Rakta branding logo + Save Life button         |
| **Login Screen**    | Email and Password login                       |
| **Home Screen**     | Welcome dashboard + Saved Lives + Donors stats |
| **Action Screen**   | Dropdowns for selecting blood group + area     |
| **Complete Screen** | Success tick animation after request           |

---

## 📦 Folder Structure

```
lib/
 ├── main.dart
 ├── screens/
 │    ├── loginScreen.dart
 │    ├── homeScreen.dart
 │    ├── actionScreen.dart
 │    ├── completeScreen.dart
 ├── widgets/
 │    ├── customDropdown.dart
 │    ├── floatingButton.dart
 │    ├── locationData.dart
 │    ├── loginFields.dart
 │    ├── loginButton.dart
 ├── utils/
 │    ├── constants.dart
```

---

## 🛠 Tech Stack

- Flutter 3.x (null safety)
- Lottie Animations (Planned for tick animation)
- Supabase (planned for backend)
- Sparrow SMS API (planned for messaging)

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/iamsulavgautam/rakta.git
cd rakta
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the App

```bash
flutter run
```

Make sure you are connected to a device (emulator or physical).

---

## 🖼 Assets

| Type   | Path          |
| ------ | ------------- |
| Images | `assets/img/` |

Assets required:

- `rakta.png`
- `getBlood.png`
- `requestBlood.png`

> Assets are properly declared inside `pubspec.yaml`.

---

## 🌍 Planned Backend Setup (For Backend Developer)

- **Supabase Authentication** (`supabase_flutter`)
- **Supabase Database** to store donor information
- **Sparrow SMS API** to send emergency SMS to matching blood donors
- Bulk donor import via CSV (Admin Panel planned separately)

---

## ⚙️ Environment

| Dependency       | Version |
| ---------------- | ------- |
| Flutter SDK      | 3.7.2   |
| supabase_flutter | 1.0.0   |
| lottie           | 2.2.0   |

---

## 📢 Contribution Guide

- Follow the existing UI structure and theme.
- Backend logic should be added **without disturbing UI**.
- Create a new service file inside `services/` if adding new logic (e.g., `supabaseService.dart`, `smsService.dart`).
- PRs should be clean and well-documented.

---

## 👌 Special Thanks

This app is dedicated to all real-life blood donors and heroes who save lives selflessly.  
**You are the true Rakta warriors.** 🩸❤️

---

## 🔥 Author

Developed with ❤️ by **Sulav Gautam**.

_If you love this project, star it ⭐ and contribute!_

---

# 🩸 Let's Save Lives, One Drop at a Time!

---
