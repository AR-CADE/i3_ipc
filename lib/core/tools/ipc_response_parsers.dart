import 'dart:convert';

import 'package:i3_ipc/data/models/binding_state.dart';
import 'package:i3_ipc/data/models/config.dart';
import 'package:i3_ipc/data/models/input.dart';
import 'package:i3_ipc/data/models/ipc_response.dart';
import 'package:i3_ipc/data/models/node.dart';
import 'package:i3_ipc/data/models/output.dart';
import 'package:i3_ipc/data/models/seat.dart';
import 'package:i3_ipc/data/models/status.dart';
import 'package:i3_ipc/data/models/version.dart';
import 'package:i3_ipc/data/models/workspace.dart';

List<Workspace> parseWorkspaces(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final workspaces = <Workspace>[];

  for (final e in iterable) {
    workspaces.add(Workspace.fromJson(e! as Map<String, Object?>));
  }
  return workspaces;
}

Version? parseVersion(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Version.fromJson(jsonBody as Map<String, Object?>);
}

Node? parseTree(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Node.fromJson(jsonBody as Map<String, Object?>);
}

List<Seat> parseSeats(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final seats = <Seat>[];

  for (final e in iterable) {
    seats.add(Seat.fromJson(e! as Map<String, Object?>));
  }
  return seats;
}

List<Output> parseOutputs(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final outputs = <Output>[];

  for (final e in iterable) {
    outputs.add(Output.fromJson(e! as Map<String, Object?>));
  }
  return outputs;
}

List<String> parseMarks(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final marks = <String>[];

  for (final e in iterable) {
    marks.add(e! as String);
  }
  return marks;
}

List<Input> parseInputs(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final inputs = <Input>[];

  for (final e in iterable) {
    inputs.add(Input.fromJson(e! as Map<String, Object?>));
  }
  return inputs;
}

Config? parseConfig(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Config.fromJson(jsonBody as Map<String, Object?>);
}

BindingState? parseBindingState(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return BindingState.fromJson(jsonBody as Map<String, Object?>);
}

List<String> parseBindingModes(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final modes = <String>[];

  for (final e in iterable) {
    modes.add(e! as String);
  }
  return modes;
}

List<String> parseBarConfig(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return [];
  }
  final jsonBody = jsonDecode(payload);
  final iterable = jsonBody as Iterable<Object?>;

  final confgs = <String>[];

  for (final e in iterable) {
    confgs.add(e! as String);
  }
  return confgs;
}

Status? parseStatus(IPCResponse? response) {
  final payload = response?.payload;
  if (payload == null) {
    return null;
  }
  final jsonBody = jsonDecode(payload);

  return Status.fromJson(jsonBody as Map<String, Object?>);
}
