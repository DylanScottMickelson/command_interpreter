import 'dart:io';
import 'package:command_interpreter/models/command_data.dart';
import 'package:command_interpreter/models/current_platform.dart';
import 'libraries/windows_commands.dart';
import 'libraries/linux_commands.dart';
import 'libraries/macos_commands.dart';

class CommandInterpreter {
  /// Get Current Platform : Function
  static CurrentPlatform __getPlatform() {
    if (Platform.isWindows) {
      return CurrentPlatform.windows;
    } else if (Platform.isMacOS) {
      return CurrentPlatform.macos;
    } else if (Platform.isLinux) {
      return CurrentPlatform.linux;
    } else {
      return CurrentPlatform.windows;
    }
  }

  /// Main Interpreter Switch : Function
  static CommandData getPlatformCommand(CommandData command) {
    CurrentPlatform platform = __getPlatform();
    switch (platform) {
      case CurrentPlatform.windows:
        return WindowsCommandLibrary.getInterpretedCommand(command);
      case CurrentPlatform.linux:
        return LinuxCommandLibrary.getInterpretedCommand(command);
      case CurrentPlatform.macos:
        return MacCommandLibrary.getInterpretedCommand(command);
      case CurrentPlatform.web:
        return command;
    }
  }
}
