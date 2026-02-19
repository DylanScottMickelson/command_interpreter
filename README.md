 # 🤖 Command Interpreter: A Cross-Platform Command Interpreter for Flutter Desktop Apps

Welcome to `command_interpreter`, a powerful and versatile command interpreter package for Flutter desktop applications. This library allows you to run single commands or scripts (a list of commands) on Linux, MacOS, and Windows platforms seamlessly. Run windows commands on linux or linux commands on windows or create your own custom interpreted commands.

## 📑 Table of Contents
1. [Getting Started](#getting-started)
2. [Usage](#usage)
    * [Running Single Commands with `CommandData`](#running-single-commands-with-commanddata)
    * [Defining and Running Multiple Commands in a Script with `ScriptData`](#defining-and-running-multiple-commands-in-a-script-with-scriptdata)
3. [Using the Interpreter Manually](#using-the-interpreter-manually)
4. [Contributing](#contributing)
5. [License](#license)

## 🚀 Getting Started <a name="getting-started"></a>
This package provides a simple interface for executing commands and scripts on the current operating system from within your Flutter desktop application. To get started, follow these steps:

1. Create a `packages` folder in the root folder of your flutter app then add the `command_interpreter` package folder to it.

2. Add `command_interpreter` as a dependency in your `pubspec.yaml` file:
   ```
   dependencies:
     command_interpreter: ^0.1.0 # Replace with the latest version
       path: packages/command_interpreter/
    
   ```
3. Import the package files into your code:
   ```dart
   import 'package:command_interpreter/command_interpreter.dart';
   import 'package:command_interpreter/models/command_data.dart';
   import 'package:command_interpreter/models/script_data.dart';
   ```

## 👨‍💻 Usage <a name="usage"></a>

### 1️⃣ Running Single Commands with `CommandData` <a name="running-single-commands-with-commanddata"></a>
Use the `run()` method to execute a single command using a `CommandData` object:

```dart
import 'package:flutter/material.dart';
import 'package:command_interpreter/models/command_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void runCommand() async {
    String command = "echo";
    List<String> args = ["Hello"];
    CommandData commandData = CommandData(command: command, args: args);
    String result = await commandData.run();
    print('Output: $result');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Command Interpreter')),
        body: Center(
          child: ElevatedButton(
            onPressed: runCommand,
            child: const Text('Run Command'),
          ),
        ),
      ),
    );
  }
}
```

### 🔢 Defining and Running Multiple Commands in a Script with `ScriptData` <a name="defining-and-running-multiple-commands-in-a-script-with-scriptdata"></a>
Use the `run()` method to execute multiple commands defined in a script using a `ScriptData` object:

```dart
import 'package:flutter/material.dart';
import 'package:command_interpreter/models/script_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  void runScript() async {
    List<CommandData> commands = [
      CommandData(command: "ls"),
      CommandData(command: "echo", args: ["Hello"]),
    ];
    ScriptData scriptData = ScriptData(name: "script_name", commands: commands);
    String result = await scriptData.run();
    print('Output: $result');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Command Interpreter')),
        body: Center(
          child: ElevatedButton(
            onPressed: runScript,
            child: const Text('Run Script'),
          ),
        ),
      ),
    );
  }
}
```

## ⚙️ Using the Interpreter Manually <a name="using-the-interpreter-manually"></a>
The `CommandInterpreter` class automatically injects platform-specific commands in the `ScriptData` and `CommandData` run functions by utilizing the appropriate command libraries (`WindowsCommandLibrary`, `MacCommandLibrary`, or `LinuxCommandLibrary`) based on the current operating system.

Use the command interpreter manually anywhere in your dart code:
```dart
  import 'package:command_interpreter/command_interpreter.dart';
  import 'package:command_interpreter/models/command_data.dart';

  String command = "echo";
  List<String> args = ["Hello"];
  CommandData commandData = CommandData(command: command, args: args);
  CommandData interpretedCommand = CommandInterpreter.getInterpretedCommand(commandData);
  final result = await interpretedCommand.run();

```

To add custom platform-specific commands, create a new library or edit the current libraries (`WindowsCommandLibrary`, `MacCommandLibrary`, or `LinuxCommandLibrary`) with the appropriate name and methods for each command you want to support.

## 👐 Contributing <a name="contributing"></a>
We welcome any contributions to this project! If you have an idea or feature request, please submit an issue in our [repository](https://github.com/DylanScottMickelson/command_interpreter).

## 🪪 License <a name="license"></a>
This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.
