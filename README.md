# 📱 Aplicación de Signo Zodiacal y Horóscopo Chino 🌟

![Pantalla Principal](screenshots/main_screen.png) | ![Resultados](screenshots/results_screen.png)

## 📌 Descripción

Aplicación móvil desarrollada en Flutter que permite:

- Determinar tu signo zodiacal occidental según tu fecha de nacimiento
- Descubrir tu animal del horóscopo chino
- Conocer las características principales de cada uno
- Visualizar imágenes representativas de cada signo y animal

## ✨ Características Principales

- **Interfaz intuitiva** con diseño atractivo
- **Pantalla de selección de fecha** con calendario integrado
- **Resultados detallados** con imágenes y características
- **Sistema de cálculo automático** de signos
- **Diseño responsive** para todos los dispositivos móviles
- **Tema oscuro/claro** adaptable al sistema
- **Sección de ayuda** con instrucciones

## 🛠 Estructura del Proyecto
```bash
lib/
├── main.dart # Punto de entrada principal
├── screens/
│ ├── fecha_screen.dart # Pantalla de selección de fecha
│ ├── resultados_screen.dart # Pantalla de resultados
│ └── ayuda_screen.dart # Pantalla de ayuda/información
├── models/
│ ├── zodiaco_data.dart # Datos de signos zodiacales
│ └── chino_data.dart # Datos de horóscopo chino
assets/
├── zodiaco/ # Imágenes de signos
│ ├── aries.png
│ ├── tauro.png
│ └── ...
└── chino/ # Imágenes de animales
├── rata.png
├── buey.png
└── ...
```

## 🚀 Cómo Ejecutar el Proyecto

1. **Clonar el repositorio**:
```bash
git clone https://github.com/tuusuario/app_zodiaco.git
cd app_zodiaco
```
Obtener dependencias:

```bash
flutter pub get
```
Ejecutar la aplicación:

```bash
flutter run
```
## 📦 Generar APK para Android
Para crear el archivo APK:

```bash
flutter build apk --release
```
El APK se generará en:
- build/app/outputs/flutter-apk/app-release.apk

## 🔧 Requisitos
- Flutter SDK (versión estable más reciente)
- Dart SDK
- Android Studio/Xcode (para emuladores)
- Dispositivo físico o emulador para pruebas

## 🖼 Assets Necesarios
Colocar en las respectivas carpetas:

**Signos Zodiacales (assets/zodiaco/):**
- aries.png, tauro.png, geminis.png, cancer.png, leo.png, virgo.png
- libra.png, escorpion.png, sagitario.png, capricornio.png, acuario.png, piscis.png
**Animales Chinos (assets/chino/):**
- rata.png, buey.png, tigre.png, conejo.png, dragon.png, serpiente.png
- caballo.png, cabra.png, mono.png, gallo.png, perro.png, cerdo.png

## ⚙ Configuración
Asegúrate de incluir los assets en pubspec.yaml:

```yaml
flutter:
  assets:
    - assets/zodiaco/
    - assets/chino/
```