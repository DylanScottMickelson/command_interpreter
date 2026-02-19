import 'dart:io';

class CommandData {
  String command;
  List<String> args;

  CommandData({required this.command, required this.args});

  Map toMap() {
    return {
      "command": command,
      "args": args,
    };
  }

  static CommandData fromMap(Map data) {
    return CommandData(
      command: data["command"] ?? "",
      args: data["args"] ?? List.empty(growable: true),
    );
  }

  Future<String> run() async {
    String resultString = "";
    try {
      ProcessResult result = await Process.run(
        command,
        args,
        runInShell: true,
        includeParentEnvironment: true,
      );
      String fullCommand = command;
      for (String arg in args) {
        fullCommand += " $arg";
      }
      resultString += "$fullCommand  ";
      resultString +=
          result.exitCode == 0 ? "🟢 Success!  " : "🔴 ${result.exitCode}  ";
      resultString += DateTime.now().toString();
      resultString += "\n\n";
      resultString += result.stdout.toString();
      resultString += result.stderr == "" ? "\n" : "${result.stderr}\n";
      return resultString;
    } catch (e) {
      return resultString = "🔴 Terminal Error";
    }
  }
}
