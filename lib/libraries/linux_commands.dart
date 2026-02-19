import 'package:command_interpreter/models/command_data.dart';

class LinuxCommandLibrary {
  static CommandData _cd(String path) =>
      CommandData(command: "cd", args: [path]);
  static CommandData _cFolder(String name) =>
      CommandData(command: "mkdir", args: [name]);
  static CommandData _gFolder(String path) =>
      CommandData(command: "ls", args: [path]);
  static CommandData _copyDoc(String path) =>
      CommandData(command: "cp", args: [path]);
  static CommandData touch(String name) =>
      CommandData(command: "touch", args: [name]);

  ///Main Command Interpreter Function
  static CommandData getInterpretedCommand(CommandData command) {
    switch (command.command) {
      case "cd":
        return _cd(command.args[0]);
      case "dir":
        return _gFolder(command.args[0]);
      case "ls":
        return _gFolder(command.args[0]);
      case "cp":
        return _copyDoc(command.args[0]);
      case "copy":
        return _copyDoc(command.args[0]);
      case "mkdir":
        return _cFolder(command.args[0]);
      case "mk":
        return _cFolder(command.args[0]);
      case "create":
        return touch(command.args[0]);
      case "touch":
        return touch(command.args[0]);
      default:
        return command;
    }
  }
}
