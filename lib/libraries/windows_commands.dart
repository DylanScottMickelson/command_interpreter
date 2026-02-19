import 'package:command_interpreter/models/command_data.dart';

class WindowsCommandLibrary {
  static CommandData _cd(String path) =>
      CommandData(command: "cd", args: [path]);
  static CommandData _cFolder(String name) =>
      CommandData(command: "mkdir", args: [name]);
  static CommandData _gFolder(String path) =>
      CommandData(command: "dir", args: [path]);
  static CommandData _copyDoc(String path) =>
      CommandData(command: "copy", args: [path]);
  static final CommandData _openOSFiles = CommandData(
    command: "explorer",
    args: [""],
  );

  static CommandData getInterpretedCommand(CommandData command) {
    switch (command.command) {
      case "cd":
        return _cd(command.args.isEmpty ? "" : command.args[0]);
      case "mkdir":
        return _cFolder(command.args[0]);
      case "cp":
        return _copyDoc(command.args[0]);
      case "ls":
        return _gFolder(command.args[0]);
      case "dir":
        return _gFolder(command.args[0]);
      case "pwd":
        return _cd("");
      case "OpenFiles":
        return _openOSFiles;
      case "LocalFiles":
        return _openOSFiles;
      case "explorer":
        return _openOSFiles;
      case "files":
        return _openOSFiles;
      default:
        return command;
    }
  }
}
