import 'package:command_interpreter/command_interpreter.dart';
import 'package:command_interpreter/widgets/script_editor.dart';
import 'package:flutter/material.dart';

import 'command_data.dart';

class ScriptData {
  String name;
  List commands;

  ScriptData({required this.name, required this.commands});

  Map toMap() {
    List c = List.empty(growable: true);
    for (CommandData commandData in commands) {
      c.add(commandData.toMap());
    }
    return {"name": name, "commands": c};
  }

  static ScriptData fromMap(Map data) {
    List gc = List.from(data["commands"]);
    List cc = List.empty(growable: true);
    for (Map commandData in gc) {
      cc.add(CommandData.fromMap(commandData));
    }
    return ScriptData(name: data["name"] ?? "Script Name", commands: cc);
  }

  static final List<ScriptData> defualtScripts = [
    ScriptData(
      name: "help",
      commands: [CommandData(command: "help", args: [])],
    ),
    ScriptData(
      name: "cd",
      commands: [CommandData(command: "cd", args: [])],
    ),
    ScriptData(
      name: "code",
      commands: [CommandData(command: "code", args: [])],
    ),
    ScriptData(
      name: "flutter doctor",
      commands: [
        CommandData(command: "flutter", args: ["doctor"]),
      ],
    ),
    ScriptData(
      name: "clear",
      commands: [CommandData(command: "clear", args: [])],
    ),
  ];

  Future<dynamic> edit(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return ScriptEditor(this);
      },
    );
  }

  Future<String> run() async {
    String result = "";
    for (CommandData command in commands) {
      CommandData pc = CommandInterpreter.getPlatformCommand(command);
      result += await pc.run();
    }
    return result;
  }
}
