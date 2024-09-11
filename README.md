# Unreferenced Libraries

This is a sample project to demonstrate the unreferenced libraries issue in dart eval.

## How to run

Run the `example` project.

```bash
cd example
flutter run -d chrome
```

Get the VM Service url from the console.

Run the `devtool` project.

```bash
cd devtool
flutter run -d chrome --dart-define=use_simulated_environment=true
```

Use the VM Service url to connect to the debug session.

See the error.

If you run on a native platform, you'll noticed that it works fine.

```bash
cd example
flutter run -d macos
```
