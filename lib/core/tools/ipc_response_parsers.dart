import 'dart:convert';

import 'package:i3_ipc/data/models/binding_state.dart';
import 'package:i3_ipc/data/models/config.dart';
import 'package:i3_ipc/data/models/input.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/models/node.dart';
import 'package:i3_ipc/data/models/output.dart';
import 'package:i3_ipc/data/models/seat.dart';
import 'package:i3_ipc/data/models/version.dart';
import 'package:i3_ipc/data/models/workspace.dart';

List<Workspace> parseWorkspaces(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final workspaces = <Workspace>[];

  for (final e in iterable) {
    workspaces.add(Workspace.fromJSON(e as Map<String, dynamic>));
  }
  return workspaces;
}

Version? parseVersion(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Version.fromJSON(jsonBody as Map<String, dynamic>);
}

Node? parseTree(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Node.fromJSON(jsonBody as Map<String, dynamic>);
}

List<Seat> parseSeats(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final seats = <Seat>[];

  for (final e in iterable) {
    seats.add(Seat.fromJSON(e as Map<String, dynamic>));
  }
  return seats;
}

List<Output> parseOutputs(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final outputs = <Output>[];

  for (final e in iterable) {
    outputs.add(Output.fromJSON(e as Map<String, dynamic>));
  }
  return outputs;
}

List<String> parseMarks(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final marks = <String>[];

  for (final e in iterable) {
    marks.add(e as String);
  }
  return marks;
}

List<Input> parseInputs(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final inputs = <Input>[];

  for (final e in iterable) {
    inputs.add(Input.fromJSON(e as Map<String, dynamic>));
  }
  return inputs;
}

Config? parseConfig(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Config.fromJSON(jsonBody as Map<String, dynamic>);
}

BindingState? parseBindingState(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return BindingState.fromJSON(jsonBody as Map<String, dynamic>);
}

List<String> parseBindingModes(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final modes = <String>[];

  for (final e in iterable) {
    modes.add(e as String);
  }
  return modes;
}

List<String> parseBarConfig(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<dynamic>;

  final confgs = <String>[];

  for (final e in iterable) {
    confgs.add(e as String);
  }
  return confgs;
}
