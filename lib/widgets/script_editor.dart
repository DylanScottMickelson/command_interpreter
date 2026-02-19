import 'package:command_interpreter/models/app_style.dart';
import 'package:command_interpreter/models/command_data.dart';
import 'package:command_interpreter/models/script_data.dart';
import 'package:flutter/material.dart';

class ScriptEditor extends StatefulWidget {
  final ScriptData script;
  const ScriptEditor(this.script, {super.key});

  @override
  State<ScriptEditor> createState() => _ScriptEditorState();
}

class _ScriptEditorState extends State<ScriptEditor> {
  ScriptData newScript = ScriptData(
    name: "",
    commands: List.empty(growable: true),
  );
  CommandData newCommand = CommandData(
    command: "",
    args: List.empty(growable: true),
  );

  void _initNewScript() {
    newScript = widget.script;
  }

  void _addCommand() {
    newScript.commands.add(newCommand);
    newCommand = CommandData(command: "", args: List.empty(growable: true));
    setState(() {});
  }

  void _removeCommand(CommandData commandData) {
    newScript.commands.removeWhere((element) => element == commandData);
    setState(() {});
  }

  void _editCommand(String name, String value, int index) {
    switch (name) {
      case "Command":
        {
          newScript.commands[index].command = value;
        }
        break;
      case "Arguments":
        {
          newScript.commands[index].args = value.split(" ");
        }
        break;
      default:
        break;
    }
    setState(() {});
  }

  void _onValueChanged(String inputName, String value, int i) {
    switch (inputName) {
      case "Script Name":
        {
          newScript.name = value;
        }
        break;
      case "New Command":
        {
          newCommand.command = value;
        }
        break;
      case "New Arguments":
        {
          newCommand.args = List.from(value.split(" "), growable: true);
        }
        break;
      case "Command":
        {
          _editCommand("Command", value, i);
        }
        break;
      case "Arguments":
        {
          _editCommand("Arguments", value, i);
        }
        break;
      default:
        break;
    }
    setState(() {});
  }

  void _deleteScript(BuildContext context) async {}

  void _saveScript() async {}

  Widget _buildActionRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Script Editor", style: AppStyle.getHintStyle()),
        Row(
          children: [
            IconButton(
              onPressed: () => _deleteScript(context),
              icon: const Icon(Icons.delete, color: Colors.black),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).pop(null),
              icon: const Icon(Icons.clear, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _addCommandRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.369, horizontal: 4.369),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.369),
              child: TextFormField(
                onChanged: (val) => _onValueChanged("New Command", val, 0),
                decoration: AppStyle.getDefaultInputDecoration("Command"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.369),
              child: TextFormField(
                onChanged: (val) => _onValueChanged("New Arguments", val, 0),
                decoration: AppStyle.getDefaultInputDecoration("Arguments"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.369),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.369),
                color: Colors.black26,
              ),
              clipBehavior: Clip.hardEdge,
              child: MaterialButton(
                onPressed: _addCommand,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _editableCommandRow(CommandData command, int index) {
    String arguments = "";
    for (String argument in command.args) {
      arguments += ("$argument ");
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.369, horizontal: 4.369),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.369),
              child: TextFormField(
                onChanged: (val) => _editCommand("Command", val, index),
                initialValue: command.command,
                decoration: AppStyle.getDefaultInputDecoration("Command"),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.369),
              child: TextFormField(
                onChanged: (val) => _editCommand("Arguments", val, index),
                initialValue: arguments,
                decoration: AppStyle.getDefaultInputDecoration("Arguments"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.369),
            child: Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9.369),
                color: Colors.black26,
              ),
              clipBehavior: Clip.hardEdge,
              child: MaterialButton(
                onPressed: () => _removeCommand(command),
                child: const Icon(
                  Icons.horizontal_rule_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSaveButton() {
    return Padding(
      padding: const EdgeInsets.all(9.369),
      child: Container(
        width: 69,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.369),
          color: Colors.green,
        ),
        clipBehavior: Clip.hardEdge,
        child: MaterialButton(
          onPressed: _saveScript,
          padding: EdgeInsets.zero,
          minWidth: 69,
          child: Padding(
            padding: const EdgeInsets.all(3.369),
            child: Text("Save", style: AppStyle.getHintStyle()),
          ),
        ),
      ),
    );
  }

  Widget _buildScriptEditorBody(Size ss) {
    return SizedBox(
      width: (ss.width >= 840) ? 444 : ss.width,
      height: (ss.width >= 840) ? 333 : ss.width * 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(9.369),
            child: TextFormField(
              initialValue: widget.script.name,
              decoration: AppStyle.getDefaultInputDecoration("Script Name"),
              onChanged: (val) => _onValueChanged("Script Name", val, 0),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 9.369),
              child: ListView(
                controller: ScrollController(),
                children: List.generate(widget.script.commands.length + 1, (
                  index,
                ) {
                  if (widget.script.commands.isEmpty ||
                      index + 1 > widget.script.commands.length) {
                    return _addCommandRow();
                  } else {
                    return _editableCommandRow(
                      widget.script.commands[index],
                      index,
                    );
                  }
                }),
              ),
            ),
          ),
          _buildSaveButton(),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initNewScript();
  }

  @override
  Widget build(BuildContext context) {
    Size ss = MediaQuery.of(context).size;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13.369),
      ),
      contentPadding: EdgeInsets.zero,
      semanticLabel: "Script Editor",
      title: _buildActionRow(),
      content: _buildScriptEditorBody(ss),
    );
  }
}
